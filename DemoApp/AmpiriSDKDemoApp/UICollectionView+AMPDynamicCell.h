//
//  AMPAutoLayoutHeight.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICollectionView (AMPDynamicCell)

- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                          configuration:(void (^)(__kindof UICollectionViewCell *))configuration;

- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                             fixedWidth:(CGFloat)fixedWidth
                          configuration:(void (^)(__kindof UICollectionViewCell *cell))configuration;

- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                            fixedHeight:(CGFloat)fixedHeight
                          configuration:(void (^)(__kindof UICollectionViewCell *cell))configuration;

@end
