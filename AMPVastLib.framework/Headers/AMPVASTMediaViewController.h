//
//  AMPVASTMediaViewController.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 19/07/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AMPVASTMediaViewControllerDelegate;

@interface AMPVASTMediaViewController : UIViewController

@property (weak, nonatomic, readonly) id <AMPVASTMediaViewControllerDelegate> delegate;

+ (instancetype)mediaViewControllerWithVASTStringXML:(NSString *)vastStringXML
                delegate:(id <AMPVASTMediaViewControllerDelegate>)delegate;


+ (instancetype)mediaViewControllerWithVideoURL:(NSURL *)videoURL
                htmlString:(NSString *)htmlString
                delegate:(id <AMPVASTMediaViewControllerDelegate>)delegate;

- (void)presentModalyFromViewController:(UIViewController *)viewController;

@property (assign, nonatomic) BOOL shouldShowExitButton;                //default is NO
@property (assign, nonatomic) BOOL shouldShowTimeline;                  //default is YES

@property (strong, nonatomic) UIImage *exitButtonImage;
@property (strong, nonatomic) UIColor *timeLineMinimumTrackTintColor;   //default is [UIColor orangeColor]
@property (strong, nonatomic) UIColor *timeLineMaximumTrackTintColor;   //default is [UIColor blackColor]

@end


@protocol AMPVASTMediaViewControllerDelegate <NSObject>

@optional

- (void)mediaViewControllerIsReadyForPresentation:(AMPVASTMediaViewController *)mediaViewController;

- (void)mediaViewControllerVideoDidStart:(AMPVASTMediaViewController *)mediaViewController;

- (void)mediaViewControllerVideoDidFinish:(AMPVASTMediaViewController *)mediaViewController;

- (void)mediaViewControllerCompanionAdDidShow:(AMPVASTMediaViewController *)mediaViewController;

- (void)mediaViewControllerUserHasToBeRedirectedFrom:(AMPVASTMediaViewController *)mediaViewController withUrl:(NSURL *)url;

- (void)mediaViewController:(AMPVASTMediaViewController *)mediaViewController didFailWithError:(AMPVASTError *)error;

- (void)mediaViewController:(AMPVASTMediaViewController *)mediaViewController trackedEvent:(NSString *)name;

@end
