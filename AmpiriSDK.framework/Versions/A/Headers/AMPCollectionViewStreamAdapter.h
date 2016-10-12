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

@property (nonatomic, weak) id <AMPCollectionViewStreamAdapterDelegate> delegate;

/**
 * There is a bug in UICollectionView, it interchanges the minimumInteritemSpacing and minimumLineSpacing if items have different size. If all items in collection have the same size, do not interchange it by yourself, we will do it automatically for you. If you interchange spacings on your side, set this flag to NO and we won't interchange them
 */
@property (nonatomic, assign) BOOL interchangeLayoutSpacings;
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


@protocol AMPCollectionViewStreamAdapterDelegate <NSObject>


/**
 *  Rendered native ad cell size at index path if it should be displayed
 *  @param indexPath               - index path of cell where the ad has to be displayed
 *
 *  @return size of rendered ad cell at index path
 */
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath;

@end
