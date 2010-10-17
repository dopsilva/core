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


FUNCTION QWebHitTestResult( ... )
   RETURN HB_QWebHitTestResult():new( ... )

FUNCTION QWebHitTestResultFrom( ... )
   RETURN HB_QWebHitTestResult():from( ... )

FUNCTION QWebHitTestResultFromPointer( ... )
   RETURN HB_QWebHitTestResult():fromPointer( ... )


CREATE CLASS QWebHitTestResult INHERIT HbQtObjectHandler FUNCTION HB_QWebHitTestResult

   METHOD  new( ... )

   METHOD  alternateText                 // (  )                                               -> cQString
   METHOD  boundingRect                  // (  )                                               -> oQRect
   METHOD  frame                         // (  )                                               -> oQWebFrame
   METHOD  imageUrl                      // (  )                                               -> oQUrl
   METHOD  isContentEditable             // (  )                                               -> lBool
   METHOD  isContentSelected             // (  )                                               -> lBool
   METHOD  isNull                        // (  )                                               -> lBool
   METHOD  linkTargetFrame               // (  )                                               -> oQWebFrame
   METHOD  linkText                      // (  )                                               -> cQString
   METHOD  linkTitle                     // (  )                                               -> oQUrl
   METHOD  linkUrl                       // (  )                                               -> oQUrl
   METHOD  pixmap                        // (  )                                               -> oQPixmap
   METHOD  pos                           // (  )                                               -> oQPoint
   METHOD  title                         // (  )                                               -> cQString

   ENDCLASS


METHOD QWebHitTestResult:new( ... )
   LOCAL p
   FOR EACH p IN { ... }
      hb_pvalue( p:__enumIndex(), __hbqt_ptr( p ) )
   NEXT
   ::pPtr := Qt_QWebHitTestResult( ... )
   RETURN Self


METHOD QWebHitTestResult:alternateText( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_alternateText( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:boundingRect( ... )
   SWITCH PCount()
   CASE 0
      RETURN QRectFromPointer( Qt_QWebHitTestResult_boundingRect( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:frame( ... )
   SWITCH PCount()
   CASE 0
      RETURN QWebFrameFromPointer( Qt_QWebHitTestResult_frame( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:imageUrl( ... )
   SWITCH PCount()
   CASE 0
      RETURN QUrlFromPointer( Qt_QWebHitTestResult_imageUrl( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:isContentEditable( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_isContentEditable( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:isContentSelected( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_isContentSelected( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:isNull( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_isNull( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:linkTargetFrame( ... )
   SWITCH PCount()
   CASE 0
      RETURN QWebFrameFromPointer( Qt_QWebHitTestResult_linkTargetFrame( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:linkText( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_linkText( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:linkTitle( ... )
   SWITCH PCount()
   CASE 0
      RETURN QUrlFromPointer( Qt_QWebHitTestResult_linkTitle( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:linkUrl( ... )
   SWITCH PCount()
   CASE 0
      RETURN QUrlFromPointer( Qt_QWebHitTestResult_linkUrl( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:pixmap( ... )
   SWITCH PCount()
   CASE 0
      RETURN QPixmapFromPointer( Qt_QWebHitTestResult_pixmap( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:pos( ... )
   SWITCH PCount()
   CASE 0
      RETURN QPointFromPointer( Qt_QWebHitTestResult_pos( ::pPtr, ... ) )
   ENDSWITCH
   RETURN __hbqt_error()


METHOD QWebHitTestResult:title( ... )
   SWITCH PCount()
   CASE 0
      RETURN Qt_QWebHitTestResult_title( ::pPtr, ... )
   ENDSWITCH
   RETURN __hbqt_error()
