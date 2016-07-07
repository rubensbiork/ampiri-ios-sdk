//
//  AMPCollectionViewStreamAdapter.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPStreamAdapter.h"
#import "AMPAdTypes.h"

@class AMPTemplateCustomizationObject;
@protocol AMPCollectionViewStreamAdapterDelegate;



@interface AMPCollectionViewStreamAdapter : AMPStreamAdapter

@property (nonatomic, weak) id<AMPCollectionViewStreamAdapterDelegate> delegate;

@end


@interface AMPCollectionViewStreamAdapter (AMPCollectionViewEditMode)

/**
 *  If you want to insert rows use this methods for correct working location control
 *  @param indexPaths               - array of index paths which you would like to insert
 */
- (void)insertItemsAtIndexPaths:(NSArray *)indexPaths;

/**
 *  If you want to delete rows use this methods for correct working location control
 *  @param indexPaths               - array of index paths which you would like to delete
 */
- (void)deleteItemsAtIndexPaths:(NSArray *)indexPaths;

@end

@interface AMPCollectionViewStreamAdapter (AMPCollectionViewCellRendering)

/**
 *  Render the native ad cell at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *  @param adCell                  - cell where ad should be rendered
 *
 *  @return UICollectionViewCell with rendered native ad at index path
 */
- (UICollectionViewCell *)adRenderedAdCellAtIndexPath:(NSIndexPath *)indexPath inCell:(UICollectionViewCell *)adCell;

@end


@protocol AMPCollectionViewStreamAdapterDelegate <NSObject>


/**
 *  Rendered native ad cell size at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *
 *  @return size of rendered ad cell at index path
 */
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath;

@end



@interface UICollectionView (AMPLocationControl)

@property (nonatomic, strong, readonly) AMPCollectionViewStreamAdapter *streamAdapter;

- (id)amp_dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (NSArray *)amp_indexPathsForSelectedItems;

- (void)amp_selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition;

- (void)amp_deselectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

- (UICollectionViewLayoutAttributes *)amp_layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)amp_indexPathForItemAtPoint:(CGPoint)point;

- (NSIndexPath *)amp_indexPathForCell:(UICollectionViewCell *)cell;

- (NSArray *)amp_visibleCells;

- (NSArray *)amp_indexPathsForVisibleItems;

- (void)amp_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)amp_insertSections:(NSIndexSet *)sections;

- (void)amp_deleteSections:(NSIndexSet *)sections;

- (void)amp_moveSection:(NSInteger)section toSection:(NSInteger)newSection;

- (void)amp_insertItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)amp_deleteItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)amp_reloadItemsAtIndexPaths:(NSArray *)indexPaths;

- (void)amp_moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

@end