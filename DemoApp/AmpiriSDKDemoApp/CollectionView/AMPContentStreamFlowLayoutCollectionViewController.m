//
//  AMPContentStreamFlowLayoutCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPContentStreamFlowLayoutCollectionViewController.h"

static NSString *const kAMPNativeLocationControlAdUnitId = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";

@interface AMPContentStreamFlowLayoutCollectionViewController ()
@property (strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@end


@implementation AMPContentStreamFlowLayoutCollectionViewController


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;

    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:kAMPNativeLocationControlAdUnitId
                                                                templateType:AMPNativeAdsTemplateTypeContentStream
                                                       templateCustomization:nil];

}

@end
