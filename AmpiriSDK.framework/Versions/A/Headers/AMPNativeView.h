//
//  AMPNativeView.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 1/5/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMPMediaContainerView.h"
#import "AMPAdResource.h"

@class AMPNativeAd;
@class AMPStarRatingView;

@protocol AMPNativeViewInterface <NSObject>

@required

@property (weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property (weak, nonatomic) IBOutlet AMPMediaContainerView *ampMainMediaView;
@property (weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property (weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property (weak, nonatomic) IBOutlet AMPStarRatingView *ampRatingStarView;
@property (strong, nonatomic, readonly) AMPNativeAd *nativeAd;
@property (assign, nonatomic, readonly) AMPAdResourceType requiredResources;

/**
 *  You should regster your custom ad to interaction for registration clicks and impressions
 *  @param viewController               - UIViewController where your ad is located
 */
- (void)registerViewControllerForInteraction:(UIViewController *)viewController;
@end

// SDK can propose to change the controls replacement if some ad data is absent
@protocol AMPNativeViewManagementInterface <NSObject>

@optional
/**
 *  Some Ad network adapters could invoke this method after verification of availability of main media data (cover image, video) and propose to rearrange the UI controls on native ad view for the best UI\UX
 *  @param shouldCollapse               - bool value indicates availability of main media data
 */
- (void)collapseMainMediaSpace:(BOOL)shouldCollapse;

/**
 *  Some Ad network adapters could invoke this method after verification of availability of icon data and propose to rearrange the UI controls on native ad view for the best UI\UX
 *  @param shouldCollapse               - bool value indicates availability of icon data
 */
- (void)collapseIconImageSpace:(BOOL)shouldCollapse;

@end


@interface AMPNativeView : UIView <AMPNativeViewInterface, AMPNativeViewManagementInterface>

@property (weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property (weak, nonatomic) IBOutlet AMPMediaContainerView *ampMainMediaView;;
@property (weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property (weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property (weak, nonatomic) IBOutlet AMPStarRatingView *ampRatingStarView;
@property (strong, nonatomic, readonly) AMPNativeAd *nativeAd;
@property (assign, nonatomic, readonly) AMPAdResourceType requiredResources;

+ (NSString *)xibName;

@end

@interface AMPStarRatingView : UIView

@property (assign, nonatomic) CGFloat ratingValue;

@end
