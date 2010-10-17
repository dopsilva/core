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

#include "hbqtcore.h"
#include "hbqtgui.h"

/*----------------------------------------------------------------------*/
#if QT_VERSION >= 0x040500
/*----------------------------------------------------------------------*/

/*
 *  flags CacheMode
 *  enum CacheModeFlag { CacheNone, CacheBackground }
 *  enum DragMode { NoDrag, ScrollHandDrag, RubberBandDrag }
 *  flags OptimizationFlags
 *  enum OptimizationFlag { DontClipPainter, DontSavePainterState, DontAdjustForAntialiasing }
 *  enum ViewportAnchor { NoAnchor, AnchorViewCenter, AnchorUnderMouse }
 *  enum ViewportUpdateMode { FullViewportUpdate, MinimalViewportUpdate, SmartViewportUpdate, BoundingRectViewportUpdate, NoViewportUpdate }
 */

/*
 *  Constructed[ 76/77 [ 98.70% ] ]
 *
 *  *** Unconvered Prototypes ***
 *
 *  void updateScene ( const QList<QRectF> & rects )
 */

#include <QtCore/QPointer>

#include <QtGui/QGraphicsView>


/*
 * QGraphicsView ( QWidget * parent = 0 )
 * QGraphicsView ( QGraphicsScene * scene, QWidget * parent = 0 )
 * ~QGraphicsView ()
 */

typedef struct
{
   QPointer< QGraphicsView > ph;
   bool bNew;
   PHBQT_GC_FUNC func;
   int type;
} HBQT_GC_T_QGraphicsView;

HBQT_GC_FUNC( hbqt_gcRelease_QGraphicsView )
{
   QGraphicsView  * ph = NULL ;
   HBQT_GC_T_QGraphicsView * p = ( HBQT_GC_T_QGraphicsView * ) Cargo;

   if( p && p->bNew && p->ph )
   {
      ph = p->ph;
      if( ph )
      {
         const QMetaObject * m = ( ph )->metaObject();
         if( ( QString ) m->className() != ( QString ) "QObject" )
         {
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p %p YES_rel_QGraphicsView   /.\\   ", (void*) ph, (void*) p->ph ) );
            delete ( p->ph );
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p %p YES_rel_QGraphicsView   \\./   ", (void*) ph, (void*) p->ph ) );
            p->ph = NULL;
         }
         else
         {
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p NO__rel_QGraphicsView          ", ph ) );
            p->ph = NULL;
         }
      }
      else
      {
         HB_TRACE( HB_TR_DEBUG, ( "ph=%p DEL_rel_QGraphicsView    :     Object already deleted!", ph ) );
         p->ph = NULL;
      }
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p PTR_rel_QGraphicsView    :    Object not created with new=true", ph ) );
      p->ph = NULL;
   }
}

void * hbqt_gcAllocate_QGraphicsView( void * pObj, bool bNew )
{
   HBQT_GC_T_QGraphicsView * p = ( HBQT_GC_T_QGraphicsView * ) hb_gcAllocate( sizeof( HBQT_GC_T_QGraphicsView ), hbqt_gcFuncs() );

   new( & p->ph ) QPointer< QGraphicsView >( ( QGraphicsView * ) pObj );
   p->bNew = bNew;
   p->func = hbqt_gcRelease_QGraphicsView;
   p->type = HBQT_TYPE_QGraphicsView;

   if( bNew )
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p    _new_QGraphicsView  under p->pq", pObj ) );
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p NOT_new_QGraphicsView", pObj ) );
   }
   return p;
}

HB_FUNC( QT_QGRAPHICSVIEW )
{
   QGraphicsView * pObj = NULL;

   if( hb_pcount() == 1 && HB_ISPOINTER( 1 ) )
   {
      pObj = new QGraphicsView( hbqt_par_QWidget( 1 ) ) ;
   }
   else if( hb_pcount() >= 2 && HB_ISCHAR( 1 ) && HB_ISPOINTER( 2 ) )
   {
      if( ( QString ) "QGraphicsScene" == hbqt_par_QString( 1 ) )
      {
         pObj = new QGraphicsView( hbqt_par_QGraphicsScene( 2 ), ( HB_ISPOINTER( 3 ) ? hbqt_par_QWidget( 3 ) : 0 ) ) ;
      }
      else
      {
         pObj = new QGraphicsView() ;
      }
   }
   else
   {
      pObj = new QGraphicsView() ;
   }

   hb_retptrGC( hbqt_gcAllocate_QGraphicsView( ( void * ) pObj, true ) );
}

