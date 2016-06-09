//
//  AMPAutoLayoutHeight.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//
#import "UITableViewCell+AMPAutoLayoutHeight.h"


@implementation UITableViewCell (AMPAutoLayoutHeight)

- (CGFloat)amp_heightWithWidth:(CGFloat)width customizationBlock:(void (^)(id cell))customizationBlock {
    CGRect cellBounds = [self bounds];
    cellBounds.size.width = width;
    [self setBounds:cellBounds];
    
    if (customizationBlock) {
        customizationBlock(self);
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    return height;
}

@end
