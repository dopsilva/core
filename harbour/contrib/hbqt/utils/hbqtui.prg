/*
 * $Id$
 */

/*
 * Harbour Project source code:
 * Source file for the Xbp*Classes
 *
 * Copyright 2010 Pritpal Bedi <bedipritpal@hotmail.com>
 * http://harbour-project.org
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA (or visit the web site http://www.gnu.org/).
 *
 * As a special exception, the Harbour Project gives permission for
 * additional uses of the text contained in its release of Harbour.
 *
 * The exception is that, if you link the Harbour libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the Harbour library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the Harbour
 * Project under the name Harbour.  If you copy code from other
 * Harbour Project or Free Software Foundation releases into a copy of
 * Harbour, as the General Public License permits, the exception does
 * not apply to the code that you add in this way.  To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for Harbour, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 *
 */
/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/
/*
 *                               EkOnkar
 *                         ( The LORD is ONE )
 *
 *                     Harbour Utility .ui => .prg
 *
 *                Pritpal Bedi <bedipritpal@hotmail.com>
 *                              22Jun2010
 */
/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/

#include "common.ch"

/*----------------------------------------------------------------------*/

#define STRINGIFY( cStr )    '"' + cStr + '"'
#define PAD_30( cStr )       padr( cStr, max( len( cStr ), 20 ) )
#define STRIP_SQ( cStr )     strtran( strtran( strtran( strtran( s, "[", " " ), "]", " " ), "\n", " " ), chr( 10 ), " " )

/*----------------------------------------------------------------------*/

ANNOUNCE HB_GTSYS
REQUEST HB_GT_CGI_DEFAULT