/*
 * Qt::Alignment alignment () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ALIGNMENT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( Qt::Alignment ) ( p )->alignment() );
   }
}

/*
 * QBrush backgroundBrush () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_BACKGROUNDBRUSH )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QBrush( new QBrush( ( p )->backgroundBrush() ), true ) );
   }
}

/*
 * CacheMode cacheMode () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_CACHEMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::CacheMode ) ( p )->cacheMode() );
   }
}

/*
 * void centerOn ( const QPointF & pos )
 */
HB_FUNC( QT_QGRAPHICSVIEW_CENTERON )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->centerOn( *hbqt_par_QPointF( 2 ) );
   }
}

/*
 * void centerOn ( qreal x, qreal y )
 */
HB_FUNC( QT_QGRAPHICSVIEW_CENTERON_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->centerOn( hb_parnd( 2 ), hb_parnd( 3 ) );
   }
}

/*
 * void centerOn ( const QGraphicsItem * item )
 */
HB_FUNC( QT_QGRAPHICSVIEW_CENTERON_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->centerOn( hbqt_par_QGraphicsItem( 2 ) );
   }
}

/*
 * DragMode dragMode () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_DRAGMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::DragMode ) ( p )->dragMode() );
   }
}

/*
 * void ensureVisible ( const QRectF & rect, int xmargin = 50, int ymargin = 50 )
 */
HB_FUNC( QT_QGRAPHICSVIEW_ENSUREVISIBLE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->ensureVisible( *hbqt_par_QRectF( 2 ), hb_parnidef( 3, 50 ), hb_parnidef( 4, 50 ) );
   }
}

/*
 * void ensureVisible ( qreal x, qreal y, qreal w, qreal h, int xmargin = 50, int ymargin = 50 )
 */
HB_FUNC( QT_QGRAPHICSVIEW_ENSUREVISIBLE_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->ensureVisible( hb_parnd( 2 ), hb_parnd( 3 ), hb_parnd( 4 ), hb_parnd( 5 ), hb_parnidef( 6, 50 ), hb_parnidef( 7, 50 ) );
   }
}

/*
 * void ensureVisible ( const QGraphicsItem * item, int xmargin = 50, int ymargin = 50 )
 */
HB_FUNC( QT_QGRAPHICSVIEW_ENSUREVISIBLE_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->ensureVisible( hbqt_par_QGraphicsItem( 2 ), hb_parnidef( 3, 50 ), hb_parnidef( 4, 50 ) );
   }
}

/*
 * void fitInView ( const QRectF & rect, Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio )
 */
HB_FUNC( QT_QGRAPHICSVIEW_FITINVIEW )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->fitInView( *hbqt_par_QRectF( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::AspectRatioMode ) hb_parni( 3 ) : ( Qt::AspectRatioMode ) Qt::IgnoreAspectRatio ) );
   }
}

/*
 * void fitInView ( qreal x, qreal y, qreal w, qreal h, Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio )
 */
HB_FUNC( QT_QGRAPHICSVIEW_FITINVIEW_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->fitInView( hb_parnd( 2 ), hb_parnd( 3 ), hb_parnd( 4 ), hb_parnd( 5 ), ( HB_ISNUM( 6 ) ? ( Qt::AspectRatioMode ) hb_parni( 6 ) : ( Qt::AspectRatioMode ) Qt::IgnoreAspectRatio ) );
   }
}

/*
 * void fitInView ( const QGraphicsItem * item, Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio )
 */
HB_FUNC( QT_QGRAPHICSVIEW_FITINVIEW_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->fitInView( hbqt_par_QGraphicsItem( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::AspectRatioMode ) hb_parni( 3 ) : ( Qt::AspectRatioMode ) Qt::IgnoreAspectRatio ) );
   }
}

