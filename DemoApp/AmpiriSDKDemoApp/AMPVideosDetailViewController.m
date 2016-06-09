//
//  AMPVideosDetailViewController.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPVideosDetailViewController.h"


@interface AMPVideosDetailViewController ()

@property(weak, nonatomic) IBOutlet UIButton *loadButton;
@property(weak, nonatomic) IBOutlet UIButton *showButton;
@property(weak, nonatomic) IBOutlet UIButton *loadAndShowButton;

@property(strong, nonatomic) AMPVideoController *videoController;

@end

@implementation AMPVideosDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loadButton.layer.masksToBounds = YES;
    self.showButton.layer.masksToBounds = YES;
    self.loadAndShowButton.layer.masksToBounds = YES;

    self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3;
    self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3;
    self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3;
}


- (IBAction)loadClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadVideoWithIdentifier:@"00000000-0000-0000-0000-000000000006"
                                           success:^(AMPVideoController *videoController) {
                                               self.videoController = videoController;
                                           } failure:nil];
}


- (IBAction)showClicked:(id)sender {
    [self.videoController showFromViewController:self];
}


- (IBAction)loadAndShowClicked:(id)sender {
    [[AmpiriSDK sharedSDK] loadVideoWithIdentifier:@"00000000-0000-0000-0000-000000000006"
                                           success:^(AMPVideoController *videoController) {
                                               [videoController showFromViewController:self];
                                           } failure:nil];
}

@end