PROCEDURE Main( ... )
   LOCAL s, cL, cExt, cPath, cFile
   LOCAL cCmd, cUic, cPrg, cUiFile
   LOCAL cPathOut := ""
   LOCAL aUI :={}, a_, aUiFiles := {}
   LOCAL lToPath := .f.

   LOCAL aResult

   FOR EACH s IN hb_aParams()
      cL := lower( alltrim( s ) )

      DO CASE
      CASE left( cL, 1 ) == "@"
         aadd( aUiFiles, substr( s, 2 ) )

      CASE left( cL, 2 ) == "-o"
         cPathOut := alltrim( substr( s, 3 ) )
         cPathOut := strtran( cPathOut, "\", "/" )
         lToPath  := right( cPathOut, 1 ) == "/"

      OTHERWISE
         s := StrTran( s, "\", "/" )
         hb_fNameSplit( s, , , @cExt )
         IF lower( cExt ) == ".ui"
            aadd( aUI, s )
         ENDIF

      ENDCASE
   NEXT

   FOR EACH cUiFile IN aUiFiles
      a_:= hb_ATokens( StrTran( hb_MemoRead( cUiFile ), Chr( 13 ) ), Chr( 10 ) )
      FOR EACH s IN a_
         s := alltrim( s )
         IF ! Empty( s )
            IF left( s, 1 ) $ "#;"
               LOOP
            ENDIF
            s := StrTran( s, "/", hb_osPathSeparator() )
            s := StrTran( s, "\", hb_osPathSeparator() )
            IF hb_fileExists( s )
               aadd( aUI, StrTran( s, "\", "/" ) )
            ENDIF
         ENDIF
      NEXT
   NEXT

   FOR EACH s IN aUI
      hb_fNameSplit( s, @cPath, @cFile, @cExt )

      cUic := cPath + cFile + ".uic" /* always to be created along .ui */
      cPrg := iif( lToPath, cPathOut + "ui_" + cFile + ".prg", cPathOut )
      cCmd := "uic -o " + cUic + " " + s

      IF hb_processRun( cCmd ) == 0
         IF hb_FileExists( cUic )

            aResult := hbq_create( hb_memoread( cUic ), "ui" + upper( left( cFile, 1 ) ) + lower( substr( cFile, 2 ) ) )
            IF ISARRAY( aResult )
               s := ""
               aeval( aResult, {|e| s += e + hb_osNewLine() } )
               hb_memowrit( StrTran( cPrg, "/", hb_osPathSeparator() ), s )
            ENDIF

            FErase( cUic )
         ELSE
            OutStd( "hbqtui: Warning: Intermediate .uic file not found: " + cUic + hb_osNewLine() )
         ENDIF
      ELSE
         OutStd( "hbqtui: Error: Running 'uic' tool" + hb_osNewLine() )
      ENDIF
   NEXT

   RETURN

/*----------------------------------------------------------------------*/

FUNCTION hbq_create( cFile, cFuncName )
   LOCAL s, n, n1, cCls, cNam, lCreateFinished, cMCls, cMNam, cText
   LOCAL cCmd, aReg, a_, prg_
   LOCAL regEx := hb_regexComp( "\bQ[A-Za-z_]+ \b" )

   LOCAL aLines := hb_ATokens( StrTran( cFile, Chr( 13 ) ), Chr( 10 ) )

   LOCAL aWidgets := {}
   LOCAL aCommands := {}

   lCreateFinished := .f.

   /* Pullout the widget */
   n := ascan( aLines, {|e| "void setupUi" $ e } )
   IF n == 0
      RETURN NIL
   ENDIF
   s     := alltrim( aLines[ n ] )
   n     := at( "*", s )
   cMCls := alltrim( substr( s, 1, n - 1 ) )
   cMNam := alltrim( substr( s, n + 1 ) )
   hbq_stripFront( @cMCls, "(" )
   hbq_stripRear( @cMNam, ")" )

   aadd( aWidgets, { cMCls, cMNam, cMCls+"()", cMCls+"():new()" } )

   /* Normalize */
   FOR EACH s IN aLines
      s := alltrim( s )
      IF right( s, 1 ) == ";"
         s := substr( s, 1, len( s ) - 1 )
      ENDIF
      IF left( s, 1 ) $ "/,*,{,}"
         s := ""
      ENDIF
   NEXT

   FOR EACH s IN aLines
      IF empty( s )
         LOOP
      ENDIF

      /* Replace Qt::* with actual values */
      hbq_replaceConstants( @s )

      IF ( "setupUi" $ s )
         lCreateFinished := .t.

      ELSEIF left( s, 1 ) == "Q" .AND. !( lCreateFinished ) .AND. ( n := at( "*", s ) ) > 0
         // We eill deal later - just skip

      ELSEIF hbq_notAString( s ) .AND. !empty( aReg := hb_Regex( regEx, s ) )
         cCls := trim( aReg[ 1 ] )
         s := alltrim( strtran( s, cCls, "",, 1 ) )
         IF ( n := at( "(", s ) ) > 0
            cNam := substr( s, 1, n - 1 )
            aadd( aWidgets, { cCls, cNam, cCls+"()", cCls+"():new"+substr( s, n ) } )
         ELSE
            cNam := s
            aadd( aWidgets, { cCls, cNam, cCls+"()", cCls+"():new()" } )
         ENDIF

      ELSEIF hbq_isObjectNameSet( s )
         // Skip - we already know the object name and will set after construction

      ELSEIF !empty( cText := hbq_pullSetToolTip( aLines, s:__enumIndex() ) )
         n := at( "->", cText )
         cNam := alltrim( substr( cText, 1, n - 1 ) )
         cCmd := hbq_formatCommand( substr( cText, n + 2 ), .t., aWidgets )
         aadd( aCommands, { cNam, cCmd } )

      ELSEIF !empty( cText := hbq_pullText( aLines, s:__enumIndex() ) )
         n := at( "->", cText )
         cNam := alltrim( substr( cText, 1, n - 1 ) )
         cCmd := hbq_formatCommand( substr( cText, n + 2 ), .t., aWidgets )
         aadd( aCommands, { cNam, cCmd } )

      ELSEIF hbq_isValidCmdLine( s ) .AND. !( "->" $ s ) .AND. ( ( n := at( ".", s ) ) > 0  )  /* Assignment to objects on stack */
         cNam := substr( s, 1, n - 1 )
         cCmd := substr( s, n + 1 )
         cCmd := hbq_formatCommand( cCmd, .f., aWidgets )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         aadd( aCommands, { cNam, cCmd } )

      ELSEIF !( left( s, 1 ) $ '#/*"' ) .AND. ;          /* Assignment with properties from objects */
                     ( ( n := at( ".", s ) ) > 0  ) .AND. ;
                     ( at( "->", s ) > n )
         cNam := substr( s, 1, n - 1 )
         cCmd := substr( s, n + 1 )
         cCmd := hbq_formatCommand( cCmd, .f., aWidgets )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         aadd( aCommands, { cNam, cCmd } )

      ELSEIF ( n := at( "->", s ) ) > 0                  /* Assignments or calls to objects on heap */
         cNam := substr( s, 1, n - 1 )
         cCmd := hbq_formatCommand( substr( s, n + 2 ), .f., aWidgets )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         aadd( aCommands, { cNam, cCmd } )

      ELSEIF ( n := at( "= new", s ) ) > 0
         IF ( n1 := at( "*", s ) ) > 0 .AND. n1 < n
            s := alltrim( substr( s, n1 + 1 ) )
         ENDIF
         n    := at( "= new", s )
         cNam := alltrim( substr( s, 1, n - 1 ) )
         cCmd := alltrim( substr( s, n + len( "= new" ) ) )
         cCmd := hbq_setObjects( cCmd, aWidgets )
         n := at( "(", cCmd )
         cCls := substr( cCmd, 1, n - 1 )
         aadd( aWidgets, { cCls, cNam, cCls+"()", cCls+"():new"+substr(cCmd,n) } )

      ENDIF
   NEXT

   prg_ := {}

   hbq_addCopyRight( prg_ )

   aadd( prg_, "" )
   aadd( prg_, "FUNCTION " + cFuncName + "( qParent )" )
   aadd( prg_, "   LOCAL oUI" )
   aadd( prg_, "   LOCAL oWidget" )
   aadd( prg_, "   LOCAL qObj := {=>}" )
   aadd( prg_, "" )
   aadd( prg_, "   hb_hCaseMatch( qObj, .f. )" )
   aadd( prg_, "" )

   SWITCH cMCls
   CASE "QDialog"
      aadd( prg_, "   oWidget := QDialog():new( qParent )" )
      EXIT
   CASE "QWidget"
      aadd( prg_, "   oWidget := QWidget():new( qParent )" )
      EXIT
   CASE "QMainWindow"
      aadd( prg_, "   oWidget := QMainWindow():new( qParent )" )
      EXIT
   ENDSWITCH
   aadd( prg_, "  " )
   aadd( prg_, "   oWidget:setObjectName( " + STRINGIFY( cMNam ) + " )" )
   aadd( prg_, "  " )
   aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cMNam ) ) + " ] := oWidget" )
   aadd( prg_, "  " )

   FOR EACH a_ IN aWidgets
      IF a_:__enumIndex() > 1
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( a_[ 2 ] ) ) + " ] := " + strtran( a_[ 4 ], "o[", "qObj[" ) )
      ENDIF
   NEXT
   aadd( prg_, "" )

   FOR EACH a_ IN aCommands
      cNam := a_[ 1 ]
      cCmd := a_[ 2 ]
      cCmd := strtran( cCmd, "true" , ".T." )
      cCmd := strtran( cCmd, "false", ".F." )

      IF "addWidget" $ cCmd
         IF hbq_occurs( cCmd, "," ) >= 4
            cCmd := strtran( cCmd, "addWidget", "addWidget_1" )
         ENDIF

      ELSEIF "addLayout" $ cCmd
         IF hbq_occurs( cCmd, "," ) >= 4
            cCmd := strtran( cCmd, "addLayout", "addLayout_1" )
         ENDIF
      ENDIF

      IF "setToolTip(" $ cCmd
         s := hbq_pullToolTip( cCmd )
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:setToolTip( [" + STRIP_SQ( s ) + "] )" )

      ELSEIF "setPlainText(" $ cCmd
         s := hbq_pullToolTip( cCmd )
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:setPlainText( [" + STRIP_SQ( s ) + "] )" )

      ELSEIF "setStyleSheet(" $ cCmd
         s := hbq_pullToolTip( cCmd )
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:setStyleSheet( [" + STRIP_SQ( s ) + "] )" )

      ELSEIF "setText(" $ cCmd
         s := hbq_pullToolTip( cCmd )
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:setText( [" + STRIP_SQ( s ) + "] )" )

      ELSEIF "setWhatsThis(" $ cCmd
         s := hbq_pullToolTip( cCmd )
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:setWhatsThis( [" + STRIP_SQ( s ) + "] )" )

      ELSEIF "header()->" $ cCmd
         // TODO: how to handle : __qtreeviewitem->header()->setVisible( .f. )

      ELSEIF cCmd == "pPtr"
         // Nothing TO DO

      ELSE
         aadd( prg_, "   qObj[ " + PAD_30( STRINGIFY( cNam ) ) + " ]:" + strtran( cCmd, "o[", "qObj[" ) )

      ENDIF
   NEXT
   aadd( prg_, "" )
   aadd( prg_, "   oUI         := HbQtUI():new()" )
   aadd( prg_, "   oUI:qObj    := qObj"    )
   aadd( prg_, "   oUI:oWidget := oWidget" )
   aadd( prg_, "" )
   aadd( prg_, "   RETURN oUI" )
   aadd( prg_, "" )

   RETURN prg_

