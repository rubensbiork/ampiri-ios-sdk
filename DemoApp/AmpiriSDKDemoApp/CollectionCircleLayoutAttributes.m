//
//  CollectionCircleLayoutAttributes.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "CollectionCircleLayoutAttributes.h"


@implementation CollectionCircleLayoutAttributes
@synthesize angle = _angle;

- (id)init {
    self = [super init];
    if (self) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}

- (void)setAngle:(CGFloat)angle {
    _angle = angle;
    self.zIndex = (NSInteger) (angle * 1000000);
    self.transform = CGAffineTransformMakeRotation(angle);
}

- (id)copyWithZone:(nullable NSZone *)zone {
    CollectionCircleLayoutAttributes *copiedAttributes = [super copyWithZone:zone];
    copiedAttributes.anchorPoint = self.anchorPoint;
    copiedAttributes.angle = self.angle;
    copiedAttributes.cornerRound = self.cornerRound;
    return copiedAttributes;
}


@end
