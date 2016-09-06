//
//  AMPCustomTemplateCustomLayoutCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPCustomTemplateCustomLayoutCollectionViewController.h"
#import "CollectionViewCircleLayout.h"
#import "AMPLocationControlCustomCollectionViewCell.h"
#import "AMPAdContainerCollectionViewCell.h"
#import "NativeBannerView.h"
#import "AMPDataUnit.h"

static NSString *const kAMPNativeLocationControlAdUnitId = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";

@interface AMPCustomTemplateCustomLayoutCollectionViewController () <CollectionViewCircleLayoutTwoKindDelegate, AMPCollectionViewStreamAdapterDelegate>
@property (strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@end


@implementation AMPCustomTemplateCustomLayoutCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AMPAdContainerCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([AMPAdContainerCollectionViewCell class])];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //custom CollectionViewCircleLayout, developer should manage standard cell and ad cell rendering
    if ([self.adapter shouldDisplayAdAtIndexPath:indexPath]) {
        return [self adCellForCollectionView:collectionView cellForItemAtIndexPath:indexPath];
    } else {
        return [self standardCellForCollectionView:collectionView cellForItemAtIndexPath:indexPath withClass:[AMPLocationControlCustomCollectionViewCell class]];
    }
}

- (UICollectionViewCell *)standardCellForCollectionView:(UICollectionView *)collectionView
                                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                              withClass:(Class)cellClass {

    AMPLocationControlCustomCollectionViewCell *adCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass)
                                                                                                   forIndexPath:indexPath];

    NSIndexPath *actualPath = indexPath;
    actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;

    AMPDataUnit *item = self.dataSource[actualPath.row];

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


- (UICollectionViewCell *)adCellForCollectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AMPAdContainerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AMPAdContainerCollectionViewCell class])
                                                                                       forIndexPath:indexPath];
    cell.layer.zPosition = 1000;
    return [self.adapter adRenderedAdCellAtIndexPath:indexPath inCell:cell];
}


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;

    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:kAMPNativeLocationControlAdUnitId
                                                          useDefaultGridMode:NO
                                                                    delegate:self
                                                     adViewClassForRendering:[NativeBannerView class]];
}


#pragma mark - @protocol CollectionViewCircleLayoutTwoKindDelegate implementation

- (BOOL)shouldUseDefaultAttributeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.adapter ? [self.adapter shouldDisplayAdAtIndexPath:indexPath] : NO;
}


#pragma mark - AMPCollectionViewStreamAdapterDelegate

- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(320, [NativeBannerView desiredHeight]);
}

@end
