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
 *  enum Roles { FileIconRole, FilePathRole, FileNameRole }
 */

/*
 *  Constructed[ 37/37 [ 100.00% ] ]
 *
 *
 *  *** Commented out protostypes ***
 *
 *  // virtual QMimeData * mimeData ( const QModelIndexList & indexes ) const
 */

#include <QtCore/QPointer>

#include <QtGui/QDirModel>


/*
 * QDirModel ( const QStringList & nameFilters, QDir::Filters filters, QDir::SortFlags sort, QObject * parent = 0 )
 * QDirModel ( QObject * parent = 0 )
 * ~QDirModel ()
 */

typedef struct
{
   QPointer< QDirModel > ph;
   bool bNew;
   PHBQT_GC_FUNC func;
   int type;
} HBQT_GC_T_QDirModel;

HBQT_GC_FUNC( hbqt_gcRelease_QDirModel )
{
   QDirModel  * ph = NULL ;
   HBQT_GC_T_QDirModel * p = ( HBQT_GC_T_QDirModel * ) Cargo;

   if( p && p->bNew && p->ph )
   {
      ph = p->ph;
      if( ph )
      {
         const QMetaObject * m = ( ph )->metaObject();
         if( ( QString ) m->className() != ( QString ) "QObject" )
         {
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p %p YES_rel_QDirModel   /.\\   ", (void*) ph, (void*) p->ph ) );
            delete ( p->ph );
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p %p YES_rel_QDirModel   \\./   ", (void*) ph, (void*) p->ph ) );
            p->ph = NULL;
         }
         else
         {
            HB_TRACE( HB_TR_DEBUG, ( "ph=%p NO__rel_QDirModel          ", ph ) );
            p->ph = NULL;
         }
      }
      else
      {
         HB_TRACE( HB_TR_DEBUG, ( "ph=%p DEL_rel_QDirModel    :     Object already deleted!", ph ) );
         p->ph = NULL;
      }
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p PTR_rel_QDirModel    :    Object not created with new=true", ph ) );
      p->ph = NULL;
   }
}

void * hbqt_gcAllocate_QDirModel( void * pObj, bool bNew )
{
   HBQT_GC_T_QDirModel * p = ( HBQT_GC_T_QDirModel * ) hb_gcAllocate( sizeof( HBQT_GC_T_QDirModel ), hbqt_gcFuncs() );

   new( & p->ph ) QPointer< QDirModel >( ( QDirModel * ) pObj );
   p->bNew = bNew;
   p->func = hbqt_gcRelease_QDirModel;
   p->type = HBQT_TYPE_QDirModel;

   if( bNew )
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p    _new_QDirModel  under p->pq", pObj ) );
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p NOT_new_QDirModel", pObj ) );
   }
   return p;
}

HB_FUNC( QT_QDIRMODEL )
{
   QDirModel * pObj = NULL;

   pObj = new QDirModel( hbqt_par_QObject( 1 ) ) ;

   hb_retptrGC( hbqt_gcAllocate_QDirModel( ( void * ) pObj, true ) );
}

/*
 * virtual int columnCount ( const QModelIndex & parent = QModelIndex() ) const
 */
HB_FUNC( QT_QDIRMODEL_COLUMNCOUNT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( p )->columnCount( ( HB_ISPOINTER( 2 ) ? *hbqt_par_QModelIndex( 2 ) : QModelIndex() ) ) );
   }
}

/*
 * virtual QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole ) const
 */
HB_FUNC( QT_QDIRMODEL_DATA )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QVariant( new QVariant( ( p )->data( *hbqt_par_QModelIndex( 2 ), hb_parnidef( 3, Qt::DisplayRole ) ) ), true ) );
   }
}

/*
 * virtual bool dropMimeData ( const QMimeData * data, Qt::DropAction action, int row, int column, const QModelIndex & parent )
 */
HB_FUNC( QT_QDIRMODEL_DROPMIMEDATA )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->dropMimeData( hbqt_par_QMimeData( 2 ), ( Qt::DropAction ) hb_parni( 3 ), hb_parni( 4 ), hb_parni( 5 ), *hbqt_par_QModelIndex( 6 ) ) );
   }
}

