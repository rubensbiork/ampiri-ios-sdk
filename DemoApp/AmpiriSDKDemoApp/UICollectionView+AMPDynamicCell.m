//
//  AMPAutoLayoutHeight.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "UICollectionView+AMPDynamicCell.h"
#import <objc/runtime.h>


typedef NS_ENUM(NSUInteger, AMPDynamicSizeCaculateType) {
    AMPDynamicSizeCaculateTypeSize = 0,
    AMPDynamicSizeCaculateTypeHeight,
    AMPDynamicSizeCaculateTypeWidth
};

#define AMPLayoutCellInvalidateValue [NSValue valueWithCGSize:CGSizeZero]

@implementation UICollectionView (AMPDynamicCell)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingMethods];
    });
}


+ (void)swizzlingMethods {
    SEL selectors[] = {
        @selector(registerNib:forCellWithReuseIdentifier:),
        @selector(registerClass:forCellWithReuseIdentifier:),
        @selector(reloadData),
        @selector(reloadSections:),
        @selector(deleteSections:),
        @selector(moveSection:toSection:),
        @selector(reloadItemsAtIndexPaths:),
        @selector(deleteItemsAtIndexPaths:),
        @selector(moveItemAtIndexPath:toIndexPath:)
    };

    for (int i = 0; i < sizeof(selectors) / sizeof(SEL); i++) {
        SEL originalSelector = selectors[i];
        SEL swizzledSelector = NSSelectorFromString([@"amp_"
                                                        stringByAppendingString:NSStringFromSelector(originalSelector)]);

        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);

        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                          configuration:
              (void (^)(__kindof UICollectionViewCell *))
              configuration {
    return [self amp_sizeForCellWithIdentifier:identifier
                                     indexPath:indexPath
                                    fixedValue:0
                                  caculateType:AMPDynamicSizeCaculateTypeSize
                                 configuration:configuration];
}


- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                             fixedWidth:(CGFloat)fixedWidth
                          configuration:
              (void (^)(__kindof UICollectionViewCell *cell))
              configuration {
    return [self amp_sizeForCellWithIdentifier:identifier
                                     indexPath:indexPath
                                    fixedValue:fixedWidth
                                  caculateType:AMPDynamicSizeCaculateTypeWidth
                                 configuration:configuration];
}


- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                            fixedHeight:(CGFloat)fixedHeight
                          configuration:
              (void (^)(__kindof UICollectionViewCell *cell))
              configuration {
    return [self amp_sizeForCellWithIdentifier:identifier
                                     indexPath:indexPath
                                    fixedValue:fixedHeight
                                  caculateType:AMPDynamicSizeCaculateTypeHeight
                                 configuration:configuration];
}


- (CGSize)amp_sizeForCellWithIdentifier:(NSString *)identifier
                              indexPath:(NSIndexPath *)indexPath
                             fixedValue:(CGFloat)fixedValue
                           caculateType:(AMPDynamicSizeCaculateType)caculateType
                          configuration:
              (void (^)(__kindof UICollectionViewCell *))
              configuration {
    BOOL hasCache = [self hasCacheAtIndexPath:indexPath];
    if (hasCache) {
        if (![[self sizeCacheAtIndexPath:indexPath]
                    isEqualToValue:AMPLayoutCellInvalidateValue]) {
            return [[self sizeCacheAtIndexPath:indexPath] CGSizeValue];
        }
    }

    UICollectionViewCell *cell =
        [self templeCaculateCellWithIdentifier:identifier];
    configuration(cell);
    CGSize size = CGSizeMake(fixedValue, fixedValue);
    if (caculateType != AMPDynamicSizeCaculateTypeSize) {
        NSLayoutAttribute attribute = caculateType == AMPDynamicSizeCaculateTypeWidth
            ? NSLayoutAttributeWidth
            : NSLayoutAttributeHeight;
        NSLayoutConstraint *tempConstraint =
            [NSLayoutConstraint constraintWithItem:cell.contentView
                                         attribute:attribute
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1
                                          constant:fixedValue];
        [cell.contentView addConstraint:tempConstraint];
        size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        [cell.contentView removeConstraint:tempConstraint];
    } else {
        size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    }

    NSMutableArray *sectionCache = [self sizeCache][indexPath.section];
    NSValue *sizeValue = [NSValue valueWithCGSize:size];
    if (hasCache) {
        [sectionCache replaceObjectAtIndex:indexPath.row withObject:sizeValue];
    } else {
        [sectionCache insertObject:sizeValue atIndex:indexPath.row];
    }
    return size;
}


#pragma mark - swizzled methods


- (void) amp_registerClass:(Class)cellClass
forCellWithReuseIdentifier:(NSString *)identifier {
    [self amp_registerClass:cellClass forCellWithReuseIdentifier:identifier];

    id cell = [[cellClass alloc] initWithFrame:CGRectZero];
    NSMutableDictionary *templeCells = [self templeCells];
    templeCells[identifier] = cell;
}


- (void)   amp_registerNib:(UINib *)nib
forCellWithReuseIdentifier:(NSString *)identifier {
    [self amp_registerNib:nib forCellWithReuseIdentifier:identifier];
    id cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    NSMutableDictionary *templeCells = [self templeCells];
    templeCells[identifier] = cell;
}


#pragma mark - section changes


- (void)amp_reloadSections:(NSIndexSet *)sections {
    [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [[self sizeCache] replaceObjectAtIndex:idx withObject:@[].mutableCopy];
    }];
    [self amp_reloadSections:sections];
}


