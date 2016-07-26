//
//  AMPFullscreensDetailViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPFullscreensDetailViewController.h"

static NSString *const kAMPTestFullscreenAdUnitId = @"2cb34a73-0012-4264-9526-bde1fce2ba92";

//only Facebook interstitial ad = @"97596a22-b078-4f2f-bf56-26bc4f415bb2"
@interface AMPFullscreensDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIButton *loadAndShowButton;
@property (weak, nonatomic) IBOutlet UIButton *loadAndShowWithDelayButton;

@property (strong, nonatomic) AMPFullscreenBannerController *fullscreenController;

@end

@implementation AMPFullscreensDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loadButton.layer.masksToBounds =
            self.showButton.layer.masksToBounds =
                    self.loadAndShowButton.layer.masksToBounds =
                            self.loadAndShowWithDelayButton.layer.masksToBounds = YES;

    self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3;
    self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3;
    self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3;
    self.loadAndShowWithDelayButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowWithDelayButton.frame) / 3;
}


- (IBAction)loadClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadFullscreenWithAdUnitId:kAMPTestFullscreenAdUnitId
                           options:AMPFullscreenLoadOptionsDefault
                           forViewController:self
                           success:^(AMPFullscreenBannerController *fullscreenController) {
                               self.fullscreenController = fullscreenController;
                           } failure:nil];
}


- (IBAction)showClicked:(id)sender {
    [self.fullscreenController showFromViewController:self];
}


- (IBAction)loadAndShowClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadFullscreenWithAdUnitId:kAMPTestFullscreenAdUnitId
                           options:AMPFullscreenLoadOptionsShowAfterLoad
                           forViewController:self
                           success:nil
                           failure:nil];
}


- (IBAction)loadAndShowWithDelayClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadFullscreenWithAdUnitId:kAMPTestFullscreenAdUnitId
                           options:AMPFullscreenLoadOptionsShowAfterLoadWithDelay
                           forViewController:self
                           success:nil
                           failure:nil];
}

@end
