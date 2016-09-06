//
//  AMPBaseFlowLayoutCollectionViewController.h
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPBaseFlowLayoutCollectionViewController.h"
#import "AMPLocationControlCollectionViewCell.h"
#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"


@interface AMPBaseFlowLayoutCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end


@implementation AMPBaseFlowLayoutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.dataSource = [NSMutableArray new];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AMPLocationControlCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([AMPLocationControlCollectionViewCell class])];
    [self loadData];
}


#pragma  mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    AMPLocationControlCollectionViewCell *adCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AMPLocationControlCollectionViewCell class]) forIndexPath:indexPath];
    AMPDataUnit *item = self.dataSource[indexPath.row];

    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        [adCell.tweetImageHeightConstraint setConstant:0];
        adCell.tweetImageView.image = nil;
    } else {
        [adCell.tweetImageHeightConstraint setConstant:(self.collectionView.frame.size.width - 4) / 2];
        adCell.tweetImageView.image = [UIImage imageNamed:item.photo];
    }
    adCell.tweetTextLabel.text = item.specification;

    [adCell layoutIfNeeded];
    return adCell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((NSInteger) ((self.collectionView.frame.size.width - 4) / 2), (NSInteger) ((self.collectionView.frame.size.width - 4) / 1.1f));
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
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
