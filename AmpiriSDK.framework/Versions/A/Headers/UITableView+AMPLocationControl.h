//
//  UITableView+AMPLocationControl.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 04.08.16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMPTableViewStreamAdapter;

@interface UITableView (AMPLocationControl)

@property (nonatomic, strong, readonly) AMPTableViewStreamAdapter *streamAdapter;

- (void)amp_reloadData;

- (CGRect)amp_rectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)amp_indexPathForRowAtPoint:(CGPoint)point;

- (NSIndexPath *)amp_indexPathForCell:(UITableViewCell *)cell;

- (NSArray *)amp_indexPathsForRowsInRect:(CGRect)rect;

- (NSArray *)amp_indexPathsForVisibleRows;

- (void)amp_scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)amp_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)amp_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)amp_moveSection:(NSInteger)section toSection:(NSInteger)newSection;

- (void)amp_insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)amp_deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)amp_reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)amp_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

- (NSIndexPath *)amp_indexPathForSelectedRow;

- (NSArray *)amp_indexPathsForSelectedRows;

- (void)amp_selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

- (void)amp_deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

- (id)amp_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end

