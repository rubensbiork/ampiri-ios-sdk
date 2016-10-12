//  AMPInfeedEditableTableViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 2/15/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPInfeedEditableTableViewController.h"


static NSString *const kAMPNativeLocationControlAdUnitId = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";

@interface AMPInfeedEditableTableViewController ()
@property (strong, nonatomic) AMPTableViewStreamAdapter *adapter;
@end

@implementation AMPInfeedEditableTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.editButton.hidden = NO;
}


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;

    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToTableView:self.tableView
                                          parentViewController:self
                                          adUnitId:kAMPNativeLocationControlAdUnitId
                                          templateType:AMPNativeAdsTemplateTypeInFeed
                                          templateCustomization:^(AMPTemplateCustomizationObject *templateCustomizationObject) {
                                              //example of editing ad representation via customizationObject
                                              templateCustomizationObject.ampCTABorderWidth = 1;
                                              templateCustomizationObject.ampCTACornerRadius = 5;
                                          }];
}
@end