/*
 * QBrush foregroundBrush () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_FOREGROUNDBRUSH )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QBrush( new QBrush( ( p )->foregroundBrush() ), true ) );
   }
}

/*
 * bool isInteractive () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ISINTERACTIVE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retl( ( p )->isInteractive() );
   }
}

/*
 * QGraphicsItem * itemAt ( const QPoint & pos ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMAT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QGraphicsItem( ( p )->itemAt( *hbqt_par_QPoint( 2 ) ), false ) );
   }
}

/*
 * QGraphicsItem * itemAt ( int x, int y ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMAT_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QGraphicsItem( ( p )->itemAt( hb_parni( 2 ), hb_parni( 3 ) ), false ) );
   }
}

/*
 * QList<QGraphicsItem *> items () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items() ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( const QPoint & pos ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( *hbqt_par_QPoint( 2 ) ) ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( int x, int y ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( hb_parni( 2 ), hb_parni( 3 ) ) ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( int x, int y, int w, int h, Qt::ItemSelectionMode mode = Qt::IntersectsItemShape ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_3 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( hb_parni( 2 ), hb_parni( 3 ), hb_parni( 4 ), hb_parni( 5 ), ( HB_ISNUM( 6 ) ? ( Qt::ItemSelectionMode ) hb_parni( 6 ) : ( Qt::ItemSelectionMode ) Qt::IntersectsItemShape ) ) ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( const QRect & rect, Qt::ItemSelectionMode mode = Qt::IntersectsItemShape ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_4 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( *hbqt_par_QRect( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::ItemSelectionMode ) hb_parni( 3 ) : ( Qt::ItemSelectionMode ) Qt::IntersectsItemShape ) ) ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( const QPolygon & polygon, Qt::ItemSelectionMode mode = Qt::IntersectsItemShape ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_5 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( *hbqt_par_QPolygon( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::ItemSelectionMode ) hb_parni( 3 ) : ( Qt::ItemSelectionMode ) Qt::IntersectsItemShape ) ) ), true ) );
   }
}

/*
 * QList<QGraphicsItem *> items ( const QPainterPath & path, Qt::ItemSelectionMode mode = Qt::IntersectsItemShape ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_ITEMS_6 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QList( new QList<QGraphicsItem *>( ( p )->items( *hbqt_par_QPainterPath( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::ItemSelectionMode ) hb_parni( 3 ) : ( Qt::ItemSelectionMode ) Qt::IntersectsItemShape ) ) ), true ) );
   }
}

/*
 * QPoint mapFromScene ( const QPointF & point ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPoint( new QPoint( ( p )->mapFromScene( *hbqt_par_QPointF( 2 ) ) ), true ) );
   }
}

/*
 * QPolygon mapFromScene ( const QRectF & rect ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygon( new QPolygon( ( p )->mapFromScene( *hbqt_par_QRectF( 2 ) ) ), true ) );
   }
}

/*
 * QPolygon mapFromScene ( const QPolygonF & polygon ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygon( new QPolygon( ( p )->mapFromScene( *hbqt_par_QPolygonF( 2 ) ) ), true ) );
   }
}

/*
 * QPainterPath mapFromScene ( const QPainterPath & path ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE_3 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPainterPath( new QPainterPath( ( p )->mapFromScene( *hbqt_par_QPainterPath( 2 ) ) ), true ) );
   }
}

/*
 * QPoint mapFromScene ( qreal x, qreal y ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE_4 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPoint( new QPoint( ( p )->mapFromScene( hb_parnd( 2 ), hb_parnd( 3 ) ) ), true ) );
   }
}

/*
 * QPolygon mapFromScene ( qreal x, qreal y, qreal w, qreal h ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPFROMSCENE_5 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygon( new QPolygon( ( p )->mapFromScene( hb_parnd( 2 ), hb_parnd( 3 ), hb_parnd( 4 ), hb_parnd( 5 ) ) ), true ) );
   }
}

/*
 * QPointF mapToScene ( const QPoint & point ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPointF( new QPointF( ( p )->mapToScene( *hbqt_par_QPoint( 2 ) ) ), true ) );
   }
}

/*
 * QPolygonF mapToScene ( const QRect & rect ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygonF( new QPolygonF( ( p )->mapToScene( *hbqt_par_QRect( 2 ) ) ), true ) );
   }
}

/*
 * QPolygonF mapToScene ( const QPolygon & polygon ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE_2 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygonF( new QPolygonF( ( p )->mapToScene( *hbqt_par_QPolygon( 2 ) ) ), true ) );
   }
}

/*
 * QPainterPath mapToScene ( const QPainterPath & path ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE_3 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPainterPath( new QPainterPath( ( p )->mapToScene( *hbqt_par_QPainterPath( 2 ) ) ), true ) );
   }
}

/*
 * QPointF mapToScene ( int x, int y ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE_4 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPointF( new QPointF( ( p )->mapToScene( hb_parni( 2 ), hb_parni( 3 ) ) ), true ) );
   }
}

/*
 * QPolygonF mapToScene ( int x, int y, int w, int h ) const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MAPTOSCENE_5 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QPolygonF( new QPolygonF( ( p )->mapToScene( hb_parni( 2 ), hb_parni( 3 ), hb_parni( 4 ), hb_parni( 5 ) ) ), true ) );
   }
}

/*
 * QMatrix matrix () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_MATRIX )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QMatrix( new QMatrix( ( p )->matrix() ), true ) );
   }
}

/*
 * OptimizationFlags optimizationFlags () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_OPTIMIZATIONFLAGS )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::OptimizationFlags ) ( p )->optimizationFlags() );
   }
}

/*
 * void render ( QPainter * painter, const QRectF & target = QRectF(), const QRect & source = QRect(), Qt::AspectRatioMode aspectRatioMode = Qt::KeepAspectRatio )
 */
