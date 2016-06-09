//
//  AMPFullscreensDetailViewController.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPFullscreensDetailViewController.h"


@interface AMPFullscreensDetailViewController ()

@property(weak, nonatomic) IBOutlet UIButton *loadButton;
@property(weak, nonatomic) IBOutlet UIButton *showButton;
@property(weak, nonatomic) IBOutlet UIButton *loadAndShowButton;
@property(weak, nonatomic) IBOutlet UIButton *loadAndShowWithDelayButton;

@property(strong, nonatomic) AMPFullscreenBannerController *fullscreenController;

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
    [[AmpiriSDK sharedSDK] loadFullscreenWithIdentifier:@"00000000-0000-0000-0000-000000000002"
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
    [[AmpiriSDK sharedSDK] loadFullscreenWithIdentifier:@"00000000-0000-0000-0000-000000000002"
                                                options:AMPFullscreenLoadOptionsShowAfterLoad
                                      forViewController:self
                                                success:nil
                                                failure:nil];
}


- (IBAction)loadAndShowWithDelayClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadFullscreenWithIdentifier:@"00000000-0000-0000-0000-000000000002"
                                                options:AMPFullscreenLoadOptionsShowAfterLoadWithDelay
                                      forViewController:self
                                                success:nil
                                                failure:nil];
}

@end
