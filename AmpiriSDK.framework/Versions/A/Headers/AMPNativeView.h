//
//  AMPNativeView.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 1/5/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AMPNativeAd;

@protocol AMPNativeViewInterface <NSObject>
@required
@property(weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property(weak, nonatomic) IBOutlet UIImageView *ampMainImageView;
@property(weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet UIView *ampRatingView;
@property(strong, nonatomic, readonly) AMPNativeAd *nativeAd;
- (void)registerViewControllerForInteraction:(UIViewController *)vc;
@end

@interface AMPNativeView : UIView <AMPNativeViewInterface>

@property(weak, nonatomic) IBOutlet UILabel *ampMainTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampTitleTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *ampSubtitleTextLabel;
@property(weak, nonatomic) IBOutlet UIImageView *ampIconImageView;
@property(weak, nonatomic) IBOutlet UIImageView *ampMainImageView;
@property(weak, nonatomic) IBOutlet UILabel *ampCallToActionTextLabel;
@property(weak, nonatomic) IBOutlet UIView *ampPrivacyInfoContainerView;
@property(weak, nonatomic) IBOutlet UIView *ampRatingView;
@property(strong, nonatomic, readonly) AMPNativeAd *nativeAd;

+ (NSString *)xibName;
@end
