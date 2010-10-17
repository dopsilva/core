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


FUNCTION QRegExp( ... )
   RETURN HB_QRegExp():new( ... )

FUNCTION QRegExpFrom( ... )
   RETURN HB_QRegExp():from( ... )

FUNCTION QRegExpFromPointer( ... )
   RETURN HB_QRegExp():fromPointer( ... )


CREATE CLASS QRegExp INHERIT HbQtObjectHandler FUNCTION HB_QRegExp

   METHOD  new( ... )

   METHOD  cap                           // ( nNth )                                           -> cQString
   METHOD  capturedTexts                 // (  )                                               -> oQStringList
   METHOD  caseSensitivity               // (  )                                               -> nQt_CaseSensitivity
   METHOD  errorString                   // (  )                                               -> cQString
   METHOD  exactMatch                    // ( cStr )                                           -> lBool
   METHOD  indexIn                       // ( cStr, nOffset, nCaretMode )                      -> nInt
   METHOD  isEmpty                       // (  )                                               -> lBool
   METHOD  isMinimal                     // (  )                                               -> lBool
   METHOD  isValid                       // (  )                                               -> lBool
   METHOD  lastIndexIn                   // ( cStr, nOffset, nCaretMode )                      -> nInt
   METHOD  matchedLength                 // (  )                                               -> nInt
   METHOD  numCaptures                   // (  )                                               -> nInt
   METHOD  pattern                       // (  )                                               -> cQString
   METHOD  patternSyntax                 // (  )                                               -> nPatternSyntax
   METHOD  pos                           // ( nNth )                                           -> nInt
   METHOD  setCaseSensitivity            // ( nCs )                                            -> NIL
   METHOD  setMinimal                    // ( lMinimal )                                       -> NIL
   METHOD  setPattern                    // ( cPattern )                                       -> NIL
   METHOD  setPatternSyntax              // ( nSyntax )                                        -> NIL

   ENDCLASS


METHOD QRegExp:new( ... )
   LOCAL p
   FOR EACH p IN { ... }
      hb_pvalue( p:__enumIndex(), __hbqt_ptr( p ) )
   NEXT
   ::pPtr := Qt_QRegExp( ... )
   RETURN Self


METHOD QRegExp:cap( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_cap( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 0
      RETURN Qt_QRegExp_cap( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:capturedTexts( ... )
   SWITCH PCount()
   CASE 0
      RETURN QStringListFromPointer( Qt_QRegExp_capturedTexts( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:caseSensitivity( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_caseSensitivity( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:errorString( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_errorString( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:exactMatch( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_exactMatch( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:indexIn( ... )
   SWITCH PCount()
   CASE 3
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isNumeric( hb_pvalue( 2 ) ) .AND. hb_isNumeric( hb_pvalue( 3 ) )
         RETURN Qt_QRegExp_indexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isNumeric( hb_pvalue( 2 ) )
         RETURN Qt_QRegExp_indexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_indexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:isEmpty( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_isEmpty( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:isMinimal( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_isMinimal( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:isValid( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_isValid( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:lastIndexIn( ... )
   SWITCH PCount()
   CASE 3
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isNumeric( hb_pvalue( 2 ) ) .AND. hb_isNumeric( hb_pvalue( 3 ) )
         RETURN Qt_QRegExp_lastIndexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 2
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) ) .AND. hb_isNumeric( hb_pvalue( 2 ) )
         RETURN Qt_QRegExp_lastIndexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_lastIndexIn( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:matchedLength( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_matchedLength( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:numCaptures( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_numCaptures( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:pattern( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_pattern( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:patternSyntax( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QRegExp_patternSyntax( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:pos( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_pos( ::pPtr, ... )
      ENDCASE
      EXIT
   CASE 0
      RETURN Qt_QRegExp_pos( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:setCaseSensitivity( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_setCaseSensitivity( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:setMinimal( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isLogical( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_setMinimal( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:setPattern( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isChar( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_setPattern( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QRegExp:setPatternSyntax( ... )
   SWITCH PCount()
   CASE 1
      DO CASE
      CASE hb_isNumeric( hb_pvalue( 1 ) )
         RETURN Qt_QRegExp_setPatternSyntax( ::pPtr, ... )
      ENDCASE
      EXIT
   ENDSWITCH
   RETURN __hbqt_error()
