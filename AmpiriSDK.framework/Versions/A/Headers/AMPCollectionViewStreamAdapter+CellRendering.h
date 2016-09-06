//
//  AMPCollectionViewStreamAdapter+CellRendering.h
//  AmpiriSDK
//
//  Created by Viacheslav Leonov on 04.08.16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMPCollectionViewStreamAdapter.h"

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
