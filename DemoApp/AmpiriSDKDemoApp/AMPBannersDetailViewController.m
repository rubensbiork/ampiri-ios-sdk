//
//  AMPBannersDetailViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPBannersDetailViewController.h"

static NSString *const kAMPBannerAdUnitId = @"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69";
//only Facebook banner ad = @"26938bf3-3843-4160-9e1c-4a1f2df3611d"

@interface AMPBannersDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIButton *hideButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sizeSegmentedControl;

@property (weak, nonatomic) IBOutlet UISwitch *autoupdateSwitch;

@property (strong, nonatomic) AMPBannerView *bannerView;

@property (assign, nonatomic) CGSize bannerSize;

@end

@implementation AMPBannersDetailViewController

- (void)dealloc {
    [self.bannerView stop];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.hideButton.layer.masksToBounds =
            self.showButton.layer.masksToBounds = YES;

    self.hideButton.layer.cornerRadius = CGRectGetHeight(self.hideButton.frame) / 3;
    self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3;

    [self sizeClicked:self.sizeSegmentedControl];
}


- (IBAction)showClicked:(id)sender {
    [self.bannerView stop];
    [self.bannerView removeFromSuperview];
    self.bannerView = nil;

    self.bannerView =
            [[AmpiriSDK sharedSDK] loadBannerWithSize:self.bannerSize
                                             adUnitId:kAMPBannerAdUnitId
                                              success:nil
                                              failure:nil];

    [self.view addSubview:self.bannerView];

    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20.0f]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0
                                                           constant:self.bannerSize.width]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:self.bannerSize.height]];


    self.bannerView.autoUpdate = self.autoupdateSwitch.isOn;
}


- (IBAction)hideClicked:(id)sender {
    [self.bannerView stop];
    [self.bannerView removeFromSuperview];
    self.bannerView = nil;
}


- (IBAction)autoupdateSwitched:(UISwitch *)switcher {
    if (self.bannerView) {
        self.bannerView.autoUpdate = switcher.isOn;
    }
}


- (IBAction)sizeClicked:(UISegmentedControl *)sender {
    if (0 == sender.selectedSegmentIndex) {
        self.bannerSize = AMP_BANNER_SIZE_320x50;
    } else {
        self.bannerSize = AMP_BANNER_SIZE_728x90;
    }
}

@end
