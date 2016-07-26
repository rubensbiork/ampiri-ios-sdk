//
//  AMPAdContainerCollectionViewCell.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 20/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPAdContainerCollectionViewCell.h"
#import "CollectionCircleLayoutAttributes.h"

@implementation AMPAdContainerCollectionViewCell

#pragma mark - overriden methods

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[CollectionCircleLayoutAttributes class]]) {
        CollectionCircleLayoutAttributes *atributes = (CollectionCircleLayoutAttributes *) layoutAttributes;
        self.layer.anchorPoint = atributes.anchorPoint;
        self.center = CGPointMake(self.center.x, (atributes.anchorPoint.y + 0.5) * CGRectGetHeight(self.bounds));
        self.layer.masksToBounds = atributes.cornerRound;
        self.layer.cornerRadius = atributes.cornerRound ? 10 : 0;
    }
}
@end
