//
//  AMPCollectionViewLocationControlAdDetailsViewController.m
//  AmpiriSDKTestApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPCollectionViewLocationControlAdDetailsViewController.h"
#import "AMPNativeAdDetailsViewController.h"
#import "NativeBannerView.h"
#import <AmpiriSDK/AmpiriSDK.h>
#import "AMPLocationControlCollectionViewCell.h"
#import "UICollectionView+AMPDynamicCell.h"
#import "AMPTweetsManager.h"
//----Custom layout support
#import "CollectionViewCircleLayout.h"
#import "AMPLocationControlCustomCollectionViewCell.h"
#import "AMPAdContainerCollectionViewCell.h"
//-----------

static NSString *const kAMPNativeInFeedTestAdPlacementID = @"00000000-0000-0000-0000-000000000008";

@interface AMPCollectionViewLocationControlAdDetailsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCircleLayoutTwoKindDelegate>
@property(weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(weak, nonatomic) IBOutlet UIButton *loadButton;
@property(weak, nonatomic) IBOutlet UISegmentedControl *templateSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *layoutModeSwitch;

@property (strong, nonatomic) UICollectionViewLayout *flowLayout;
@property (strong, nonatomic) UICollectionViewLayout *customLayout;

@property(strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@property(nonatomic, strong) NSMutableArray *dataSource;

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
    
    [[AMPTweetsManager sharedManager] loadNextSetOfTweets:^(NSArray *tweets, NSError *error) {
        [self.dataSource addObjectsFromArray:tweets];
        [self.collectionView reloadData];
    }];
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
    
    NSIndexPath *actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;
    AMPTweet *tweet = self.dataSource[actualPath.row];
    
    adCell.tweetNameLabel.text = tweet.author;
    if (!tweet.imageURL || ([[tweet.imageURL absoluteString] isEqual:@""])) {
        [adCell.tweetImageHeightConstraint setConstant:0];
        adCell.tweetImageView.image = nil;
    } else {
        [adCell.tweetImageView setImageWithURL:tweet.imageURL delegate:nil];
        [adCell.tweetImageHeightConstraint setConstant:(self.collectionView.frame.size.width - 4) / 2];
    }
    adCell.tweetDateLabel.text = tweet.date;
    adCell.tweetTextLabel.text = tweet.tweetMessage;
    
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
        CGSize size  = [collectionView amp_sizeForCellWithIdentifier:NSStringFromClass([AMPLocationControlCollectionViewCell class])
                                                           indexPath:indexPath
                                                          fixedWidth:(self.collectionView.frame.size.width - 4) / 2
                                                       configuration:^(AMPLocationControlCollectionViewCell *adCell) {
                                                           NSIndexPath *actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;
                                                           AMPTweet *tweet = self.dataSource[actualPath.row];
                                                           
                                                           adCell.tweetNameLabel.text = tweet.author;
                                                           if (!tweet.imageURL || ([[tweet.imageURL absoluteString]
                                                                                    isEqual:@""])) {
                                                               [adCell.tweetImageHeightConstraint setConstant:0];
                                                           } else {
                                                               [adCell.tweetImageHeightConstraint setConstant:(self.collectionView
                                                                                                               .frame
                                                                                                               .size
                                                                                                               .width - 4) / 2];
                                                           }
                                                           adCell.tweetDateLabel.text = tweet.date;
                                                           adCell.tweetTextLabel.text = tweet.tweetMessage;
                                                           
                                                           [adCell layoutIfNeeded];
                                                           
                                                       }];
        return size;
    } else {
        NSLog(@"Unexpected step. Size should be stored in CollectionViewCircleLayout.");
        return CGSizeZero;
    }
}

-(BOOL) collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma  mark - Actions


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;
    self.layoutModeSwitch.enabled = NO;
    
    
    BOOL shouldUseGridMode = [self isGridMode];
    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                                        parentViewController:self
                                                                  identifier:kAMPNativeInFeedTestAdPlacementID
                                                          useDefaultGridMode:shouldUseGridMode
                                                                templateType:self.templateSwitch.selectedSegmentIndex
                                                       templateCustomization:nil];
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
    return  self.adapter ? [self.adapter shouldDisplayAdAtIndexPath:indexPath] : NO;
}

@end
