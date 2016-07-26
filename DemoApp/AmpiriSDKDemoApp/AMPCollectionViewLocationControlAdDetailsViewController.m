//
//  AMPCollectionViewLocationControlAdDetailsViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPCollectionViewLocationControlAdDetailsViewController.h"
#import "NativeBannerView.h"
#import "AMPLocationControlCollectionViewCell.h"
#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"
//----Custom layout support
#import "CollectionViewCircleLayout.h"
#import "AMPLocationControlCustomCollectionViewCell.h"
#import "AMPAdContainerCollectionViewCell.h"
//-----------

static NSString *const kAMPNativeLocationControlAdUnitId = @"00000000-0000-0000-0000-000000000008";

//only Facebook native ad = @"49676759-aec5-4c6e-928c-4f09cf86d3fd"
@interface AMPCollectionViewLocationControlAdDetailsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCircleLayoutTwoKindDelegate, AMPCollectionViewStreamAdapterDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *templateSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *layoutModeSwitch;

@property (strong, nonatomic) UICollectionViewLayout *flowLayout;
@property (strong, nonatomic) UICollectionViewLayout *customLayout;

@property (strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end


@implementation AMPCollectionViewLocationControlAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadButton.layer.masksToBounds = YES;
    self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3;
    self.layoutModeSwitch.on = YES;
    self.flowLayout = self.collectionView.collectionViewLayout;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.dataSource = [NSMutableArray new];
    
    [self loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(adsDidLoad)
                                          name:kAMPNotification_LocationControlAdsDidLoad
                                          object:nil];
}


- (void)adsDidLoad {
    NSLog(@"Ads for the Location control did load!");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma  mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isGridMode]) {
        //standard UICollectionViewFlowLayout, ad rendering will be from-the-box
        return [self standardCellForCollectionView:collectionView cellForItemAtIndexPath:indexPath withClass:[AMPLocationControlCollectionViewCell class]];
    } else {
        //custom CollectionViewCircleLayout, developer should manage standard cell and ad cell rendering
        if ([self.adapter shouldDisplayAdAtIndexPath:indexPath]) {
            return [self adCellForCollectionView:collectionView cellForItemAtIndexPath:indexPath];
        } else {
            return [self standardCellForCollectionView:collectionView cellForItemAtIndexPath:indexPath withClass:[AMPLocationControlCustomCollectionViewCell class]];
        }
    }
}

- (UICollectionViewCell *)standardCellForCollectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath
                          withClass:(Class)cellClass {
    
    AMPLocationControlCollectionViewCell *adCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass)
                                                                   forIndexPath:indexPath];
    
    NSIndexPath *actualPath = indexPath;
    if (![self isGridMode]) {
        actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;
    }

    AMPDataUnit *item = self.dataSource[actualPath.row];
    
    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        [adCell.tweetImageHeightConstraint setConstant:0];
        adCell.tweetImageView.image = nil;
    } else {
        [adCell.tweetImageHeightConstraint setConstant:(self.collectionView.frame.size.width - 4) / 2];
        adCell.tweetImageView.image = item.photo;
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

- (CGSize)collectionView:(UICollectionView *)collectionView
          layout:(UICollectionViewLayout *)collectionViewLayout
          sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isGridMode]) {
        return CGSizeMake((NSInteger) ((self.collectionView.frame.size.width - 4) / 2), (NSInteger) ((self.collectionView.frame.size.width - 4) / 1.1f));
    } else {
        NSLog(@"Unexpected step. Size should be stored in CollectionViewCircleLayout.");
        return CGSizeZero;
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma  mark - Actions


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;
    self.layoutModeSwitch.enabled = NO;
    
    
    BOOL shouldUseGridMode = [self isGridMode];
    if (self.templateSwitch.selectedSegmentIndex == self.templateSwitch.numberOfSegments - 1) {
        self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                              parentViewController:self
                                              adUnitId:kAMPNativeLocationControlAdUnitId
                                              useDefaultGridMode:shouldUseGridMode
                                              delegate:self
                                              adViewClassForRendering:[NativeBannerView class]];
    } else {
        self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                              parentViewController:self
                                              adUnitId:kAMPNativeLocationControlAdUnitId
                                              useDefaultGridMode:shouldUseGridMode
                                              templateType:self.templateSwitch.selectedSegmentIndex
                                              templateCustomization:nil];
    }

}


- (IBAction)didCustolLayoutSwitchValueChanged:(id)sender {
    if ([self isGridMode]) {
        [self applyFlowLayoutMode];
    } else {
        [self applyCustomLayoutMode];
    }
}

#pragma mark - Private


- (void)applyCustomLayoutMode {
    if (!self.customLayout) {
        CollectionViewCircleLayout *customLayout = [CollectionViewCircleLayout new];
        customLayout.delegate = self;
        self.customLayout = customLayout;
    }
    __weak typeof(self) weakSelf = self;
    [self.collectionView setCollectionViewLayout:self.customLayout animated:YES completion:^(BOOL finished) {
        [weakSelf.collectionView reloadData];
    }];
}

- (void)applyFlowLayoutMode {
    __weak typeof(self) weakSelf = self;
    [self.collectionView setCollectionViewLayout:self.flowLayout animated:YES completion:^(BOOL finished) {
        weakSelf.customLayout = nil;
        [weakSelf.collectionView reloadData];
    }];
}

- (BOOL)isGridMode {
    return self.layoutModeSwitch.isOn;
}

#pragma mark - @protocol CollectionViewCircleLayoutTwoKindDelegate implementation

- (BOOL)shouldUseDefaultAttributeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.adapter ? [self.adapter shouldDisplayAdAtIndexPath:indexPath] : NO;
}

#pragma mark - Data

- (void)loadData {
    NSArray *units = [AMPDataUnitManager createDataUnitList];
    [self organizeData:units];
}

- (void)organizeData:(NSArray *)dataArray {
    self.dataSource = [NSMutableArray arrayWithArray:dataArray];
}

#pragma marl - AMPCollectionViewStreamAdapterDelegate

- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(320, [NativeBannerView desiredHeight]);
}

@end
