## Initialization

Ampiri iOS SDK supports iOS 7.0 or higher.

You can add AmpiriSDK to your project using [Cocoapods](http://cocoapods.org) (recommeded) or manually.

## Adding through Cocoapods

1. If you don't have pods in your project, set them up using [Getting started guide](https://guides.cocoapods.org/using/getting-started.html)
2. If you want to use AmpiriSDK with all mediated ad networks add `pod 'ampiri-ios-sdk'` to your Podfile
3. If you want to use AmpiriSDK with server-side mediated networks only add `pod 'ampiri-ios-sdk/Core` to your Podfile
4. If you want to use some client-side network adapters, add them in your Podfile. Adapters will add their dependent libraries automatically.
	- `ampiri-ios-sdk/Adapters/FBAudienceAdapter` - adapter for [Facebook Audience](https://developers.facebook.com/docs/ios)
	- `ampiri-ios-sdk/Adapters/GoogleMobileAdsAdapter` - adapter for [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
	- `ampiri-ios-sdk/Adapters/MopubAdapter` - adapter for [MoPub](https://github.com/mopub/mopub-ios-sdk)
   	- `ampiri-ios-sdk/Adapters/ChartboostAdapter` - adapter for [Chartboost](http://cboo.st/ios_v6-3)
   	- `ampiri-ios-sdk/Adapters/NativeXAdapter` - adapter for [NativeX](https://github.com/nativex/NativeX-iOS-SDK)
   	- `ampiri-ios-sdk/Adapters/UnityAdsAdapter` - adapter for [Unity Ads(Applifier)](https://github.com/Applifier/unity-ads-sdk)
   	- `ampiri-ios-sdk/Adapters/VungleAdapter` - adapter for [Vungle](https://v.vungle.com/sdk)
   	- `ampiri-ios-sdk/Adapters/AdColonyAdapter` - adapter for [AdColony](https://github.com/AdColony/AdColony-iOS-SDK)

## Adding SDK manually

### **1.** Add SDK files to your project (required)

Add Ampiri.framework to your project.

### **2.** Add external libraries (recommended)

To show **standard** banner ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library 
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library

To show **interstitial** ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library
* [Chartboost](http://cboo.st/ios_v6-3) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) library

To show **video** ads from client-side mediated networks in your application you need to add:

* [AdColony](https://github.com/AdColony/AdColony-iOS-SDK) library
* [Unity Ads(Applifier)](https://github.com/Applifier/unity-ads-sdk) library 
* [Chartboost](http://cboo.st/ios_v6-3) library
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) library
* [Vungle](https://v.vungle.com/sdk) library

To show **native** ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library

**Warning: AmpiriSDK 3.0.0 was designed and verified to work correctly with following versions of 3rd party ad networks SDKs:**

* AdColony – 2.6.1
* Chartboost – 6.4.0
* Google Mobile Ads – 7.6.0
* NativeX – 5.5.2
* Unity Ads – 1.5.2
* Vungle – 3.2.0.1
* Facebook Audience – 4.10.1
* MoPub – 4.4.0

We do not guarantee stable and correct behavior of AmpiriSDK if you add manually another versions of ad networks SDKs

### **3.** Add SDK external adapters to your project
For each added external ad network from the section above you should add SDK adapter for this network from Adapters folder. Just add the necessary adapter to the project

* AdColony – libAMPAdColonyAdapter
* Chartboost – libAMPChartboostAdapter
* Google Mobile Ads – libAMPGoogleMobileAdsAdapter
* NativeX – libAMPNativeXAdapter
* Unity Ads – libAMPUnityAdsAdapter
* Vungle – libAMPVungleAdapter
* Facebook Audience – libAMPFBAudienceAdapter
* MoPub – libAMPMopubAdapter

### **4.** Setup external networks
You should setup each added external network on the Ampiri website, otherwise they will not be used for showing ads.

### **5.** Add `-ObjC` flag to project settings (Other Linker Flags property)

### **6.** Required system libraries
SDK with adapters uses the following system frameworks and libraries. You should add them to your project, if you add SDK manually (not through Cocaopods)

- `WebKit`
- `Security`
- `QuickLook`
- `MobileCoreServices`
- `CoreText`
- `AssetsLibrary`
- `Foundation`
- `CoreData`
- `Social`
- `MessageUI`
- `MediaPlayer`
- `EventKit`
- `EventKitUI`
- `QuartzCore`
- `CoreMedia`
- `CFNetwork`
- `SystemConfiguration`
- `CoreGraphics`
- `StoreKit`
- `CoreTelephony`
- `AVFoundation`
- `AdSupport`
- `AudioToolbox`
- `UIKit`
- `libz.1.2.5`
- `libxml2`
- `libsqlite3`
- `libz`

**Warning: Some Xcode versions support new settings after XCode reboot only, after cleaning XCode cache and others problem.**

TODO list if you have a linking problem:

- Clean Build
- Restart Xcode
- Delete your DerivedData folder in `~/Library/Developer/Xcode/DerivedData`
- Delete the contents (not the whole folder) of /var/folders
- Restart Computer

### **7.** ATS settings in iOS 9.0
Since AmpiriSDK uses 3rd party networks to load ads and we can't control that these networks load their content via https, you should disable ATS for your application for correct behavior of AmpiriSDK.
To disable ATS add to your application Info.plist file following settings:

```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

## Standard banners

ID of advertising space for testing (STANDARD): `"00000000-0000-0000-0000-000000000003"`
Available banner sizes:
- 320x50 (recommended)
- 728x90

Use the following methods in your UIViewController subclass:

```objective-c
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
identifier:(NSString *)identifier
success:(void (^)(AMPBannerView *banner))success
failure:(void (^)(AMPError *error))failure;
```
```
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
location:(CLLocation *)location
identifier:(NSString *)identifier
success:(void (^)(AMPBannerView *banner))success
failure:(void (^)(AMPError *error))failure;
```

For example:

```objective-c
#import "AmpiriSDK.h"

[self.bannerView stop];
self.bannerView = [[AmpiriSDK sharedSDK] loadBannerWithSize:AMP_BANNER_SIZE_320x50
identifier:@"00000000-0000-0000-0000-000000000003"
success:nil
failure:nil];


[self.view addSubview:self.bannerView];
```

Add following code to viewDidAppear and viewWillDisappear methods:

```objective-c
- (void)viewDidAppear:(BOOL)animated {
[super viewDidAppear:animated];
[self.bannerView resumeAutoUpdate];
}

- (void)viewWillDisappear:(BOOL)animated {
[super viewWillDisappear:animated];
[self.bannerView pauseAutoUpdate];
}
```

If you want to switch banner auto-update off:
self.bannerView.autoUpdate = NO;
If you want to stop and remove banner from screen:

```objective-c
[self.bannerView stop];
```


###Standard banner events handling

To process banner events, you should implement blocks or subscribe to Notifications:

| Method | Descriprtion  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|` (void (^)(AMPBannerView *banner))success `|    Called after the banner is served successfully. |
|` (void (^)(AMPError *error))failure `| Called if the banner was not downloaded.|
|` kAMPNotification_BannerClicked `| Called after a click on the banner. After this event the app will be minimized and an external browser is opened.|


## Interstitials

ID of advertising space for testing (FULLSCREEN): `"00000000-0000-0000-0000-000000000002"`
Banner size is defined automatically, depending on the screen size.
Use the following methods in your UIViewController subclass:

```objective-c
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
```

For fullscreen banners are available 3 options of presentation:

```objective-c
typedef NS_ENUM(NSInteger, AMPFullscreenLoadOptions)
{
AMPFullscreenLoadOptionsDefault = 0,
AMPFullscreenLoadOptionsShowAfterLoad,
AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};
```

Default option load banner and call success block if banner loaded. You can show banner from this block immediately.
`ShowAfterLoad` option load banner, show it immediately and call success block. From success block you can save it to yours UIViewController subclass property or do nothing.
`ShowAfterLoadWithDelay` option load banner, call success block and show it after delay which returns from the server. From success block you can save it to yours UIViewController subclass property, show immediately or do nothing.

**Note: if delay is not specified, interstitial will be shown immediately after load is finished.**


For example:

```objective-c
#import "Ampiri.h"

@weakify(self); // libextobjc lib

[[Ampiri sharedSDK] loadFullscreenWithIdentifier:@"00000000-0000-0000-0000-000000000002"
options:AMPFullscreenLoadOptionsDefault
forViewController:self
success:^(AMPFullscreenBannerController *fullscreenController) {
@strongify(self);// libextobjc lib
self.fullscreenController = fullscreenController;
} failure:nil];
```


### Interstitial events handling

To process interstitial events, you should implement blocks or subscribe to Notifications. Followings are available:

| Method | Descriprtion  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPFullscreenBannerController *fullscreenController))success `| Called after the fullscreen banner is served. After this method is called, the banner is ready for display.|
|`(void (^)(AMPError *error))failure `| Called if the fullscreen banner was not downloaded.|
|`kAMPNotification_FullscreenControllerClicked `|	Called after a click on the fullscreen banner. After this event the app will be minimized and an external browser is opened.|
|`kAMPNotification_FullscreenControllerDidHide	`| Called after the fullscreen banner disappears from the screen.|
|`kAMPNotification_FullscreenControllerDidShow `|	Called after the fullscreen banner is displayed.|
|`kAMPNotification_FullscreenControllerWillHide `| Called after the tap on the "close" button, directly before the fullscreen banner disappears.|
|`kAMPNotification_FullscreenControllerWillLoad `| Called before sending fullscreen banner request to server.|
|`kAMPNotification_FullscreenControllerWillShow `| Called before displaying the fullscreen banner.|



## Video Ads

ID of video ad space for testing (VIDEO): `"00000000-0000-0000-0000-000000000006"`

Use the following methods in your UIViewController subclass:

```objective-c
- (void)loadVideoWithIdentifier:(NSString *)identifier
success:(void (^)(AMPVideoController *videoController))success
failure:(void (^)(AMPError *error))failure;

- (void)loadVideoWithIdentifier:(NSString *)identifier
location:(CLLocation *)location
success:(void (^)(AMPVideoController *videoController))success
failure:(void (^)(AMPError *error))failure;
```

For example:

```objective-c
#import "Ampiri.h"

@weakify(self); // libextobjc lib

[[Ampiri sharedSDK] loadVideoWithIdentifier:@"00000000-0000-0000-0000-000000000006"
success:^(AMPVideoController *videoController) {
@strongify(self); // libextobjc lib
self.videoController = videoController;
} failure:nil];
```

### Video events handling

To process video ad events, you should implement blocks or subscribe to Notifications. Followings are available:

| Method | Descriprtion  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPVideoController *videoController))success `| Called after the video is served. After this method is called, the video ad is ready for display. |
|`(void (^)(AMPError *error))failure `| Called if the video ad was not downloaded. |
|`kAMPNotification_VideoControllerWillShow `| Called when video will show (will be shown). |
|`kAMPNotification_VideoControllerDidShow `| Called when video did show (is shown). |
|`kAMPNotification_VideoControllerWillHide `| Called when video will hide (will be closed). |
|`kAMPNotification_VideoControllerDidHide `| Called when video did hide (is closed). |
|`kAMPNotification_VideoControllerStarted `| Called when video is started. |
|`kAMPNotification_VideoControllerPause `| Called when video is paused (not implemented yet). |
|`kAMPNotification_VideoControllerResume `| Called when video is resumed (not implemented yet). |
|`kAMPNotification_VideoControllerCompleted `| Called when video show is completed. |
|`kAMPNotification_VideoControllerWillLoad `| Called before sending video request to server. |
|`kAMPNotification_VideoControllerClicked `| Called after a click on the video. After this event the app will be minimized and an external browser is opened. |



## Native ads

ID of advertising space for testing (Native ad): `"00000000-0000-0000-0000-000000000008"`

A Native ad is a raw representation of an ad without any pre-defined wrapping UI, which gives developers the freedom to design and control the ad. 
The layout for a Native ad is configured by developer with the help of Interface Builder (making .xib file) or manual creation of UI controls in code.
Use the following methods in your UIViewController subclass:

The following method performs async downloading of Native ad with all linked resources and renders ad data into binded UI controls after that.
 
```objective-c
- (void)loadNativeAdWithSize:(CGSize)size
identifier:(NSString *)identifier
classForRendering:(NSString *)className
success:(void (^)(UIView<AMPNativeViewInterface> *adNativeViewContainer))success
failure:(void (^)(NSError *error))failure;
```

There's a common algorithm to use a Native Ad:

1) Create your own subclass of `AMPNative` with any name (`MyNativeBannerView` for example)

2) Choose one of two ways:

   a) XIB way - Design the layout of `MyNativeBannerView` in a separate XIB file. Developer should bind the  desired UI controls in this XIB and properties from `<AMPNativeViewInterface>`, which `AMPNativeView` adopts. The implementation of `MyNativeBannerView` class haves to override `+ (NSString*)xibName` method, which returns the name of same XIB.   

   b) Coding way - The implementation of `MyNativeBannerView` class must be performed by the creation and placement  UI controls using `<AMPNativeViewInterface>`, which `AMPNativeView` adopts

3) Call loadNativeAdWithSize with required parameters, where the identifier is your private advertising space ID and className is the name of the `MyNativeBannerView` class. After downloading of ad data, SDK initiates an instance of `MyNativeBannerView` class created in step 2 . After that SDK renders native ad data in binded controls of this instance. Not all controls are filled this way, only main: `mtTitleTextLabel, mtMainTextLabel,  mtIconImageView, mtMainImageView`. When rendering is finished, the successful completion block with this instance will be invoked.

4) Render the others control such as `mtRatingView` on ad view container.  
**Note: property *nativeAd* of *MyNativeBannerView* class can be empty and you will not be able to get ad data for extra rendering**.

5) Show ad view container on the screen.


6) Register ad view container for the taps handling.

For example:

```objective-c
#import "Ampiri.h"

__weak typeof(self) weakSelf = self;
[[Ampiri sharedSDK] loadNativeAdWithSize:CGSizeZero identifier:@"00000000-0000-0000-0000-000000000008" classForRendering:NSStringFromClass([MyNativeBannerView class]) success:^(UIView<AMPNativeViewInterface> *adNativeViewContainer) {
UIView<AMPNativeViewInterface> *nativeView = adNativeViewContainer;
nativeView.frame = weakSelf.adContainerView.bounds;
[weakSelf.adContainerView addSubview:nativeView];
[nativeView registerViewControllerForInteraction:weakSelf];
} failure:^(NSError *error) {
}];
```


### SDK Version

```objective-c
#import "Ampiri.h"
NSString *version = [Ampiri version];
```


### Test mode (development mode)
During the development, it is highly recommended to set testMode to `YES` to avoid generating false impressions and clicks tracking. The default setting is `NO`.

```objective-c
#import "Ampiri.h"
[Ampiri setTestMode:YES];
```


### User data

For including user data to SDK, please set up the following properties:

```objective-c
// age can not be more than 100 and less than 1
+ (void)setAge:(NSUInteger)userAge;//save age in the current app life cycle only

+ (void)setAge:(NSUInteger)userAge saveInUserDefaults:(BOOL)shouldSave;

// this method set age too
+ (void)setBirthday:(NSDate *)birthday;//save birthday in the current app life cycle only
+ (void)setBirthday:(NSDate *)birthday saveInUserDefaults:(BOOL)shouldSave;

+ (void)setGender:(AMPUserGender)userGender;//save gender in the current app life cycle only
+ (void)setGender:(AMPUserGender)userGender saveInUserDefaults:(BOOL)shouldSave;

// array should contains strings only
+ (void)setInterests:(NSArray *)interests;//save interests in the current app life cycle only
+ (void)setInterests:(NSArray *)interests saveInUserDefaults:(BOOL)shouldSave;

+ (void)resetUserData;
```


For example:

```objective-c
#import "Ampiri.h"

//remove all user data from everywhere
[Ampiri recetUserData];

[Ampiri setGender:AMPUserGenderMale];
//Or if you want to save gender data in NSUserDefaults
//[Ampiri setGender:AMPUserGenderMale saveInUserDefaults:YES];


[Ampiri setAge:25];
//Or if you want to save age data in NSUserDefaults
//[Ampiri setAge:25 saveInUserDefaults:YES];

// this method set age too
[Ampiri setBirthday:[NSDate date]];
//Or if you want to save age data in NSUserDefaults
//[Ampiri setBirthday:[NSDate date] saveInUserDefaults:YES];

[Ampiri setInterests:@[@"Ampiri", @"coding", @"iOS", @"to be superman"]];
//Or if you want to save interests data in NSUserDefaults
//[Ampiri setInterests:@[@"Ampiri", @"coding", @"iOS", @"to be superman"] saveInUserDefaults:YES];
```