HB_FUNC( QT_QGRAPHICSVIEW_RENDER )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->render( hbqt_par_QPainter( 2 ), ( HB_ISPOINTER( 3 ) ? *hbqt_par_QRectF( 3 ) : QRectF() ), ( HB_ISPOINTER( 4 ) ? *hbqt_par_QRect( 4 ) : QRect() ), ( HB_ISNUM( 5 ) ? ( Qt::AspectRatioMode ) hb_parni( 5 ) : ( Qt::AspectRatioMode ) Qt::KeepAspectRatio ) );
   }
}

/*
 * QPainter::RenderHints renderHints () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_RENDERHINTS )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QPainter::RenderHints ) ( p )->renderHints() );
   }
}

/*
 * void resetCachedContent ()
 */
HB_FUNC( QT_QGRAPHICSVIEW_RESETCACHEDCONTENT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->resetCachedContent();
   }
}

/*
 * void resetMatrix ()
 */
HB_FUNC( QT_QGRAPHICSVIEW_RESETMATRIX )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->resetMatrix();
   }
}

/*
 * void resetTransform ()
 */
HB_FUNC( QT_QGRAPHICSVIEW_RESETTRANSFORM )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->resetTransform();
   }
}

/*
 * ViewportAnchor resizeAnchor () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_RESIZEANCHOR )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::ViewportAnchor ) ( p )->resizeAnchor() );
   }
}

/*
 * void rotate ( qreal angle )
 */
HB_FUNC( QT_QGRAPHICSVIEW_ROTATE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->rotate( hb_parnd( 2 ) );
   }
}

/*
 * Qt::ItemSelectionMode rubberBandSelectionMode () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_RUBBERBANDSELECTIONMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( Qt::ItemSelectionMode ) ( p )->rubberBandSelectionMode() );
   }
}

/*
 * void scale ( qreal sx, qreal sy )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SCALE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->scale( hb_parnd( 2 ), hb_parnd( 3 ) );
   }
}

/*
 * QGraphicsScene * scene () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_SCENE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QGraphicsScene( ( p )->scene(), false ) );
   }
}

/*
 * QRectF sceneRect () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_SCENERECT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QRectF( new QRectF( ( p )->sceneRect() ), true ) );
   }
}

/*
 * void setAlignment ( Qt::Alignment alignment )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETALIGNMENT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setAlignment( ( Qt::Alignment ) hb_parni( 2 ) );
   }
}

/*
 * void setBackgroundBrush ( const QBrush & brush )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETBACKGROUNDBRUSH )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setBackgroundBrush( *hbqt_par_QBrush( 2 ) );
   }
}

/*
 * void setCacheMode ( CacheMode mode )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETCACHEMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setCacheMode( ( QGraphicsView::CacheMode ) hb_parni( 2 ) );
   }
}

/*
 * void setDragMode ( DragMode mode )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETDRAGMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setDragMode( ( QGraphicsView::DragMode ) hb_parni( 2 ) );
   }
}

/*
 * void setForegroundBrush ( const QBrush & brush )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETFOREGROUNDBRUSH )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setForegroundBrush( *hbqt_par_QBrush( 2 ) );
   }
}

/*
 * void setInteractive ( bool allowed )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETINTERACTIVE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setInteractive( hb_parl( 2 ) );
   }
}

/*
 * void setMatrix ( const QMatrix & matrix, bool combine = false )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETMATRIX )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setMatrix( *hbqt_par_QMatrix( 2 ), hb_parl( 3 ) );
   }
}

/*
 * void setOptimizationFlag ( OptimizationFlag flag, bool enabled = true )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETOPTIMIZATIONFLAG )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setOptimizationFlag( ( QGraphicsView::OptimizationFlag ) hb_parni( 2 ), hb_parl( 3 ) );
   }
}

/*
 * void setOptimizationFlags ( OptimizationFlags flags )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETOPTIMIZATIONFLAGS )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setOptimizationFlags( ( QGraphicsView::OptimizationFlags ) hb_parni( 2 ) );
   }
}

/*
 * void setRenderHint ( QPainter::RenderHint hint, bool enabled = true )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETRENDERHINT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setRenderHint( ( QPainter::RenderHint ) hb_parni( 2 ), hb_parl( 3 ) );
   }
}

/*
 * void setRenderHints ( QPainter::RenderHints hints )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETRENDERHINTS )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setRenderHints( ( QPainter::RenderHints ) hb_parni( 2 ) );
   }
}

/*
 * void setResizeAnchor ( ViewportAnchor anchor )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETRESIZEANCHOR )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setResizeAnchor( ( QGraphicsView::ViewportAnchor ) hb_parni( 2 ) );
   }
}

/*
 * void setRubberBandSelectionMode ( Qt::ItemSelectionMode mode )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETRUBBERBANDSELECTIONMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setRubberBandSelectionMode( ( Qt::ItemSelectionMode ) hb_parni( 2 ) );
   }
}

/*
 * void setScene ( QGraphicsScene * scene )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETSCENE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setScene( hbqt_par_QGraphicsScene( 2 ) );
   }
}

/*
 * void setSceneRect ( const QRectF & rect )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETSCENERECT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setSceneRect( *hbqt_par_QRectF( 2 ) );
   }
}

/*
 * void setSceneRect ( qreal x, qreal y, qreal w, qreal h )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETSCENERECT_1 )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setSceneRect( hb_parnd( 2 ), hb_parnd( 3 ), hb_parnd( 4 ), hb_parnd( 5 ) );
   }
}

/*
 * void setTransform ( const QTransform & matrix, bool combine = false )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETTRANSFORM )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setTransform( *hbqt_par_QTransform( 2 ), hb_parl( 3 ) );
   }
}

/*
 * void setTransformationAnchor ( ViewportAnchor anchor )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETTRANSFORMATIONANCHOR )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setTransformationAnchor( ( QGraphicsView::ViewportAnchor ) hb_parni( 2 ) );
   }
}

/*
 * void setViewportUpdateMode ( ViewportUpdateMode mode )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SETVIEWPORTUPDATEMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->setViewportUpdateMode( ( QGraphicsView::ViewportUpdateMode ) hb_parni( 2 ) );
   }
}

/*
 * void shear ( qreal sh, qreal sv )
 */