/*----------------------------------------------------------------------*/

FUNCTION hbq_formatCommand( cCmd, lText, widgets )
   LOCAL regDefine, aDefine, n, n1, cNam, cCmd1

   STATIC nn := 100

   DEFAULT lText TO .t.

   cCmd := strtran( cCmd, "QApplication_translate"   , "q__tr"        )
   cCmd := strtran( cCmd, "QApplication::UnicodeUTF8", '"UTF8"'       )
   cCmd := strtran( cCmd, "QString()"                , '""'           )
   cCmd := strtran( cCmd, "QSize("                   , "QSize():new(" )
   cCmd := strtran( cCmd, "QRect("                   , "QRect():new(" )

   IF ( "::" $ cCmd )
      regDefine := hb_RegexComp( "\b[A-Za-z_]+\:\:[A-Za-z_]+\b" )
      aDefine := hb_RegEx( regDefine, cCmd )
      IF !empty( aDefine )
         cCmd := strtran( cCmd, "::", "_" )    /* Qt Defines  - how to handle */
      ENDIF
   ENDIF

   IF ! lText .AND. ( at( ".", cCmd ) ) > 0
      // sizePolicy     setHeightForWidth(ProjectProperties->sizePolicy().hasHeightForWidth());
      //
      IF ( at( "setHeightForWidth(", cCmd ) ) > 0
         cNam := "__qsizePolicy" + hb_ntos( ++nn )
         n    := at( "(", cCmd )
         n1   := at( ".", cCmd )
         cCmd1 := hbq_setObjects( substr( cCmd, n + 1, n1 - n - 1 ), widgets )
         cCmd1 := strtran( cCmd1, "->", ":" )
         aadd( widgets, { "QSizePolicy", cNam, "QSizePolicy()", "QSizePolicy():configure(" + cCmd1 + ")" } )
         cCmd := 'setHeightForWidth(o[ "' + cNam + '" ]:' + substr( cCmd, n1 + 1 )

      ELSE
         cCmd := "pPtr"

      ENDIF
   ENDIF

   RETURN cCmd

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_isObjectNameSet( s )
   RETURN ( "objectName" $ s .OR. "ObjectName" $ s )

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_isValidCmdLine( s )
   RETURN !( left( s, 1 ) $ '#/*"' )

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_notAString( s )
   RETURN !( left( s, 1 ) == '"' )

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_occurs( s, c )
   LOCAL i, n, nLen := len( s )

   n := 0
   FOR i := 1 TO nLen
      IF substr( s, i, 1 ) == c
         n++
      ENDIF
   NEXT
   RETURN n

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_pullToolTip( cCmd )
   LOCAL n, s := ""

   IF ( n := at( ', "', cCmd ) ) > 0
      s := alltrim( substr( cCmd, n + 2 ) )
      IF ( n := at( '", 0', s ) ) > 0
         s := alltrim( substr( s, 1, n ) )
         s := strtran( s, '\"', '"' )
         //s := strtran( s, '\n', chr( 10 ) )
         s := strtran( s, '""', "" )
         s := substr( s, 2, len( s ) - 2 )
      ENDIF
   ENDIF

   RETURN s

