//
//  AmpiriSDK.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 06/08/15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMPBannerView.h"
#import "AMPFullscreenBannerController.h"
#import "AMPVideoController.h"
#import <CoreLocation/CoreLocation.h>

#import "AMPError.h"

#import "AMPNativeView.h"
#import "AMPNativeAd.h"


typedef NS_ENUM(NSInteger, AMPFullscreenLoadOptions) {
    AMPFullscreenLoadOptionsDefault = 0,
    AMPFullscreenLoadOptionsShowAfterLoad,
    AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};

typedef enum {
    AMPUserGenderMale,
    AMPUserGenderFemale,
    AMPUserGenderOther
} AMPUserGender;


@interface AmpiriSDK : NSObject

+ (instancetype)sharedSDK;

+ (NSString *)sdkVersion;

+ (void)setEnableLog:(BOOL)value;

+ (BOOL)enableLog;

+ (void)setTestMode:(BOOL)value;

+ (BOOL)testMode;

@end


@interface AmpiriSDK (AMPUserInfo)


+ (void)setBirthday:(NSDate *)birthday;

//save birthday in the current app life cycle only
+ (void)setBirthday:(NSDate *)birthday saveInUserDefaults:(BOOL)shouldSave;


+ (void)setGender:(AMPUserGender)userGender;

//save gender in the current app life cycle only
+ (void)setGender:(AMPUserGender)userGender saveInUserDefaults:(BOOL)shouldSave;

// array should contains strings only
+ (void)setInterests:(NSArray *)interests;

//save interests in the current app life cycle only
+ (void)setInterests:(NSArray *)interests saveInUserDefaults:(BOOL)shouldSave;

+ (void)resetUserData;

@end


@interface AmpiriSDK (AMPLoadingMethods)


- (void)loadNativeAdWithIdentifier:(NSString *)identifier
             classNameForRendering:(NSString *)className
                           success:(void (^)(UIView <AMPNativeViewInterface> *adNativeViewContainer))success
                           failure:(void (^)(AMPError *error))failure;

- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                           identifier:(NSString *)identifier
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;

- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                             location:(CLLocation *)location
                           identifier:(NSString *)identifier
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;


- (void)loadFullscreenWithIdentifier:(NSString *)identifier
                             options:(AMPFullscreenLoadOptions)options
                   forViewController:(UIViewController *)viewController
                             success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                             failure:(void (^)(AMPError *error))failure;


- (void)loadFullscreenWithIdentifier:(NSString *)identifier
                            location:(CLLocation *)location
                             options:(AMPFullscreenLoadOptions)options
                   forViewController:(UIViewController *)viewController
                             success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                             failure:(void (^)(AMPError *error))failure;


- (void)loadVideoWithIdentifier:(NSString *)identifier
                        success:(void (^)(AMPVideoController *videoController))success
                        failure:(void (^)(AMPError *error))failure;


- (void)loadVideoWithIdentifier:(NSString *)identifier
                       location:(CLLocation *)location
                        success:(void (^)(AMPVideoController *videoController))success
                        failure:(void (^)(AMPError *error))failure;

@end

//BANNERS
/*
Called after a click on the banner. After this event the app will be minimized and an external browser is opened.
 */
extern NSString *const kAMPNotification_BannerClicked;


//FULLSCREENS
/*
Called after a click on the fullscreen banner. After this event the app will be minimized and an external browser is opened.
 */
extern NSString *const kAMPNotification_FullscreenControllerClicked;
/*
Called after the fullscreen banner disappears from the screen.
 */
extern NSString *const kAMPNotification_FullscreenControllerDidHide;
/*
Called after the tap on the "close" button, directly before the fullscreen banner disappears.
 */
extern NSString *const kAMPNotification_FullscreenControllerWillHide;
/*
Called before sending fullscreen banner request to server.
 */
extern NSString *const kAMPNotification_FullscreenControllerWillLoad;
/*
Called before displaying the fullscreen banner.
 */
extern NSString *const kAMPNotification_FullscreenControllerWillShow;
/*
Called after the fullscreen banner is displayed.
 */
extern NSString *const kAMPNotification_FullscreenControllerDidShow;


//VIDEOS
/*
Called when video did hide (is closed).
 */
extern NSString *const kAMPNotification_VideoControllerDidHide;
/*
Called when video will hide (will be closed).
 */
extern NSString *const kAMPNotification_VideoControllerWillHide;
/*
Called before sending video request to server.
 */
extern NSString *const kAMPNotification_VideoControllerWillLoad;
/*
Called when video will show (will be shown).
 */
extern NSString *const kAMPNotification_VideoControllerWillShow;
/*
Called when video did show (is shown).
 */
extern NSString *const kAMPNotification_VideoControllerDidShow;
/*
Called when video is started.
 */
extern NSString *const kAMPNotification_VideoControllerStarted;
/*
Called when video is paused (not implemented yet).
 */
extern NSString *const kAMPNotification_VideoControllerPause;
/*
Called when video is resumed (not implemented yet).
 */
extern NSString *const kAMPNotification_VideoControllerResume;
/*
Called when video show is completed.
 */
extern NSString *const kAMPNotification_VideoControllerCompleted;
/*
Called after a click on the video. After this event the app will be minimized and an external browser is opened
 */
extern NSString *const kAMPNotification_VideoControllerClicked;
