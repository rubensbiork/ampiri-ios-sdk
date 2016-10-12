//
//  AMPContentStreamFlowLayoutCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPContentStreamFlowLayoutCollectionViewController.h"

static NSString *const kAMPNativeLocationControlAdUnitId = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";

@interface AMPContentStreamFlowLayoutCollectionViewController () <AMPCollectionViewStreamAdapterDelegate>
@property (strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@end


@implementation AMPContentStreamFlowLayoutCollectionViewController


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;

    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                          parentViewController:self
                                          adUnitId:kAMPNativeLocationControlAdUnitId
                                          templateType:AMPNativeAdsTemplateTypeContentStream
                                          delegate:self  // or "delegate:nil" if you would like to use our predefined ad cell height of AMPNativeAdsTemplateTypeContentStream ad template
                                          templateCustomization:nil];
}

#pragma mark - AMPCollectionViewStreamAdapterDelegate
// * Optional protocol
// If you create an AMPCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAMPCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(320, 320);
}

@end