/*----------------------------------------------------------------------*/

STATIC PROCEDURE hbq_replaceConstants( s )
   LOCAL a_, regDefine, cConst, cCmdB, cCmdE, cOR, n
   LOCAL g := s
   LOCAL b_:= {}
   LOCAL nOrs := hbq_occurs( s, "|" )
#if 0
   STATIC hConst := ;
      { ;
         "QSizePolicy_Fixed"                      => NIL, ;
         "QSizePolicy_Minimum"                    => NIL, ;
         "QSizePolicy_Maximum"                    => NIL, ;
         "QSizePolicy_Preferred"                  => NIL, ;
         "QSizePolicy_Expanding"                  => NIL, ;
         "QSizePolicy_MinimumExpanding"           => NIL, ;
         "QSizePolicy_Ignored"                    => NIL, ;
         ;
         "Qt_AlignLeft"                           => NIL, ;
         "Qt_AlignRight"                          => NIL, ;
         "Qt_AlignHCenter"                        => NIL, ;
         "Qt_AlignJustify"                        => NIL, ;
         "Qt_AlignTop"                            => NIL, ;
         "Qt_AlignBottom"                         => NIL, ;
         "Qt_AlignVCenter"                        => NIL, ;
         "Qt_AlignCenter"                         => NIL, ;
         "Qt_AlignAbsolute"                       => NIL, ;
         "Qt_AlignLeading"                        => NIL, ;
         "Qt_AlignTrailing"                       => NIL, ;
         ;
         "QPlainTextEdit_NoWrap"                  => NIL, ;
         "QPlainTextEdit_WidgetWidth"             => NIL, ;
         ;
         "QTabWidget_North"                       => NIL, ;
         "QTabWidget_South"                       => NIL, ;
         "QTabWidget_West"                        => NIL, ;
         "QTabWidget_East"                        => NIL, ;
         "QTabWidget_Rounded"                     => NIL, ;
         "QTabWidget_Triangular"                  => NIL, ;
         "QMainWindow_AnimatedDocks"              => NIL, ;
         "QMainWindow_AllowNestedDocks"           => NIL, ;
         "QMainWindow_AllowTabbedDocks"           => NIL, ;
         "QMainWindow_ForceTabbedDocks"           => NIL, ;
         "QMainWindow_VerticalTabs"               => NIL, ;
         ;
         "QLayout_SetDefaultConstraint"           => NIL, ;
         "QLayout_SetFixedSize"                   => NIL, ;
         "QLayout_SetMinimumSize"                 => NIL, ;
         "QLayout_SetMaximumSize"                 => NIL, ;
         "QLayout_SetMinAndMaxSize"               => NIL, ;
         "QLayout_SetNoConstraint"                => NIL, ;
         ;
         "QFrame_Plain"                           => NIL, ;
         "QFrame_Raised"                          => NIL, ;
         "QFrame_Sunken"                          => NIL, ;
         "QFrame_NoFrame"                         => NIL, ;
         "QFrame_Box"                             => NIL, ;
         "QFrame_Panel"                           => NIL, ;
         "QFrame_StyledPanel"                     => NIL, ;
         "QFrame_HLine"                           => NIL, ;
         "QFrame_VLine"                           => NIL, ;
         "QFrame_WinPanel"                        => NIL, ;
         "QFrame_Shadow_Mask"                     => NIL, ;
         "QFrame_Shape_Mask"                      => NIL, ;
         ;
         "QAbstractItemView_NoEditTriggers"       => NIL, ;
         "QAbstractItemView_CurrentChanged"       => NIL, ;
         "QAbstractItemView_DoubleClicked"        => NIL, ;
         "QAbstractItemView_SelectedClicked"      => NIL, ;
         "QAbstractItemView_EditKeyPressed"       => NIL, ;
         "QAbstractItemView_AnyKeyPressed"        => NIL, ;
         "QAbstractItemView_AllEditTriggers"      => NIL, ;
         "QAbstractItemView_NoSelection"          => NIL, ;
         "QAbstractItemView_MultiSelection"       => NIL, ;
         "QAbstractItemView_SingleSelection"      => NIL, ;
         "QAbstractItemView_ContiguousSelection"  => NIL, ;
         "QAbstractItemView_ExtendedSelection"    => NIL, ;
         ;
         "QTextEdit_NoWrap"                       => NIL, ;
         "QTextEdit_WidgetWidth"                  => NIL, ;
         "QTextEdit_FixedPixelWidth"              => NIL, ;
         "QTextEdit_FixedColumnWidth"             => NIL, ;
         ;
         "Qt_ScrollBarAsNeeded"                   => NIL, ;
         "Qt_ScrollBarAlwaysOff"                  => NIL, ;
         "Qt_ScrollBarAlwaysOn"                   => NIL, ;
         ;
         "Qt_Horizontal"                          => NIL, ;
         "Qt_Vertical"                            => NIL, ;
         ;
         "Qt_TabFocus"                            => NIL, ;
         "Qt_ClickFocus"                          => NIL, ;
         "Qt_StrongFocus"                         => NIL, ;
         "Qt_WheelFocus"                          => NIL, ;
         "Qt_NoFocus"                             => NIL  ;
      }
