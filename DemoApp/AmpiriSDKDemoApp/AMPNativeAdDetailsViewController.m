//
//  AMPNativeAdDetailsViewController.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 14.12.15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPNativeAdDetailsViewController.h"
#import <AmpiriSDK/AmpiriSDK.h>
#import "NativeBannerView.h"
#import "NativePlusView.h"


static NSString *const kAMPNativeTestAdPlacementID = @"7f900c7d-7ce3-4190-8e93-310053e70ca2";
                         //only Facebook native ad = @"49676759-aec5-4c6e-928c-4f09cf86d3fd"

@interface AMPNativeAdDetailsViewController ()

@property(weak, nonatomic) IBOutlet UIButton *loadButton;
@property(weak, nonatomic) IBOutlet UIButton *showButton;
@property(weak, nonatomic) IBOutlet UIButton *loadAndShowButton;
@property(weak, nonatomic) IBOutlet UISegmentedControl *templateSwitch;

@property(weak, nonatomic) IBOutlet UIView *adContainerView;
@property(strong, nonatomic) UIView *nativeView;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerHeightConstraint;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *nativeContainerBottomConstraint;

@property(assign, nonatomic) CGFloat desiredHeight;

@end

@implementation AMPNativeAdDetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadButton.layer.masksToBounds = YES;
    self.showButton.layer.masksToBounds = YES;
    self.loadAndShowButton.layer.masksToBounds = YES;
    
    self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3;
    self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3;
    self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3;
    self.showButton.enabled = NO;
    
    self.templateSwitch.selectedSegmentIndex = 0;
    [self hideBannerWithAnimation:NO];
}


- (IBAction)loadClicked:(id)sender {
    self.showButton.enabled = NO;
    __weak typeof(self) weakSelf = self;
    NSString *className = [self templateClassName];
    Class adViewClass = NSClassFromString(className);
    if (adViewClass) {
        [self prepareHeight];
        
        [[AmpiriSDK sharedSDK] loadNativeAdWithIdentifier:kAMPNativeTestAdPlacementID
                                     parentViewController:self adViewClassForRendering:adViewClass
                                                  success:^(UIView *adNativeViewContainer) {
                                                      [weakSelf.nativeView removeFromSuperview];
                                                      
                                                      weakSelf.nativeView = adNativeViewContainer;
                                                      weakSelf.showButton.userInteractionEnabled = YES;
                                                      weakSelf.showButton.enabled = YES;
                                                  } failure:nil];
    } else {
        NSLog(@"Native Ad: invalid view class");
    }
}


- (IBAction)showClicked:(id)sender {
    [self renderAd];
}


- (IBAction)loadAndShowClicked:(id)sender {
    self.showButton.enabled = NO;
    __weak typeof(self) weakSelf = self;
    NSString *className = [self templateClassName];
    Class adViewClass = NSClassFromString(className);
    if (adViewClass) {
        [self prepareHeight];
        
        [[AmpiriSDK sharedSDK] loadNativeAdWithIdentifier:kAMPNativeTestAdPlacementID
                                     parentViewController:self adViewClassForRendering:adViewClass
                                                  success:^(UIView *adNativeViewContainer) {
                                                      [weakSelf.nativeView removeFromSuperview];
                                                      
                                                      weakSelf.nativeView = adNativeViewContainer;
                                                      [weakSelf renderAd];
                                                  } failure:nil];
    } else {
        NSLog(@"Native Ad: invalid view class");
    }
}

#pragma mark - Private

- (NSString *)templateClassName {
    NSString *className;
    switch (self.templateSwitch.selectedSegmentIndex) {
        case 0:
            className = NSStringFromClass([NativeBannerView class]);
            break;

        case 1:
            className = NSStringFromClass([NativePlusView class]);
            break;

        default:
            break;
    }
    return className;
}


- (void)prepareHeight {
    CGFloat height = 0;
    switch (self.templateSwitch.selectedSegmentIndex) {
        case 0:
            height = [NativeBannerView desiredHeight];
            break;

        case 1:
            height = [NativePlusView desiredHeight];
            break;

        default:
            break;
    }
    self.desiredHeight = height;
}


- (void)renderAd {
    if (![self.nativeView superview]) {
        self.nativeContainerHeightConstraint.constant = self.desiredHeight;
        [self.adContainerView layoutIfNeeded];
        
        self.nativeView.frame = self.adContainerView.bounds;
        self.nativeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.adContainerView addSubview:self.nativeView];
        [self showBannerWithAnimation:YES];
    }
}


- (void)hideBannerWithAnimation:(BOOL)animated {
    self.nativeContainerBottomConstraint.constant = -self.nativeContainerHeightConstraint.constant;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.adContainerView layoutIfNeeded];
        }];
    } else {
        [self.adContainerView layoutIfNeeded];
    }
}


- (void)showBannerWithAnimation:(BOOL)animated {
    self.nativeContainerBottomConstraint.constant = 0;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.adContainerView layoutIfNeeded];
        }];
    } else {
        [self.adContainerView layoutIfNeeded];
    }
}

@end
