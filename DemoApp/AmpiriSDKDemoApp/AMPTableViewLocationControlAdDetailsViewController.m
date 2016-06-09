//  AMPTableViewLocationControlAdDetailsViewController.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPTableViewLocationControlAdDetailsViewController.h"
#import "AMPNativeAdDetailsViewController.h"
#import "NativeBannerView.h"
#import <AmpiriSDK/AmpiriSDK.h>
#import "AMPLocationControlTableViewCell.h"
#import "UITableViewCell+AMPAutoLayoutHeight.h"
#import "AMPTweetsManager.h"


static NSString *const kAMPNativeInFeedTestAdPlacementID = @"00000000-0000-0000-0000-000000000008";

@interface AMPTableViewLocationControlAdDetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak, nonatomic) IBOutlet UIButton *loadButton;
@property(weak, nonatomic) IBOutlet UISegmentedControl *templateSwitch;

@property(strong, nonatomic) AMPTableViewStreamAdapter *adapter;
@property(nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation AMPTableViewLocationControlAdDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadButton.layer.masksToBounds = YES;
    self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3;
    
    self.dataSource = [NSMutableArray new];
    
    [[AMPTweetsManager sharedManager] loadNextSetOfTweets:^(NSArray *tweets, NSError *error) {
        [self.dataSource addObjectsFromArray:tweets];
        [self.tableView reloadData];
    }];
    
    self.tableView.tableFooterView = [UIView new];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.adapter cancelAdsLoading];
}


#pragma  mark - Actions
- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;
    
    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToTableView:self.tableView
                                                   parentViewController:self
                                                             identifier:kAMPNativeInFeedTestAdPlacementID
                                                           templateType:self.templateSwitch.selectedSegmentIndex
                                                  templateCustomization:^(AMPTemplateCustomizationObject *templateCustomizationObject) {
                                                      templateCustomizationObject.ampCTABorderWidth = 1;
                                                      templateCustomizationObject.ampCTACornerRadius = 5;
                                                  }];
}

- (IBAction)editModeClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.tableView.editing = sender.selected;
}


#pragma mark - UITableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count] / [self numberOfSectionsInTableView:tableView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMPLocationControlTableViewCell *adCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AMPLocationControlTableViewCell class])];
    
    CGFloat height =  [adCell amp_heightWithWidth:adCell.frame.size.width
                               customizationBlock:^(AMPLocationControlTableViewCell *cell) {
                                   NSIndexPath *actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;
                                   AMPTweet *tweet = self.dataSource[actualPath.section * [self tableView:tableView
                                                                                    numberOfRowsInSection:actualPath.section] + actualPath
                                                                     .row];
                                   
                                   adCell.tweetNameLabel.text = tweet.author;
                                   if (!tweet.imageURL || ([[tweet.imageURL absoluteString] isEqual:@""])) {
                                       [adCell.tweetImageWidthConstrint setConstant:0];
                                       [adCell.tweetImageHeigthConstrint setConstant:0];
                                   } else {
                                       [adCell.tweetImageWidthConstrint setConstant:120];
                                       [adCell.tweetImageHeigthConstrint setConstant:120];
                                   }
                                   adCell.tweetDateLabel.text = tweet.date;
                                   adCell.tweetTextLabel.text = tweet.tweetMessage;
                                   
                                   [adCell layoutIfNeeded];
                                   
                               }];
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMPLocationControlTableViewCell *adCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AMPLocationControlTableViewCell class])];
    
    NSIndexPath *actualPath = [self.adapter originalIndexPath:indexPath] ?: indexPath;
    AMPTweet *tweet = self.dataSource[actualPath.section * [self tableView:tableView
                                                     numberOfRowsInSection:actualPath.section] + actualPath
                                      .row];
    
    
    adCell.tweetNameLabel.text = tweet.author;
    if (!tweet.imageURL || ([[tweet.imageURL absoluteString] isEqual:@""])) {
        adCell.tweetImageView.image = nil;
        [adCell.tweetImageWidthConstrint setConstant:0];
        [adCell.tweetImageHeigthConstrint setConstant:20];
    } else {
        [adCell.tweetImageView setImageWithURL:tweet.imageURL delegate:nil];
        [adCell.tweetImageWidthConstrint setConstant:120];
        [adCell.tweetImageHeigthConstrint setConstant:120];
    }
    adCell.tweetDateLabel.text = tweet.date;
    adCell.tweetTextLabel.text = tweet.tweetMessage;
    
    [adCell layoutIfNeeded];
    
    return adCell;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataSource removeObjectAtIndex:indexPath.row];
}

// Data manipulation - reorder / moving support

- (NSIndexPath *)              tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                     toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    return proposedDestinationIndexPath;
}


- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSNumber *n = [self.dataSource objectAtIndex:sourceIndexPath.row];
    [self.dataSource removeObjectAtIndex:sourceIndexPath.row];
    [self.dataSource insertObject:n atIndex:destinationIndexPath.row];
}

@end
