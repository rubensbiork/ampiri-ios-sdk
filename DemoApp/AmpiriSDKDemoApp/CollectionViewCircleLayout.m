//
//  CollectionViewCircleLayout.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "CollectionViewCircleLayout.h"
#import "CollectionCircleLayoutAttributes.h"

@interface CollectionViewCircleLayout ()
@property (nonatomic, strong) NSMutableArray *attributesList;
@end

@implementation CollectionViewCircleLayout
@synthesize radius = _radius;
@synthesize itemSize = _itemSize;

- (id)init {
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(290, 160);
        self.radius = 500;
        self.attributesList = [NSMutableArray new];
    }
    return self;
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
    [self invalidateLayout];
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    [self invalidateLayout];
}


#pragma mark - Private

- (CGFloat)anglePerItem {
    return atan(self.itemSize.width / self.radius);
}

- (CGFloat)angleAtExtreme {
    NSInteger itemNumbers = [self itemNumbers];
    return itemNumbers > 0 ? -itemNumbers * [self anglePerItem] : 0;
}

- (NSInteger)itemNumbers {
    return [self.collectionView numberOfItemsInSection:0];
}

- (CGFloat)angle {
    return [self angleAtExtreme] * self.collectionView.contentOffset.x / ([self collectionViewContentSize].width - CGRectGetWidth(self.collectionView.bounds));
}

- (CGFloat)theta {
    return atan2(CGRectGetWidth(self.collectionView.bounds) / 2, self.radius + self.itemSize.height / 2 - CGRectGetHeight(self.collectionView.bounds) / 2);
}

#pragma mark - Overriden

- (CGSize)collectionViewContentSize {
    return CGSizeMake([self.collectionView numberOfItemsInSection:0] * self.itemSize.width, CGRectGetHeight(self.collectionView.bounds));
}

+ (Class)layoutAttributesClass {
    return [CollectionCircleLayoutAttributes class];
}

- (void)prepareLayout {
    [super prepareLayout];
    
    NSInteger centerX = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.bounds) / 2;
    NSInteger anchorPointY = (self.itemSize.height / 2 + self.radius) / self.itemSize.height;
    
    CGFloat currAngle = [self angle];
    CGFloat anglePerItem = [self anglePerItem];
    
    NSInteger startVisibleIndex = 0;
    NSInteger endVisibleIndex = [self itemNumbers] - 1;
    CGFloat thetaAngle = [self theta];
    if (currAngle < -thetaAngle) {
        startVisibleIndex = MAX(0, (int) floor((-thetaAngle - currAngle) / anglePerItem) - 2);
    }
    endVisibleIndex = MIN (endVisibleIndex, (int) (ceil((thetaAngle - currAngle) / anglePerItem)) + 2);
    if (endVisibleIndex < startVisibleIndex) {
        endVisibleIndex = 0;
        startVisibleIndex = 0;
    }
    
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i = 0; i < [self itemNumbers]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        CollectionCircleLayoutAttributes *attributes = [CollectionCircleLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        if (i >= startVisibleIndex && i <= endVisibleIndex) {
            attributes.size = self.itemSize;
            attributes.center = CGPointMake(centerX, CGRectGetMidY(self.collectionView.bounds));
            attributes.angle = currAngle + anglePerItem * i;
            attributes.anchorPoint = CGPointMake(0.5, anchorPointY);
            attributes.alpha = 1;
            attributes.hidden = NO;
            
            BOOL defaultAttr = YES;
            if ([self.delegate respondsToSelector:@selector(shouldUseDefaultAttributeForItemAtIndexPath:)]) {
                defaultAttr = [self.delegate shouldUseDefaultAttributeForItemAtIndexPath:indexPath];
            }
            
            if (defaultAttr) {
                attributes.cornerRound = NO;
            } else {
                attributes.cornerRound = YES;
            }
            
        } else {
            attributes.center = CGPointMake(centerX, 2000);
            attributes.alpha = 0;
            attributes.hidden = YES;
            attributes.cornerRound = NO;
        }
        [array addObject:attributes];
    }
    self.attributesList = array;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesList;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.attributesList[indexPath.row];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


@end
