//
//  AMPAutoLayoutHeight.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableViewCell (AMPAutoLayoutHeight)

- (CGFloat)amp_heightWithWidth:(CGFloat)width customizationBlock:(void (^)(id cell))customizationBlock;

@end
