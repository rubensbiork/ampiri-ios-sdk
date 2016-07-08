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
#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"


static NSString *const kAMPNativeInFeedTestAdPlacementID = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";
                               //only Facebook native ad = @"49676759-aec5-4c6e-928c-4f09cf86d3fd"

static NSInteger const kAMPSectionsCount = 3;

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
    self.tableView.tableFooterView = [UIView new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(adsDidLoad)
                                                 name:kAMPNotification_LocationControlAdsDidLoad
                                               object:nil];

    [self loadData];
}

- (void)adsDidLoad {
    NSLog(@"Ads for the Location control did load!");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.adapter cancelAdsLoading];
}

#pragma  mark - Actions
- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;
    
    if (self.templateSwitch.selectedSegmentIndex == self.templateSwitch.numberOfSegments - 1) {
        self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToTableView:self.tableView
                                                       parentViewController:self
                                                                 identifier:kAMPNativeInFeedTestAdPlacementID
                                                    adViewClassForRendering:[NativeBannerView class]];
    } else {
        self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToTableView:self.tableView
                                                       parentViewController:self
                                                                 identifier:kAMPNativeInFeedTestAdPlacementID
                                                               templateType:self.templateSwitch.selectedSegmentIndex
                                                      templateCustomization:^(AMPTemplateCustomizationObject *templateCustomizationObject) {
                                                          templateCustomizationObject.ampCTABorderWidth = 1;
                                                          templateCustomizationObject.ampCTACornerRadius = 5;
                                                      }];
    }
}

- (IBAction)editModeClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.tableView.editing = sender.selected;
}


#pragma mark - UITableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
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
    return [self.dataSource[section] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMPLocationControlTableViewCell *adCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AMPLocationControlTableViewCell class])];
    
    AMPDataUnit *item = self.dataSource[indexPath.section][indexPath.row];
    
    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        adCell.tweetImageView.image = nil;
        [adCell.tweetImageWidthConstrint setConstant:0];
        [adCell.tweetImageHeigthConstrint setConstant:20];
    } else {
        adCell.tweetImageView.image = item.photo;
        [adCell.tweetImageWidthConstrint setConstant:120];
        [adCell.tweetImageHeigthConstrint setConstant:120];
    }

    adCell.tweetTextLabel.text = item.specification;
    adCell.tweetDateLabel.text = item.pinUnit;
    
    [adCell layoutIfNeeded];
    
    return adCell;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *itemsGroupe = self.dataSource[indexPath.section];
        [itemsGroupe removeObjectAtIndex:indexPath.row];
        
        if ( self.adapter == nil ) {
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
        }
    }
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
    AMPDataUnit *unit = self.dataSource[sourceIndexPath.section][sourceIndexPath.row];
    [self.dataSource[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [self.dataSource[destinationIndexPath.section] insertObject:unit atIndex:destinationIndexPath.row];
}

#pragma mark - Data

- (void)loadData {
    NSArray *units = [AMPDataUnitManager createDataUnitList];
    [self organizeData:units bySection:kAMPSectionsCount];
}

- (void)organizeData:(NSArray*)dataArray bySection:(NSInteger)sectionsCount{
    self.dataSource = [NSMutableArray new];
    NSInteger itemsInSection = dataArray.count / sectionsCount;
    NSInteger startPos = 0;
    for (int i = 0; i < sectionsCount; i++) {
        NSArray *groupe = [dataArray subarrayWithRange:NSMakeRange(startPos, MIN(itemsInSection, dataArray.count - startPos))];
        startPos += groupe.count;
        NSMutableArray *itemsGroupe = [NSMutableArray arrayWithArray:groupe];
        [self.dataSource addObject:itemsGroupe];
    }
    
    if (startPos < dataArray.count) {
        NSMutableArray *itemsGroupe = [self.dataSource lastObject];
        [itemsGroupe arrayByAddingObjectsFromArray:[dataArray subarrayWithRange:NSMakeRange(startPos,dataArray.count - startPos)]];
    }
}

@end