#endif
   regDefine := hb_RegexComp( "\b[A-Za-z_]+\:\:[A-Za-z_]+\b" )

   IF nOrs > 0
      FOR n := 1 TO nOrs + 1
         a_:= hb_RegEx( regDefine, g )
         IF !empty( a_ )
            aadd( b_, a_[ 1 ] )
            g := substr( g, at( a_[ 1 ], g ) + len( a_[ 1 ] ) )
         ENDIF
      NEXT
   ENDIF

   IF !empty( b_ )
      cOR := "hb_bitOR(" + b_[ 1 ] + "," + b_[ 2 ] +")"
      FOR n := 3 TO len( b_ )
         cOR := "hb_bitOR(" + cOR + "," + b_[ n ] + ")"
      NEXT
      cCmdB  := substr( s, 1, at( b_[ 1 ], s ) - 1 )
      cConst := b_[ len( b_ ) ]
      cCmdE  := substr( s, at( cConst, s ) + len( cConst ) )
      s      := cCmdB + cOR + cCmdE
   ENDIF

   IF ( "::" $ s )
      DO WHILE .t.
         a_:= hb_RegEx( regDefine, s )
         IF empty( a_ )
            EXIT
         ENDIF
         cConst := strtran( a_[ 1 ], "::", "_" )
