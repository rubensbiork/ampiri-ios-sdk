Table of contents
=================

* [Initialization](#initialization)
* [Adding through Cocoapods](#adding-through-cocoapods)
* [Adding SDK manually](#adding-sdk-manually)
* [Standard banners](#standard-banners)
* [Interstitials](#interstitials)
* [Video Ads](#video-ads)
* [Native ads](#native-ads)
* [Location Control](#location-control)
* [Other](#other)


Initialization
==============

Ampiri iOS SDK supports iOS 8.0 or higher.

You can add AmpiriSDK to your project using [Cocoapods](http://cocoapods.org) (recommended) or manually.

Adding through Cocoapods
========================

1. If you don't have pods in your project, set them up using the [Getting Started guide](https://guides.cocoapods.org/using/getting-started.html)
2. If you want to use the Ampiri SDK with all mediated ad networks, add `pod 'ampiri-ios-sdk'` to your Podfile
3. If you want to use the Ampiri SDK with server-side mediated networks, only add `pod 'ampiri-ios-sdk/Core` to your Podfile
4. If you want to use some client-side network adapters, add them in your Podfile. Adapters will add their dependent libraries automatically.

- `ampiri-ios-sdk/Adapters/FBAudienceAdapter` - adapter for [Facebook Audience](https://developers.facebook.com/docs/ios)
- `ampiri-ios-sdk/Adapters/GoogleMobileAdsAdapter` - adapter for [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
- `ampiri-ios-sdk/Adapters/MopubAdapter` - adapter for [MoPub](https://github.com/mopub/mopub-ios-sdk)
- `ampiri-ios-sdk/Adapters/ChartboostAdapter` - adapter for [Chartboost](http://cboo.st/ios_v6-3)
- `ampiri-ios-sdk/Adapters/NativeXAdapter` - adapter for [NativeX](https://github.com/nativex/NativeX-iOS-SDK)
- `ampiri-ios-sdk/Adapters/UnityAdsAdapter` - adapter for [Unity Ads](https://github.com/Applifier/unity-ads-sdk)
- `ampiri-ios-sdk/Adapters/VungleAdapter` - adapter for [Vungle](https://v.vungle.com/sdk)
- `ampiri-ios-sdk/Adapters/AdColonyAdapter` - adapter for [AdColony](https://github.com/AdColony/AdColony-iOS-SDK)
- `ampiri-ios-sdk/Adapters/AppLovinAdapter` - adapter for [AppLovin](https://www.applovin.com/)

**Note**: The Baidu ad network must be added to your project manually and is not included in the Cocoapods distribution.


Adding SDK manually
===================

### **1.** Add SDK files to your project (required)

Add the `AmpiriSDK.framework` and `AMPVastLib.framework` files to your project.

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
* [AppLovin](https://www.applovin.com/) library

To show **video** ads from client-side mediated networks in your application you need to add:

* [AdColony](https://github.com/AdColony/AdColony-iOS-SDK) library
* [Unity Ads](https://github.com/Applifier/unity-ads-sdk) library 
* [Chartboost](http://cboo.st/ios_v6-3) library
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) library
* [Vungle](https://v.vungle.com/sdk) library

To show **native** ads from client-side mediated networks in your application you need to add:

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) library
* [Facebook Audience](https://developers.facebook.com/docs/ios) library
* [MoPub](https://github.com/mopub/mopub-ios-sdk) library
* [AppLovin](https://www.applovin.com/) library
* [Baidu](http://mssp.baidu.com/home/developer.html) library

**Note: You cannot use Baidu and MoPub both in one app as this results in a compile error**

**Warning: Ampiri SDK 3.3.4 was designed and verified to work correctly with the following versions of 3rd party ad network SDKs:**

* AdColony – 2.6.2
* Chartboost – 6.5.1
* Google Mobile Ads – 7.12.1
* NativeX – 5.5.7.1
* Unity Ads – 1.5.6
* Vungle – 3.2.2
* Facebook Audience – 4.16.0
* MoPub – 4.9.1
* AppLovin – 3.1
* Baidu - 4.3.1

We do not guarantee stable and correct behavior of the Ampiri SDK if you manually add other versions of ad network SDKs.

### **3.** Add SDK external adapters to your project
For each added external ad network from the section above you should add the SDK adapter for this network from the Adapters folder. Just add the necessary adapter to the project.

* AdColony – libAMPAdColonyAdapter
* Chartboost – libAMPChartboostAdapter
* Google Mobile Ads – libAMPGoogleMobileAdsAdapter
* NativeX – libAMPNativeXAdapter
* Unity Ads – libAMPUnityAdsAdapter
* Vungle – libAMPVungleAdapter
* Facebook Audience – libAMPFBAudienceAdapter
* MoPub – libAMPMopubAdapter
* AppLovin – libAMPAppLovinAdapter
* Baidu - libAMPBaiduAdapter


### **4.** Set up external networks
You should set up each added external network on the Ampiri website, otherwise they will not be used for showing ads.

### **5.** Add `-ObjC` flag to project settings (Other Linker Flags property)

### **6.** Required system libraries
The SDK with adapters uses the following system frameworks and libraries. You can set flag "Link Frameworks automatically" to `YES` otherwise you should add following system frameworks and libraries to your project manually:

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
- `libxml2`
- `libsqlite3`
- `libz`

**Warning: Some Xcode versions support new settings only after the Xcode reboot. This also cleans the Xcode cache and remedies other problems.**

TO DO list if you have a linking problem:

- Clean Build
- Restart Xcode
- Delete your DerivedData folder in `~/Library/Developer/Xcode/DerivedData`
- Restart the computer

ATS settings in iOS 9.0 and greater
===================================
Since the Ampiri SDK uses 3rd party networks to load ads and we have no control over these networks loading their content via https, you should disable ATS for your application to ensure the Ampiri SDK behaves a intended. To disable ATS add the following settings to your application Info.plist file:

```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

Standard banners
================

ID of advertising space for testing (STANDARD): `"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"`
Available banner sizes:

- 320x50 (recommended)
- 728x90

Use the following methods in your UIViewController subclass:

```objective-c
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
	adUnitId:(NSString *)adUnitId
	success:(void (^)(AMPBannerView *banner))success
	failure:(void (^)(AMPError *error))failure;
```

For example:

*objective-c*

```objective-c
[self.bannerView stop];
self.bannerView = [[AmpiriSDK sharedSDK] loadBannerWithSize:AMP_BANNER_SIZE_320x50
	adUnitId:@"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"
	success:nil
	failure:nil];
[self.view addSubview:self.bannerView];
```
*swift*

```swift
if bannerView != nil {
    bannerView?.stop()
    bannerView?.removeFromSuperview()
    bannerView = nil
}

bannerView = AmpiriSDK.shared().loadBanner(with: self.bannerSize!, 
	adUnitId: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69", success: nil, failure: nil)
```

Add the following code to `viewDidAppear` and `viewWillDisappear` methods:

*objective-c*

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

*swift*

```swift
override func viewDidAppear(animated: Bool) {
    bannerView?.resumeAutoUpdate()
}


override func viewDidDisappear(animated: Bool) {
    bannerView?.pauseAutoUpdate()
}
```

If you want to switch banner auto-update off:

```objective-c
self.bannerView.autoUpdate = NO;
```

If you want to stop and remove banner from screen:

```objective-c
[self.bannerView stop];
```

### Standard banner events handling

To process banner events, you should implement blocks or subscribe to notifications:

| Method | Description  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|` (void (^)(AMPBannerView *banner))success `|    Called after the banner is served successfully. |
|` (void (^)(AMPError *error))failure `| Called if the banner was not downloaded.|
|` kAMPNotification_BannerClicked `| Called after a click on the banner. After this event the app will be minimized and an external browser is opened.|


Interstitials
=============

ID of advertising space for testing (FULLSCREEN): `"2cb34a73-0012-4264-9526-bde1fce2ba92"`
Banner size is defined automatically, depending on the screen size.
Use the following methods in your UIViewController subclass:

```objective-c
- (void)loadFullscreenWithAdUnitId:(NSString *)adUnitId
	options:(AMPFullscreenLoadOptions)options
	forViewController:(UIViewController *)viewController
	success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
	failure:(void (^)(AMPError *error))failure;
```

For full screen banners, 3 presentation options are available:

```objective-c
typedef NS_ENUM(NSInteger, AMPFullscreenLoadOptions)
{
	AMPFullscreenLoadOptionsDefault = 0,
	AMPFullscreenLoadOptionsShowAfterLoad,
	AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};
```

The default option is to load the banner and call the success block if the banner loaded. You can show the banner from this block immediately. The `ShowAfterLoad` option loads the banner, shows it immediately, and calls the success block. From the success block you can save it to your UIViewController subclass property or do nothing. The `ShowAfterLoadWithDelay` option loads the banner, calls the success block and shows it after a delay, which returns from the server. From the success block you can save it to your UIViewController subclass property, show it immediately or do nothing.

**Note: If delay is not specified, the interstitial will be shown immediately after the load is finished.**


For example:

*objective-c*

```objective-c
[[AmpiriSDK sharedSDK] loadFullscreenWithAdUnitId:@"2cb34a73-0012-4264-9526-bde1fce2ba92"
	options:AMPFullscreenLoadOptionsDefault
	forViewController:self
	success:^(AMPFullscreenBannerController *fullscreenController) {} failure:nil];
```

*swift*

```swift
AmpiriSDK.shared().loadFullscreen(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92", 
	options: .showAfterLoad, for: self, success: nil, failure: nil)
```
### Interstitial events handling

To process interstitial events, you should implement blocks or subscribe to notifications. The following is available:

| Method | Description  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPFullscreenBannerController` `*fullscreenController))success `| Called after the full screen banner is served. After this method is called, the banner is ready for display.|
|`(void (^)(AMPError *error))failure `| Called if the full screen banner was not downloaded.|
|`kAMPNotification_FullscreenControllerClicked `|	Called after a click on the full screen banner. After this event the app will be minimized and an external browser is opened.|
|`kAMPNotification_FullscreenControllerDidHide	`| Called after the full screen banner disappears from the screen.|
|`kAMPNotification_FullscreenControllerDidShow `|	Called after the full screen banner is displayed.|
|`kAMPNotification_FullscreenControllerWillHide `| Called after the tap on the "close" button, directly before the full screen banner disappears.|
|`kAMPNotification_FullscreenControllerWillLoad `| Called before sending fullscreen banner request to server.|
|`kAMPNotification_FullscreenControllerWillShow `| Called before displaying the full screen banner.|



Video Ads
=========

ID of video ad space for testing (VIDEO): `"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"`

Use the following methods in your UIViewController subclass:

```objective-c
- (void)loadVideoWithAdUnitId:(NSString *)adUnitId
	success:(void (^)(AMPVideoController *videoController))success
	failure:(void (^)(AMPError *error))failure;
```

For example:

*objective-c*

```objective-c
[[AmpiriSDK sharedSDK] loadVideoWithAdUnitId:@"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"
	success:^(AMPVideoController *videoController) {} failure:nil];
```

*swift*

```swift
AmpiriSDK.shared().loadVideo(withAdUnitId: "87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
    videoViewController in
    videoViewController?.show(from: self)
}, failure: nil)
```
### Video events handling

To process video ad events, you should implement blocks or subscribe to notifications. The following is available:

| Method | Description  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPVideoController` `	*videoController))success `| Called after the video is served. After this method is called, the video ad is ready for display. |
|`(void (^)(AMPError *error))failure `| Called if the video ad was not downloaded. |
|`kAMPNotification_VideoControllerWillShow `| Called when the video will show (will be shown). |
|`kAMPNotification_VideoControllerDidShow `| Called when the video did show (is shown). |
|`kAMPNotification_VideoControllerWillHide `| Called when the video will hide (will be closed). |
|`kAMPNotification_VideoControllerDidHide `| Called when the video is hidden (is closed). |
|`kAMPNotification_VideoControllerStarted `| Called when the video is started. |
|`kAMPNotification_VideoControllerPause `| Called when the video is paused (not implemented yet). |
|`kAMPNotification_VideoControllerResume `| Called when the video is resumed (not implemented yet). |
|`kAMPNotification_VideoControllerCompleted `| Called when the video show is completed. |
|`kAMPNotification_VideoControllerWillLoad `| Called before sending the video request to server. |
|`kAMPNotification_VideoControllerClicked `| Called after a click on the video. After this event the app will be minimized and an external browser is opened. |



Native ads
==========

ID of advertising space for testing (Native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

A native ad is a raw representation of an ad without any pre-defined wrapping UI, which gives developers the freedom to design and control the ad. 
The layout for a native ad is configured by developers with the help of the Interface Builder (creating .xib file) or manual creation of UI controls in code.
Use the following methods in your UIViewController subclass:

```objective-c
- (void)loadNativeAdWithAdUnitId:(NSString *)adUnitId
	parentViewController:(UIViewController *)viewController
	adViewClassForRendering:(Class)adViewClass
	success:(void (^)(UIView *adNativeViewContainer))success
	failure:(void (^)(AMPError *error))failure;
```

The following method performs async downloading of native ads with all linked resources and renders ad data into bound UI controls after that.

There is a common algorithm to use when implementing a native ad:

1. Create your own subclass of `AMPNative` with any name (`MyNativeBannerView` for example)
2. Choose one of two options:
	* XIB option - Design the layout of `MyNativeBannerView` in a separate XIB file. The developer should bind the  desired UI controls in this XIB and properties from `<AMPNativeViewInterface>`, which `AMPNativeView` adopts. The implementation of `MyNativeBannerView` class has to override `+ (NSString *)xibName` method, which returns the name of same XIB.   
	* Coding option - The implementation of `MyNativeBannerView` class must be performed by the creation and placement of UI controls using `<AMPNativeViewInterface>`, which `AMPNativeView` adopts.
3. Call loadNativeAdWithSize with the required parameters, where the `adUnitId` is your private advertising space ID and className is the name of the `MyNativeBannerView` class. After downloading the ad data, SDK initiates an instance of `MyNativeBannerView` class created in step 2 . After that the SDK renders native ad data in bound controls of this instance. Not all controls are filled this way, only the main ones: `ampTitleTextLabel, ampMainTextLabel,  ampIconImageView, ampMainMediaView`. When rendering is finished, the successful completion block with this instance will be invoked.
4. Render the other controls, like `ampRatingView`, in ad view container.  
**Note: The property *nativeAd* of *MyNativeBannerView* class can be empty and you will not be able to get ad data for extra rendering**.
5. Show ad view container on the screen.
6. Register ad view container for the taps handling.

For example:

*objective-c*

```objective-c
__weak typeof(self) weakSelf = self;
[[AmpiriSDK sharedSDK] loadNativeAdWithAdUnitId:@"7f900c7d-7ce3-4190-8e93-310053e70ca2" 
	parentViewController:self
	classForRendering:NSStringFromClass([MyNativeBannerView class])
	success:^(UIView *adNativeViewContainer) {
		UIView *nativeView = adNativeViewContainer;
		nativeView.frame = weakSelf.adContainerView.bounds;
		[weakSelf.adContainerView addSubview:nativeView];
		[nativeView registerViewControllerForInteraction:weakSelf];
	} failure:^(NSError *error) {
}];
```
*swift*

```swift
AmpiriSDK.shared().loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController: self, adViewClassForRendering: classForRendering, success: {
    view in
    nativeView = view
}, failure: nil)
```

Location Control
================

ID of advertising space for testing (like for native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

Location control is a smart technology to add native ads as items in your feeds based on *UITableView* or *UICollectionView*. Settings for location control are returned from the server side and you can change it as you wish. 

For the easiest integration you could use our customizable templates: *in-Feed* and *Content Stream* based on `AMPNativeAdsTemplateType` enum:

```objective-c
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
	parentViewController:(UIViewController *)viewController
	adUnitId:(NSString *)adUnitId
	templateType:(AMPNativeAdsTemplateType)templateType
	templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;

- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
	parentViewController:(UIViewController *)viewController
	adUnitId:(NSString *)adUnitId
	templateType:(AMPNativeAdsTemplateType)templateType
	templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;                                       
```
List of customizations: 

| Property of the AMPTemplateCustomizationObject | Description  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`ampBackgroundColor `| Color of the ad cells |
|`ampTitleFont `| Font of the title label in the ad cells |
|`ampTitleColor `| Text color of the title label in the ad cells |
|`ampDescriptionTextFont `| Font of the description label in the ad cells |
|`ampDescriptionTextColor `| Text color of the description label in the ad cells |
|`ampDescriptionTextLeftOffset `| Left offset for the description label in the ad cells|
|`ampDescriptionTextRightOffset `| Right offset for the description label in the ad cells|
|`ampCoverImageLeftOffset `| Left offset for the ad main image view|
|`ampCoverImageRightOffset `| Right offset for the ad main image view|
|`ampCoverImageTopOffset `| Top offset for the ad main image view|
|`ampCoverImageBottomOffset `| Bottom offset for the ad main image view|
|`ampCoverImageCornerRadius `| Corner radius of the ad main image layer|
|`ampCTAFont `| Call to action label font |
|`ampCTAColor `| Call to action view background color|
|`ampCTATextColor `| Call to action label text color|
|`ampCTABorderColor `| Call to action layer border color|
|`ampCTACornerRadius `| Call to action layer corner radius |
|`ampCTABorderWidth `| Call to action layer border width|
|`ampCTARightOffset `| Right offset for ad call to action view|
|`ampCTABottomOffset `| Bottom offset for ad call to action view|
|`ampSponsoredFont `| Sponsored label font|
|`ampSponsoredColor `| Sponsored label text color|
|`ampIconLeftOffset `| Left offset for ad app icon view|
|`ampIconTopOffset `| Top offset for ad app icon view|
|`ampIconHeight `| Height for ad app icon view|
|`ampIconWidth `| Width for ad app icon view|
|`ampIconCornerRadius `| Corner radius of ad app icon layer|
|`ampIconContentMode `| Content mode of ad app icon view|

If you want to use your own representation of a native ad, use these methods:

```objective-c
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
	parentViewController:(UIViewController *)viewController
	adUnitId:(NSString *)adUnitId
	adViewClassForRendering:(Class)adViewClass;

- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
	parentViewController:(UIViewController *)viewController
	adUnitId:(NSString *)adUnitId
	useDefaultGridMode:(BOOL)gridMode
	delegate:(id<AMPCollectionViewStreamAdapterDelegate>)delegate
	adViewClassForRendering:(Class)adViewClass;                                      
```

These methods work the same way as [Native Ads](#native-ads). You have to use the instructions of this type of ad to set `adViewClass` field in methods, but you need to implement `AMPCollectionViewStreamAdapterDelegate` protocol or set `estimatedItemSize` property of your `UICollectionViewFlowLayout`.

For `UITableView` you have to do nothing in `UITableViewDelegate` and `UITableViewDataSource` methods to add ads in your feed, native ads will be added automatically.

For `UICollectionView` you have to write some code in `UICollectionViewDelegate` and `UICollectionViewDataSource` methods to add ads in your feed if you use custom collection view layout only, for `UICollectionViewFlowLayout` native ads will be added automatically:

*objective-c*

```objective-c
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
	cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	if ([self.adapter shouldDisplayAdAtIndexPath:indexPath]) {
		YourAdContainerCollectionViewCell *cell = [collectionView
			dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YourAdContainerCollectionViewCell class])
				forIndexPath:indexPath];
		cell.layer.zPosition = 1000;
		return [self.adapter adRenderedAdCellAtIndexPath:indexPath inCell:cell];
		} else {
			//your feed cell
	}
}
```

*swift*

```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if (adapter?.shouldDisplayAd(at: indexPath) == true) {
        let cell: AMPAdContainerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AMPAdContainerCollectionViewCell", for: indexPath) as! AMPAdContainerCollectionViewCell

        cell.layer.zPosition = 100
        return (adapter?.adRenderedAdCell(at: indexPath, in: cell))!
    } else {
        //your feed cell
    }
}
```
**Note for custom collection view layout: if you want to know the original index path of a cell in your feed without ads use this method (it may be important to load data from your data array):**

```objective-c
- (NSIndexPath *)originalIndexPath:(NSIndexPath *)indexPath;
```

If you want to use methods of `UITableView` and `UICollectionView` which work with `NSIndexPath` please use `UITableView (AMPLocationControl)` and `UICollectionView (AMPLocationControl)` categories (declared in `AMPTableViewStreamAdapter.h` and `AMPCollectionViewStreamAdapter.h`). There categories contain methods with `amp_` prefix which return original indexPaths.

If you want to know when location control loaded ads, subscribe to the notification `kAMPNotification_LocationControlAdsDidLoad` in the `NSNotificationCenter`.

Other
=====


### Test mode (development mode)
During the development phase, it is highly recommended to set testMode to `YES` to avoid generating false impressions and clicks tracking. The default setting is `NO`.

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>
[AmpiriSDK setTestMode:YES];
```

### User data

To include user data in the SDK, please set up the following properties:

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
#import <AmpiriSDK/AmpiriSDK.h>

//remove all user data from everywhere
[AmpiriSDK resetUserData];

[AmpiriSDK setGender:AMPUserGenderMale];
[AmpiriSDK setAge:25];
[AmpiriSDK setBirthday:[NSDate date]];
[AmpiriSDK setInterests:@[@"running", @"shopping", @"fitness", @"sport"]];
```
