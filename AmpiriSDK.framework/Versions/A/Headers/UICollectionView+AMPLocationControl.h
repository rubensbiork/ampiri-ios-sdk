//
//  UICollectionView+AMPLocationControl.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 04.08.16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMPCollectionViewStreamAdapter;

@interface UICollectionView (AMPLocationControl)

@property (nonatomic, strong, readonly) AMPCollectionViewStreamAdapter *streamAdapter;

- (void)amp_reloadData;

- (id)amp_dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (NSArray *)amp_indexPathsForSelectedItems;

- (void)amp_selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition;

- (void)amp_deselectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

- (UICollectionViewLayoutAttributes *)amp_layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)amp_indexPathForItemAtPoint:(CGPoint)point;

- (NSIndexPath *)amp_indexPathForCell:(UICollectionViewCell *)cell;

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