HB_FUNC( QT_QGRAPHICSVIEW_SHEAR )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->shear( hb_parnd( 2 ), hb_parnd( 3 ) );
   }
}

/*
 * QTransform transform () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_TRANSFORM )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QTransform( new QTransform( ( p )->transform() ), true ) );
   }
}

/*
 * ViewportAnchor transformationAnchor () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_TRANSFORMATIONANCHOR )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::ViewportAnchor ) ( p )->transformationAnchor() );
   }
}

/*
 * void translate ( qreal dx, qreal dy )
 */
HB_FUNC( QT_QGRAPHICSVIEW_TRANSLATE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->translate( hb_parnd( 2 ), hb_parnd( 3 ) );
   }
}

/*
 * QTransform viewportTransform () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_VIEWPORTTRANSFORM )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QTransform( new QTransform( ( p )->viewportTransform() ), true ) );
   }
}

/*
 * ViewportUpdateMode viewportUpdateMode () const
 */
HB_FUNC( QT_QGRAPHICSVIEW_VIEWPORTUPDATEMODE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      hb_retni( ( QGraphicsView::ViewportUpdateMode ) ( p )->viewportUpdateMode() );
   }
}

/*
 * void invalidateScene ( const QRectF & rect = QRectF(), QGraphicsScene::SceneLayers layers = QGraphicsScene::AllLayers )
 */
HB_FUNC( QT_QGRAPHICSVIEW_INVALIDATESCENE )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->invalidateScene( ( HB_ISPOINTER( 2 ) ? *hbqt_par_QRectF( 2 ) : QRectF() ), ( HB_ISNUM( 3 ) ? ( QGraphicsScene::SceneLayers ) hb_parni( 3 ) : ( QGraphicsScene::SceneLayers ) QGraphicsScene::AllLayers ) );
   }
}

/*
 * void updateSceneRect ( const QRectF & rect )
 */
HB_FUNC( QT_QGRAPHICSVIEW_UPDATESCENERECT )
{
   QGraphicsView * p = hbqt_par_QGraphicsView( 1 );
   if( p )
   {
      ( p )->updateSceneRect( *hbqt_par_QRectF( 2 ) );
   }
}


/*----------------------------------------------------------------------*/
#endif             /* #if QT_VERSION >= 0x040500 */
/*----------------------------------------------------------------------*/