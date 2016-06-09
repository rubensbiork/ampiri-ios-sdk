//
//  CollectionCircleLayoutAttributes.h
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCircleLayoutAttributes : UICollectionViewLayoutAttributes <NSCopying>

@property (nonatomic, assign) CGPoint anchorPoint;
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, assign) BOOL cornerRound;

@end
