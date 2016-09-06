//
//  AMPCustomTemplateFlowLayoutCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa on 22/04/16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import "AMPCustomTemplateFlowLayoutCollectionViewController.h"
#import "NativeBannerView.h"

static NSString *const kAMPNativeLocationControlAdUnitId = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";

@interface AMPCustomTemplateFlowLayoutCollectionViewController () <AMPCollectionViewStreamAdapterDelegate>
@property (strong, nonatomic) AMPCollectionViewStreamAdapter *adapter;
@end


@implementation AMPCustomTemplateFlowLayoutCollectionViewController


- (IBAction)loadClicked:(id)sender {
    self.loadButton.enabled = NO;
    self.adapter = [[AmpiriSDK sharedSDK] addLocationControlToCollectionView:self.collectionView
                                                        parentViewController:self
                                                                    adUnitId:kAMPNativeLocationControlAdUnitId
                                                          useDefaultGridMode:YES
                                                                    delegate:self
                                                     adViewClassForRendering:[NativeBannerView class]];
}

#pragma marl - AMPCollectionViewStreamAdapterDelegate

- (CGSize)sizeForAdAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(320, [NativeBannerView desiredHeight]);
}


@end