- (void)amp_deleteSections:(NSIndexSet *)sections {
    [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [[self sizeCache] removeObjectAtIndex:idx];
    }];
    [self amp_deleteSections:sections];
}


- (void)amp_moveSection:(NSInteger)section toSection:(NSInteger)newSection {
    [[self sizeCache] exchangeObjectAtIndex:section withObjectAtIndex:newSection];
    [self amp_moveSection:section toSection:newSection];
}


#pragma mark - item changes


- (void)amp_deleteItemsAtIndexPaths:(NSArray *)indexPaths {
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx,
        BOOL *stop) {
        NSMutableArray *section = [self sizeCache][obj.section];
        [section removeObjectAtIndex:obj.row];
    }];
    [self amp_deleteItemsAtIndexPaths:indexPaths];
}


- (void)amp_reloadItemsAtIndexPaths:(NSArray *)indexPaths {
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx,
        BOOL *stop) {
        if ([self.sizeCache count] > obj.section) {
            NSMutableArray *section = [self sizeCache][obj.section];
            section[obj.row] = AMPLayoutCellInvalidateValue;
        }
    }];
    [self amp_reloadItemsAtIndexPaths:indexPaths];
}


- (void)amp_moveItemAtIndexPath:(NSIndexPath *)indexPath
                    toIndexPath:(NSIndexPath *)newIndexPath {
    if ([self hasCacheAtIndexPath:indexPath] &&
        [self hasCacheAtIndexPath:newIndexPath]) {
        NSValue *indexPathSizeValue = [self sizeCacheAtIndexPath:indexPath];
        NSValue *newIndexPathSizeValue = [self sizeCacheAtIndexPath:newIndexPath];

        NSMutableArray *section1 = [self sizeCache][indexPath.section];
        NSMutableArray *section2 = [self sizeCache][newIndexPath.section];
        [section1 replaceObjectAtIndex:indexPath.row
                            withObject:newIndexPathSizeValue];
        [section2 replaceObjectAtIndex:newIndexPath.row
                            withObject:indexPathSizeValue];
    }
    [self amp_moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
}


- (void)amp_reloadData {
    [[self sizeCache] removeAllObjects];
    [self amp_reloadData];
}


#pragma mark - private methods


- (NSMutableDictionary *)templeCells {
    NSMutableDictionary *templeCells = objc_getAssociatedObject(self, _cmd);
    if (templeCells == nil) {
        templeCells = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, templeCells,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return templeCells;
}


- (id)templeCaculateCellWithIdentifier:(NSString *)identifier {
    NSMutableDictionary *templeCells = [self templeCells];
    id cell = [templeCells objectForKey:identifier];
    if (cell == nil) {
        NSDictionary *cellNibDict = [self valueForKey:@"_cellNibDict"];
        UINib *cellNIb = cellNibDict[identifier];
        cell = [[cellNIb instantiateWithOwner:nil options:nil] lastObject];
        templeCells[identifier] = cell;
    }

    return cell;
}


#pragma mark - cache methods


- (NSMutableArray *)sizeCache {
    NSMutableArray *cache = objc_getAssociatedObject(self, _cmd);
    if (cache == nil) {
        cache = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, cache, OBJC_ASSOCIATION_RETAIN);
    }
    return cache;
}


- (BOOL)hasCacheAtIndexPath:(NSIndexPath *)indexPath {
    BOOL hasCache = NO;
    NSMutableArray *cacheArray = [self sizeCache];
    if (cacheArray.count > indexPath.section) {
        if ([cacheArray[indexPath.section] count] > indexPath.row) {
            hasCache = YES;
        }
    } else {
        NSUInteger index = cacheArray.count;
        for (; index < indexPath.section + 1; index++) {
            [cacheArray addObject:@[].mutableCopy];
        }
    }

    return hasCache;
}


- (NSValue *)sizeCacheAtIndexPath:(NSIndexPath *)indexPath {
    NSValue *sizeValue = [self sizeCache][indexPath.section][indexPath.row];
    return sizeValue;
}

@end