/*
 * QIcon fileIcon ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_FILEICON )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QIcon( new QIcon( ( p )->fileIcon( *hbqt_par_QModelIndex( 2 ) ) ), true ) );
   }
}

/*
 * QFileInfo fileInfo ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_FILEINFO )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QFileInfo( new QFileInfo( ( p )->fileInfo( *hbqt_par_QModelIndex( 2 ) ) ), true ) );
   }
}

/*
 * QString fileName ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_FILENAME )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retstr_utf8( ( p )->fileName( *hbqt_par_QModelIndex( 2 ) ).toUtf8().data() );
   }
}

/*
 * QString filePath ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_FILEPATH )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retstr_utf8( ( p )->filePath( *hbqt_par_QModelIndex( 2 ) ).toUtf8().data() );
   }
}

/*
 * QDir::Filters filter () const
 */
HB_FUNC( QT_QDIRMODEL_FILTER )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( QDir::Filters ) ( p )->filter() );
   }
}

/*
 * virtual Qt::ItemFlags flags ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_FLAGS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( Qt::ItemFlags ) ( p )->flags( *hbqt_par_QModelIndex( 2 ) ) );
   }
}

/*
 * virtual bool hasChildren ( const QModelIndex & parent = QModelIndex() ) const
 */
HB_FUNC( QT_QDIRMODEL_HASCHILDREN )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->hasChildren( ( HB_ISPOINTER( 2 ) ? *hbqt_par_QModelIndex( 2 ) : QModelIndex() ) ) );
   }
}

/*
 * virtual QVariant headerData ( int section, Qt::Orientation orientation, int role = Qt::DisplayRole ) const
 */
HB_FUNC( QT_QDIRMODEL_HEADERDATA )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QVariant( new QVariant( ( p )->headerData( hb_parni( 2 ), ( Qt::Orientation ) hb_parni( 3 ), hb_parnidef( 4, Qt::DisplayRole ) ) ), true ) );
   }
}

/*
 * QFileIconProvider * iconProvider () const
 */
HB_FUNC( QT_QDIRMODEL_ICONPROVIDER )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QFileIconProvider( ( p )->iconProvider(), false ) );
   }
}

/*
 * virtual QModelIndex index ( int row, int column, const QModelIndex & parent = QModelIndex() ) const
 */
HB_FUNC( QT_QDIRMODEL_INDEX )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QModelIndex( new QModelIndex( ( p )->index( hb_parni( 2 ), hb_parni( 3 ), ( HB_ISPOINTER( 4 ) ? *hbqt_par_QModelIndex( 4 ) : QModelIndex() ) ) ), true ) );
   }
}

/*
 * QModelIndex index ( const QString & path, int column = 0 ) const
 */
HB_FUNC( QT_QDIRMODEL_INDEX_1 )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      void * pText;
      hb_retptrGC( hbqt_gcAllocate_QModelIndex( new QModelIndex( ( p )->index( hb_parstr_utf8( 2, &pText, NULL ), hb_parni( 3 ) ) ), true ) );
      hb_strfree( pText );
   }
}

/*
 * bool isDir ( const QModelIndex & index ) const
 */
HB_FUNC( QT_QDIRMODEL_ISDIR )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->isDir( *hbqt_par_QModelIndex( 2 ) ) );
   }
}

/*
 * bool isReadOnly () const
 */
HB_FUNC( QT_QDIRMODEL_ISREADONLY )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->isReadOnly() );
   }
}

/*
 * bool lazyChildCount () const
 */
HB_FUNC( QT_QDIRMODEL_LAZYCHILDCOUNT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->lazyChildCount() );
   }
}

/*
 * virtual QStringList mimeTypes () const
 */
HB_FUNC( QT_QDIRMODEL_MIMETYPES )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QStringList( new QStringList( ( p )->mimeTypes() ), true ) );
   }
}

/*
 * QModelIndex mkdir ( const QModelIndex & parent, const QString & name )
 */
HB_FUNC( QT_QDIRMODEL_MKDIR )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      void * pText;
      hb_retptrGC( hbqt_gcAllocate_QModelIndex( new QModelIndex( ( p )->mkdir( *hbqt_par_QModelIndex( 2 ), hb_parstr_utf8( 3, &pText, NULL ) ) ), true ) );
      hb_strfree( pText );
   }
}

/*
 * QStringList nameFilters () const
 */
HB_FUNC( QT_QDIRMODEL_NAMEFILTERS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QStringList( new QStringList( ( p )->nameFilters() ), true ) );
   }
}

/*
 * virtual QModelIndex parent ( const QModelIndex & child ) const
 */
HB_FUNC( QT_QDIRMODEL_PARENT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retptrGC( hbqt_gcAllocate_QModelIndex( new QModelIndex( ( p )->parent( *hbqt_par_QModelIndex( 2 ) ) ), true ) );
   }
}

