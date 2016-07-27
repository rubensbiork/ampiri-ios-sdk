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
#import "AMPAdTypes.h"

#import "AMPNativeView.h"
#import "AMPNativeAd.h"

#import "AMPTableViewStreamAdapter.h"
#import "AMPCollectionViewStreamAdapter.h"
#import "AMPTemplateCustomizationObject.h"
#import "AMPInfeedNativeAd.h"
#import "AMPStatistics.h"
#import "AMPStreamAdapter.h"
#import "AMPMediaContainerView.h"

@interface AmpiriSDK : NSObject

/**
 * Provides access to the AmpiriSDK shared object.
 *
 * @return a singleton AmpiriSDK instance.
 */
+ (instancetype)sharedSDK;

/**
 * Provides access to the AmpiriSDK version
 *
 * @return AmpiriSDK Version
 */
+ (NSString *)sdkVersion;

/**
 *  Enables debug logging for the AmpiriSDK, outputting additional information to console
 *
 *  @param value - "YES" to enable, "NO" to disable
 */
+ (void)setLogEnabled:(BOOL)value;

/**
 * Provides access to the AmpiriSDK logging permission
 *
 * @return permission from logging
 */
+ (BOOL)logEnabled;

+ (void)setTestMode:(BOOL)value;

+ (BOOL)testMode;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param value - "YES" to enable, "NO" to disable
 */
+ (void)setStatisticsEnabled:(BOOL)value;

/**
 * Provides access to the AmpiriSDK statistic sending permission
 *
 * @return permission from logging
 */
+ (BOOL)statisticsEnabled;

@end


@interface AmpiriSDK (AMPUserInfo)

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param birthday - the app user birthday
 */
+ (void)setBirthday:(NSDate *)birthday;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param birthday     - the app user birthday
 *  @param shouldSave   - should save user birthday to user defaults
 */
+ (void)setBirthday:(NSDate *)birthday saveInUserDefaults:(BOOL)shouldSave;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param userGender - the app user gender
 */
+ (void)setGender:(AMPUserGender)userGender;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param userGender     - the app user gender
 *  @param shouldSave     - should save user gender to user defaults
 */
+ (void)setGender:(AMPUserGender)userGender saveInUserDefaults:(BOOL)shouldSave;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param interests - the app user interests
 */
+ (void)setInterests:(NSArray *)interests;

/**
 *  Enables sent statistics from the AmpiriSDK
 *
 *  @param interests    - the app user interests
 *  @param shouldSave   - should save user interests to user defaults
 */
+ (void)setInterests:(NSArray *)interests saveInUserDefaults:(BOOL)shouldSave;

/**
 *  Reset user data in user defaults
 */
+ (void)resetUserData;

@end


@interface AmpiriSDK (AMPLocationControl)
/**
 *  Add location control for native ads to your UITableView
 *  @param tableView                - UITableView which should content native ads
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adUnitId                 - your ad unit id
 *  @param templateType             - type of native ads representation template
 *  @param templateCustomization    - (optional) customization for ads representation template
 *
 *  @return AMPTableViewStreamAdapter object which add native ads to your UITableView and return original indexPaths
 */
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
                                        parentViewController:(UIViewController *)viewController
                                                    adUnitId:(NSString *)adUnitId
                                                templateType:(AMPNativeAdsTemplateType)templateType
                                       templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;
/**
 *  Add location control for native ads to your UITableView
 *  @param tableView                - UITableView which should content native ads
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adUnitId                 - your ad unit id
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *
 *  @return AMPTableViewStreamAdapter object which add native ads to your UITableView and return original indexPaths
 */
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
                                        parentViewController:(UIViewController *)viewController
                                                    adUnitId:(NSString *)adUnitId
                                     adViewClassForRendering:(Class)adViewClass;



/**
 *  Add location control for native ads to your UICollectionView
 *  @param collectionView           - UICollectionView which should content native ads
 *  @param viewController           - UIViewController which delegate collectionView
 *  @param adUnitId                 - your ad unit id
 *  @param gridMode                 - set "YES" if you use UICollectionViewFlowLayout, set "NO" if you use you own custom UICollectionViewLayout
 *  @param templateType             - type of native ads representation template
 *  @param templateCustomization    - (optional) customization for ads representation template
 *
 *  @return AMPCollectionViewStreamAdapter object which add native ads to your UICollectionView and return original indexPaths
 */
- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
                                                  parentViewController:(UIViewController *)viewController
                                                              adUnitId:(NSString *)adUnitId
                                                    useDefaultGridMode:(BOOL)gridMode
                                                          templateType:(AMPNativeAdsTemplateType)templateType
                                                 templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;

/**
 *  Add location control for native ads to your UICollectionView
 *  @param collectionView           - UICollectionView which should content native ads
 *  @param viewController           - UIViewController which delegate collectionView
 *  @param adUnitId                 - your ad unit id
 *  @param gridMode                 - set "YES" if you use UICollectionViewFlowLayout, set "NO" if you use you own custom UICollectionViewLayout
 *  @param delegate                 - delegate of AMPCollectionViewStreamAdapter
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *
 *  @return AMPCollectionViewStreamAdapter object which add native ads to your UICollectionView and return original indexPaths
 */
- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
                                                  parentViewController:(UIViewController *)viewController
                                                              adUnitId:(NSString *)adUnitId
                                                    useDefaultGridMode:(BOOL)gridMode
                                                              delegate:(id <AMPCollectionViewStreamAdapterDelegate>)delegate
                                               adViewClassForRendering:(Class)adViewClass;


@end


@interface AmpiriSDK (AMPNative)

/**
 *  Load and render native ad by your own representation template
 *  @param adUnitId                 - your ad unit id
 *  @param viewController           - UIViewController which delegate tableView
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *  @param success                  - called when native ad successfully downloaded and rendered, returns rendered UIView
 *  @param failure                  - (optional) called when native ad download fails, returns AMPError
 */
- (void)loadNativeAdWithAdUnitId:(NSString *)adUnitId
            parentViewController:(UIViewController *)viewController
         adViewClassForRendering:(Class)adViewClass
                         success:(void (^)(UIView *adNativeViewContainer))success
                         failure:(void (^)(AMPError *error))failure;


@end


@interface AmpiriSDK (AMPBanners)

/**
 *  Load banner ads
 *  @param size                     - size of banner, you should choose between two sizes: AMP_BANNER_SIZE_320x50 and AMP_BANNER_SIZE_728x90
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - (optional) called when banner successfully downloaded, returns downloaded banner
 *  @param failure                  - (optional) called when banner download fails, returns AMPError
 *
 *  @return AMPBannerView object which you should add to your banner place on screen
 */
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                             adUnitId:(NSString *)adUnitId
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;

/**
 *  Load banner ads
 *  @param size                     - size of banner, you should choose between two sizes: AMP_BANNER_SIZE_320x50 and AMP_BANNER_SIZE_728x90
 *  @param location                 - (optional) location of user for more targeted ads
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - (optional) called when banner successfully downloaded, returns downloaded banner
 *  @param failure                  - (optional) called when banner download fails, returns AMPError
 *
 *  @return AMPBannerView object which you should add to your banner place on screen
 */
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                             location:(CLLocation *)location
                             adUnitId:(NSString *)adUnitId
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;

@end


@interface AmpiriSDK (AMPFullscreens)


/**
 *  Load interstitial ads
 *  @param adUnitId                 - your ad unit id
 *  @param options                  - option of banner presentation time, you could choose between only load option (AMPFullscreenLoadOptionsDefault),
 show after load (AMPFullscreenLoadOptionsShowAfterLoad) and show after load with delay which declare at the server side (AMPFullscreenLoadOptionsShowAfterLoadWithDelay)
 *  @param viewController           - UIViewController for modal presentation of interstitial ad
 *  @param success                  - (optional) called when interstitial successfully downloaded, returns downloaded interstitial
 *  @param failure                  - (optional) called when interstitial download fails, returns AMPError
 */
- (void)loadFullscreenWithAdUnitId:(NSString *)adUnitId
                           options:(AMPFullscreenLoadOptions)options
                 forViewController:(UIViewController *)viewController
                           success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                           failure:(void (^)(AMPError *error))failure;

/**
 *  Load interstitial ads
 *  @param adUnitId                 - your ad unit id
 *  @param location                 - (optional) location of user for more targeted ads
 *  @param options                  - option of banner presentation time, you could choose between only load option (AMPFullscreenLoadOptionsDefault),
 show after load option (AMPFullscreenLoadOptionsShowAfterLoad) and show after load with delay which declare at the server side option (AMPFullscreenLoadOptionsShowAfterLoadWithDelay)
 *  @param viewController           - UIViewController for modal presentation of interstitial ad
 *  @param success                  - (optional) called when interstitial successfully downloaded, returns downloaded interstitial
 *  @param failure                  - (optional) called when interstitial download fails, returns AMPError
 */
- (void)loadFullscreenWithAdUnitId:(NSString *)adUnitId
                          location:(CLLocation *)location
                           options:(AMPFullscreenLoadOptions)options
                 forViewController:(UIViewController *)viewController
                           success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                           failure:(void (^)(AMPError *error))failure;

@end


@interface AmpiriSDK (AMPVideos)

/**
 *  Load video ads
 *  @param adUnitId                 - your ad unit id
 *  @param success                  - called when video successfully downloaded, returns downloaded video controller which could be presented modally
 *  @param failure                  - (optional) called when video download fails, returns AMPError
 */
- (void)loadVideoWithAdUnitId:(NSString *)adUnitId
                      success:(void (^)(AMPVideoController *videoController))success
                      failure:(void (^)(AMPError *error))failure;

/**
 *  Load video ads
 *  @param adUnitId                 - your ad unit id
 *  @param location                 - (optional) location of user for more targeted ads
 *  @param success                  - called when video successfully downloaded, returns downloaded video controller which could be presented modally
 *  @param failure                  - (optional) called when video download fails, returns AMPError
 */
- (void)loadVideoWithAdUnitId:(NSString *)adUnitId
                     location:(CLLocation *)location
                      success:(void (^)(AMPVideoController *videoController))success
                      failure:(void (^)(AMPError *error))failure;

@end


//Location control
/*
 Called after ads for location control have been loaded. After this event you can reload your UITableView/UICollectionView or could wait - ads will be added automatically during scrolling.
 */
extern NSString *const kAMPNotification_LocationControlAdsDidLoad;

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