#if 0
         IF !( cConst $ hConst )
            EXIT
         ENDIF
#endif
         s := strtran( s, a_[ 1 ], cConst )
      ENDDO
   ENDIF

   RETURN

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_setObjects( cCmd, aObj_ )
   LOCAL n, cObj
   IF ( n := ascan( aObj_, {|e_| ( e_[ 2 ] + "," ) $ cCmd } ) ) > 0
      cObj := aObj_[ n, 2 ]
      cCmd := strtran( cCmd, ( cObj + "," ), 'o[ "' + cObj + '" ],' )
   ENDIF
   IF ( n := ascan( aObj_, {|e_| ( e_[ 2 ] + ")" ) $ cCmd } ) ) > 0
      cObj := aObj_[ n, 2 ]
      cCmd := strtran( cCmd, ( cObj + ")" ), 'o[ "' + cObj + '" ])' )
   ENDIF
   IF ( n := ascan( aObj_, {|e_| ( e_[ 2 ] + "->" ) $ cCmd } ) ) > 0
      cObj := aObj_[ n, 2 ]
      cCmd := strtran( cCmd, ( cObj + "->" ), 'o[ "' + cObj + '" ]:' )
   ENDIF
   RETURN cCmd

/*----------------------------------------------------------------------*/

FUNCTION q__tr( p1, p2, p3, p4 )

   HB_SYMBOL_UNUSED( p1 )
   HB_SYMBOL_UNUSED( p3 )
   HB_SYMBOL_UNUSED( p4 )

   RETURN p2

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_pullText( org_, nFrom )
   LOCAL s := "", nLen := len( org_ )
   LOCAL a_:= { "setText(", "setPlainText(", "setStyleSheet(", "setWhatsThis(" }

   IF ascan( a_, {|e| e $ org_[ nFrom ] } ) > 0
      s := org_[ nFrom ]
      nFrom ++
      DO WHILE nFrom <= nLen
         IF !( left( org_[ nFrom ], 1 ) == '"' )
            EXIT
         ENDIF
         s += org_[ nFrom ]
         org_[ nFrom ] := ""
         nFrom++
      ENDDO
   ENDIF

   RETURN s

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_pullSetToolTip( org_, nFrom )
   LOCAL s := "", nLen := len( org_ )

   IF ( "#ifndef QT_NO_TOOLTIP" $ org_[ nFrom ] )
      nFrom++
      DO WHILE nFrom <= nLen
         IF ( "#endif // QT_NO_TOOLTIP" $ org_[ nFrom ] )
            EXIT
         ENDIF
         s += org_[ nFrom ]
         org_[ nFrom ] := ""
         nFrom++
      ENDDO
   ENDIF
   RETURN s

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_stripFront( s, cTkn )
   LOCAL n
   LOCAL nLen := len( cTkn )

   IF ( n := at( cTkn, s ) ) > 0
      s := substr( s, n + nLen )
      RETURN .t.
   ENDIF

   RETURN .f.

/*----------------------------------------------------------------------*/

STATIC FUNCTION hbq_stripRear( s, cTkn )
   LOCAL n

   IF ( n := rat( cTkn, s ) ) > 0
      s := substr( s, 1, n - 1 )
      RETURN .t.
   ENDIF

   RETURN .f.

/*----------------------------------------------------------------------*/

STATIC PROCEDURE hbq_addCopyRight( prg_ )

   aadd( prg_, "/* WARNING: Automatically generated source file. DO NOT EDIT!           */" )
   aadd( prg_, "/*          Instead, edit corresponding .ui file,                       */" )
   aadd( prg_, "/*          with Qt Generator, and run hbqtui.exe.                      */" )
   aadd( prg_, "/*                                                                      */" )
   aadd( prg_, "/*          Pritpal Bedi <bedipritpal@hotmail.com>                      */" )
   aadd( prg_, "" )
   aadd( prg_, '#include "hbqt.ch"' )

   RETURN

/*----------------------------------------------------------------------*/