//
//  AMPBaseCustomLayoutCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPBaseCustomLayoutCollectionViewController.h"
#import "CollectionViewCircleLayout.h"
#import "AMPCustomTemplateCustomLayoutCollectionViewController.h"
#import "AMPLocationControlCustomCollectionViewCell.h"
#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"


@interface AMPBaseCustomLayoutCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CollectionViewCircleLayoutTwoKindDelegate>

@end


@implementation AMPBaseCustomLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AMPLocationControlCustomCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([AMPLocationControlCustomCollectionViewCell class])];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self applyCustomLayoutMode];
    self.dataSource = [NSMutableArray new];
    [self loadData];
}


#pragma  mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert(YES, @"should be called from derived class");
    return nil;
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


#pragma mark - Private


- (void)applyCustomLayoutMode {
    CollectionViewCircleLayout *customLayout = [CollectionViewCircleLayout new];
    customLayout.delegate = self;
    __weak typeof(self) weakSelf = self;
    [self.collectionView setCollectionViewLayout:customLayout animated:NO completion:^(BOOL finished) {
        [weakSelf.collectionView reloadData];
    }];
}


#pragma mark - @protocol CollectionViewCircleLayoutTwoKindDelegate implementation

- (BOOL)shouldUseDefaultAttributeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert(YES, @"should be called from derived class");
    return NO;
}

#pragma mark - Data

- (void)loadData {
    NSArray *units = [AMPDataUnitManager createDataUnitList:16];
    [self organizeData:units];
}

- (void)organizeData:(NSArray *)dataArray {
    self.dataSource = [NSMutableArray arrayWithArray:dataArray];
}

@end
