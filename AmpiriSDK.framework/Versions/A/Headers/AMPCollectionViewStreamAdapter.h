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

@interface AMPCollectionViewStreamAdapter : AMPStreamAdapter

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
- (UICollectionViewCell*)adRenderedAdCellAtIndexPath:(NSIndexPath *)indexPath inCell:(UICollectionViewCell*)adCell;

/**
 *  Rendered native ad cell size at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *  @param width                   - width of cell where the ad has to be displayed
 *
 *  @return size of rendered ad cell at index path
 */
- (CGSize)adCellSizeForIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width;

@end
