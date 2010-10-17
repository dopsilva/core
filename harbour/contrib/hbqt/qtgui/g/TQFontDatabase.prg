/*
 * $Id$
 */

/* -------------------------------------------------------------------- */
/* WARNING: Automatically generated source file. DO NOT EDIT!           */
/*          Instead, edit corresponding .qth file,                      */
/*          or the generator tool itself, and run regenarate.           */
/* -------------------------------------------------------------------- */

/*
 * Harbour Project source code:
 * QT wrapper main header
 *
 * Copyright 2009-2010 Pritpal Bedi <bedipritpal@hotmail.com>
 * www - http://harbour-project.org
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
/*                            C R E D I T S                             */
/*----------------------------------------------------------------------*/
/*
 * Marcos Antonio Gambeta
 *    for providing first ever prototype parsing methods. Though the current
 *    implementation is diametrically different then what he proposed, still
 *    current code shaped on those footsteps.
 *
 * Viktor Szakats
 *    for directing the project with futuristic vision;
 *    for designing and maintaining a complex build system for hbQT, hbIDE;
 *    for introducing many constructs on PRG and C++ levels;
 *    for streamlining signal/slots and events management classes;
 *
 * Istvan Bisz
 *    for introducing QPointer<> concept in the generator;
 *    for testing the library on numerous accounts;
 *    for showing a way how a GC pointer can be detached;
 *
 * Francesco Perillo
 *    for taking keen interest in hbQT development and peeking the code;
 *    for providing tips here and there to improve the code quality;
 *    for hitting bulls eye to describe why few objects need GC detachment;
 *
 * Carlos Bacco
 *    for implementing HBQT_TYPE_Q*Class enums;
 *    for peeking into the code and suggesting optimization points;
 *
 * Przemyslaw Czerpak
 *    for providing tips and trick to manipulate HVM internals to the best
 *    of its use and always showing a path when we get stuck;
 *    A true tradition of a MASTER...
*/
/*----------------------------------------------------------------------*/


#include "hbclass.ch"


FUNCTION QFontDatabase( ... )
   RETURN HB_QFontDatabase():new( ... )

FUNCTION QFontDatabaseFrom( ... )
   RETURN HB_QFontDatabase():from( ... )

FUNCTION QFontDatabaseFromPointer( ... )
   RETURN HB_QFontDatabase():fromPointer( ... )


CREATE CLASS QFontDatabase INHERIT HbQtObjectHandler FUNCTION HB_QFontDatabase

   METHOD  new( ... )

   METHOD  bold                          // ( cFamily, cStyle )                                -> lBool
   METHOD  families                      // ( nWritingSystem )                                 -> oQStringList
   METHOD  font                          // ( cFamily, cStyle, nPointSize )                    -> oQFont
   METHOD  isBitmapScalable              // ( cFamily, cStyle )                                -> lBool
   METHOD  isFixedPitch                  // ( cFamily, cStyle )                                -> lBool
   METHOD  isScalable                    // ( cFamily, cStyle )                                -> lBool
   METHOD  isSmoothlyScalable            // ( cFamily, cStyle )                                -> lBool
   METHOD  italic                        // ( cFamily, cStyle )                                -> lBool
   METHOD  pointSizes                    // ( cFamily, cStyle )                                -> oQList_int>
   METHOD  smoothSizes                   // ( cFamily, cStyle )                                -> oQList_int>
   METHOD  styleString                   // ( oQFont )                                         -> cQString
                                         // ( oQFontInfo )                                     -> cQString
   METHOD  styles                        // ( cFamily )                                        -> oQStringList
   METHOD  weight                        // ( cFamily, cStyle )                                -> nInt
   METHOD  addApplicationFont            // ( cFileName )                                      -> nInt
   METHOD  addApplicationFontFromData    // ( oQByteArray )                                    -> nInt
   METHOD  applicationFontFamilies       // ( nId )                                            -> oQStringList
   METHOD  removeAllApplicationFonts     // (  )                                               -> lBool
   METHOD  removeApplicationFont         // ( nId )                                            -> lBool
   METHOD  standardSizes                 // (  )                                               -> oQList_int>
   METHOD  supportsThreadedFontRendering // (  )                                               -> lBool
   METHOD  writingSystemName             // ( nWritingSystem )                                 -> cQString
   METHOD  writingSystemSample           // ( nWritingSystem )                                 -> cQString

   ENDCLASS


METHOD QFontDatabase:new( ... )
   LOCAL p
   FOR EACH p IN { ... }
      hb_pvalue( p:__enumIndex(), __hbqt_ptr( p ) )
   NEXT
   ::pPtr := Qt_QFontDatabase( ... )
   RETURN Self


METHOD QFontDatabase:bold( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_bold( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:families( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN QStringListFromPointer( Qt_QFontDatabase_families( ::pPtr, ... ) )
      ENDCASE
      EXIT
   CASE 0
      RETURN QStringListFromPointer( Qt_QFontDatabase_families( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:font( ... )
   SWITCH PCount()
   CASE 3
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) ) .AND. hb_isNumeric( hb_pvalue( 3 ) )
         RETURN QFontFromPointer( Qt_QFontDatabase_font( ::pPtr, ... ) )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:isBitmapScalable( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_isBitmapScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_isBitmapScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:isFixedPitch( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_isFixedPitch( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_isFixedPitch( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:isScalable( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_isScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_isScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:isSmoothlyScalable( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_isSmoothlyScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_isSmoothlyScalable( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:italic( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_italic( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:pointSizes( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN QListFromPointer( Qt_QFontDatabase_pointSizes( ::pPtr, ... ) )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN QListFromPointer( Qt_QFontDatabase_pointSizes( ::pPtr, ... ) )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:smoothSizes( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN QListFromPointer( Qt_QFontDatabase_smoothSizes( ::pPtr, ... ) )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:styleString( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isObject( hb_pvalue( 1 ) )
         SWITCH __objGetClsName( hb_pvalue( 1 ) )
         CASE "QFONT"
            RETURN Qt_QFontDatabase_styleString( ::pPtr, ... )
         CASE "QFONTINFO"
            RETURN Qt_QFontDatabase_styleString_1( ::pPtr, ... )
         ENDSWITCH
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:styles( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN QStringListFromPointer( Qt_QFontDatabase_styles( ::pPtr, ... ) )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:weight( ... )
   SWITCH PCount()
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isChar( hb_pvalue( 2 ) )
         RETURN Qt_QFontDatabase_weight( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:addApplicationFont( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_addApplicationFont( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:addApplicationFontFromData( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isObject( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_addApplicationFontFromData( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:applicationFontFamilies( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN QStringListFromPointer( Qt_QFontDatabase_applicationFontFamilies( ::pPtr, ... ) )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:removeAllApplicationFonts( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QFontDatabase_removeAllApplicationFonts( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:removeApplicationFont( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_removeApplicationFont( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:standardSizes( ... )
   SWITCH PCount()
   CASE 0
      RETURN QListFromPointer( Qt_QFontDatabase_standardSizes( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:supportsThreadedFontRendering( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QFontDatabase_supportsThreadedFontRendering( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:writingSystemName( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_writingSystemName( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QFontDatabase:writingSystemSample( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QFontDatabase_writingSystemSample( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()
