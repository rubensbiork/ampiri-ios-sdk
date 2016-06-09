//
//  AMPNativeView.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 1/5/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AMPNativeAd;
@class AMPStarRatingView;

@protocol AMPNativeViewInterface <NSObject>

@required

@property(weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property(weak, nonatomic) IBOutlet UIImageView *ampMainImageView;
@property(weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet AMPStarRatingView *ampRatingStarView;
@property(strong, nonatomic, readonly) AMPNativeAd *nativeAd;

/**
 *  You should regster your custom ad to interaction for registration clicks and impressions
 *  @param viewController               - UIViewController where your ad is located
 */
- (void)registerViewControllerForInteraction:(UIViewController *)viewController;

//Deprecated
@property(weak, nonatomic) IBOutlet UIView *ampRatingView;

@end

@interface AMPNativeView : UIView <AMPNativeViewInterface>

@property(weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property(weak, nonatomic) IBOutlet UIImageView *ampMainImageView;
@property(weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet AMPStarRatingView *ampRatingStarView;
@property(strong, nonatomic, readonly) AMPNativeAd *nativeAd;

+ (NSString *)xibName;

//Deprecated
@property(weak, nonatomic) IBOutlet UIView *ampRatingView;

@end

@interface AMPStarRatingView : UIView

@property(assign, nonatomic) CGFloat ratingValue;

@end