/*
 * bool remove ( const QModelIndex & index )
 */
HB_FUNC( QT_QDIRMODEL_REMOVE )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->remove( *hbqt_par_QModelIndex( 2 ) ) );
   }
}

/*
 * bool resolveSymlinks () const
 */
HB_FUNC( QT_QDIRMODEL_RESOLVESYMLINKS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->resolveSymlinks() );
   }
}

/*
 * bool rmdir ( const QModelIndex & index )
 */
HB_FUNC( QT_QDIRMODEL_RMDIR )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->rmdir( *hbqt_par_QModelIndex( 2 ) ) );
   }
}

/*
 * virtual int rowCount ( const QModelIndex & parent = QModelIndex() ) const
 */
HB_FUNC( QT_QDIRMODEL_ROWCOUNT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( p )->rowCount( ( HB_ISPOINTER( 2 ) ? *hbqt_par_QModelIndex( 2 ) : QModelIndex() ) ) );
   }
}

/*
 * virtual bool setData ( const QModelIndex & index, const QVariant & value, int role = Qt::EditRole )
 */
HB_FUNC( QT_QDIRMODEL_SETDATA )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retl( ( p )->setData( *hbqt_par_QModelIndex( 2 ), *hbqt_par_QVariant( 3 ), hb_parnidef( 4, Qt::EditRole ) ) );
   }
}

/*
 * void setFilter ( QDir::Filters filters )
 */
HB_FUNC( QT_QDIRMODEL_SETFILTER )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setFilter( ( QDir::Filters ) hb_parni( 2 ) );
   }
}

/*
 * void setIconProvider ( QFileIconProvider * provider )
 */
HB_FUNC( QT_QDIRMODEL_SETICONPROVIDER )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setIconProvider( hbqt_par_QFileIconProvider( 2 ) );
   }
}

/*
 * void setLazyChildCount ( bool enable )
 */
HB_FUNC( QT_QDIRMODEL_SETLAZYCHILDCOUNT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setLazyChildCount( hb_parl( 2 ) );
   }
}

/*
 * void setNameFilters ( const QStringList & filters )
 */
HB_FUNC( QT_QDIRMODEL_SETNAMEFILTERS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setNameFilters( *hbqt_par_QStringList( 2 ) );
   }
}

/*
 * void setReadOnly ( bool enable )
 */
HB_FUNC( QT_QDIRMODEL_SETREADONLY )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setReadOnly( hb_parl( 2 ) );
   }
}

/*
 * void setResolveSymlinks ( bool enable )
 */
HB_FUNC( QT_QDIRMODEL_SETRESOLVESYMLINKS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setResolveSymlinks( hb_parl( 2 ) );
   }
}

/*
 * void setSorting ( QDir::SortFlags sort )
 */
HB_FUNC( QT_QDIRMODEL_SETSORTING )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->setSorting( ( QDir::SortFlags ) hb_parni( 2 ) );
   }
}

/*
 * virtual void sort ( int column, Qt::SortOrder order = Qt::AscendingOrder )
 */
HB_FUNC( QT_QDIRMODEL_SORT )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->sort( hb_parni( 2 ), ( HB_ISNUM( 3 ) ? ( Qt::SortOrder ) hb_parni( 3 ) : ( Qt::SortOrder ) Qt::AscendingOrder ) );
   }
}

/*
 * QDir::SortFlags sorting () const
 */
HB_FUNC( QT_QDIRMODEL_SORTING )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( QDir::SortFlags ) ( p )->sorting() );
   }
}

/*
 * virtual Qt::DropActions supportedDropActions () const
 */
HB_FUNC( QT_QDIRMODEL_SUPPORTEDDROPACTIONS )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      hb_retni( ( Qt::DropActions ) ( p )->supportedDropActions() );
   }
}

/*
 * void refresh ( const QModelIndex & parent = QModelIndex() )
 */
HB_FUNC( QT_QDIRMODEL_REFRESH )
{
   QDirModel * p = hbqt_par_QDirModel( 1 );
   if( p )
   {
      ( p )->refresh( ( HB_ISPOINTER( 2 ) ? *hbqt_par_QModelIndex( 2 ) : QModelIndex() ) );
   }
}


/*----------------------------------------------------------------------*/
#endif             /* #if QT_VERSION >= 0x040500 */
/*----------------------------------------------------------------------*/