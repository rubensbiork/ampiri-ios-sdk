目录
=================

* [初始化](#initialization)
* [通过Cocoapods添加](#adding-through-cocoapods)
* [手动添加 SDK](#adding-sdk-manually)
* [标准横幅广告](#standard-banners)
* [插播广告](#interstitials)
* [视频广告](#video-ads)
* [原生广告](#native-ads)
* [位置控制](#location-control)
* [其它](#other)

初始化
==============

Ampiri iOS SDK 支持 iOS 8.0 或更高版。

你可以使用[Cocoapods](http://cocoapods.org) （推荐）或手动向你的项目添加AmpiriSDK。

通过Cocoapods添加
========================

1.  如果你的项目中没有pods，使用[开始指南]进行设置(https://guides.cocoapods.org/using/getting-started.html)
2.  如果你希望通过所有调制广告网络使用Ampiri SDK，则向你的Podfile添加`pod 'ampiri-ios-sdk'`
3.  如果你希望通过服务器端调制网络使用Ampiri SDK，只能向你的Podfile添加`pod 'ampiri-ios-sdk/Core`
4.   如果希望使用一些客户端一侧的网络适配器，在你的Podfile中添加它们。适配器将自动添加它们的关联库。
- `ampiri-ios-sdk/Adapters/FBAudienceAdapter` -  [Facebook Audience]适配器(https://developers.facebook.com/docs/ios)
- `ampiri-ios-sdk/Adapters/GoogleMobileAdsAdapter` - 用于[Google Mobile Ads SDK]的适配器(https://developers.google.com/admob/ios/download)
- `ampiri-ios-sdk/Adapters/MopubAdapter` - 用于 [MoPub] 的适配器(https://github.com/mopub/mopub-ios-sdk)
- `ampiri-ios-sdk/Adapters/ChartboostAdapter` - 用于 [Chartboost] 的适配器(http://cboo.st/ios_v6-3)
- `ampiri-ios-sdk/Adapters/NativeXAdapter` - 用于 [NativeX] 的适配器(https://github.com/nativex/NativeX-iOS-SDK)
- `ampiri-ios-sdk/Adapters/UnityAdsAdapter` - 用于 [Unity Ads] 的适配器(https://github.com/Applifier/unity-ads-sdk)
- `ampiri-ios-sdk/Adapters/VungleAdapter` - 用于 [Vungle] 的适配器(https://v.vungle.com/sdk)
- `ampiri-ios-sdk/Adapters/AdColonyAdapter` - 用于 [AdColony] 的适配器(https://github.com/AdColony/AdColony-iOS-SDK)
- `ampiri-ios-sdk/Adapters/AppLovinAdapter` - 用于 [AppLovin] 的适配器(https://www.applovin.com/)
- `ampiri-ios-sdk/Adapters/BaiduAdapter` - 用于 [Baidu] 的适配器(http://mssp.baidu.com/home/developer.html)

**注释: 不能在一个应用程序中使用百度和MoPub因为这会导致编译错误**

手动添加SDK
===================

### **1.**对你的项目添加SDK（要求） 

对你的项目添加 `AmpiriSDK.framework` and `AMPVastLib.framework`

### **2.** 添加外部库（推荐）

为了在你的应用程序中从客户端一侧调制网络上显示**standard**横幅广告，你需要添加：

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) 库 
* [MoPub](https://github.com/mopub/mopub-ios-sdk) 库
* [Facebook Audience](https://developers.facebook.com/docs/ios) 库

为了在你的应用程序中从客户端一侧调制网络上显示**interstitial**广告，你需要添加：

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) 库
* [Chartboost](http://cboo.st/ios_v6-3) 库
* [Facebook Audience](https://developers.facebook.com/docs/ios) 库
* [MoPub](https://github.com/mopub/mopub-ios-sdk) 库
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) 库
* [AppLovin](https://www.applovin.com/)库

为了在你的应用程序中从客户端一侧调制网络上显示**video**广告，你需要添加： 

* [AdColony](https://github.com/AdColony/AdColony-iOS-SDK) 库
* [Unity Ads](https://github.com/Applifier/unity-ads-sdk) 库
* [Chartboost](http://cboo.st/ios_v6-3) 库
* [NativeX](https://github.com/nativex/NativeX-iOS-SDK) 库
* [Vungle](https://v.vungle.com/sdk) 库

为了在你的应用程序中从客户端一侧调制网络上显示** native **广告，你需要添加：

* [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download) 库
* [Facebook Audience](https://developers.facebook.com/docs/ios) 库
* [MoPub](https://github.com/mopub/mopub-ios-sdk) 库
* [AppLovin](https://www.applovin.com/) 库
* [Baidu](http://mssp.baidu.com/home/developer.html) 库

**警告： Ampiri SDK 3.2.2可以与以下版本的第三方广告网络SDK一起正常运行:**

* AdColony – 2.6.2
* Chartboost – 6.4.6
* Google Mobile Ads – 7.9.0
* NativeX – 5.5.6.3
* Unity Ads – 1.5.6
* Vungle – 3.2.0.1
* Facebook Audience – 4.14.0
* MoPub – 4.7.0
* AppLovin – 3.1
* Baidu - 4.3.1

如果你手动添加其它版本的广告网络SDK，我们不能保证Ampiri SDK功能的稳定和正确。

### **3.**向你的项目添加SDK外部适配器
对于从上一段添加的每一个外部广告网络，你应当从Adapters文件夹对该网络添加SDK适配器。仅对项目添加必要的适配器。
* AdColony – libAMPAdColonyAdapter
* Chartboost – libAMPChartboostAdapter		
* Google Mobile Ads – libAMPGoogleMobileAdsAdapter
* NativeX – libAMPNativeXAdapter
* Unity Ads – libAMPUnityAdsAdapter	
* Vungle – libAMPVungleAdapter
* Facebook Audience – libAMPFBAudienceAdapter
* MoPub – libAMPMopubAdapter
* AppLovin – libAMPAppLovinAdapter
* Baidu - libAMPBaidu Adapter

### **4.**设置外部网络
你应当在Ampiri网站设置每一个添加的外部网络，否则它们不能用于显示广告。

### **5.** 添加 `-ObjC`标志用于项目设置 (其它 Linker Flags 特性)

### **6.** 要求的系统库
具有适配器的SDK使用以下系统框架和库。你可以设置标志“Link Frameworks automatically”到“YES”否则你需要手动添加以下系统框架和库到你的项目。

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
- 
**.警告：某些Xcode版本仅在Xcode重新引导、清除Xcode缓存和其它问题之后支持新的设置**

如果你遇到连接问题，你需要检查：

- 清除 Build
- 重启 Xcode
- 删除你放在`~/Library/Developer/Xcode/DerivedData`中的DerivedData文件夹
- 重启计算机

iOS 9.0 以上中的ATS设置
======================
由于Ampiri SDK使用第3方网络加载广告，我们不能控制这些网络通过https加载它们自己的内容，你可以对你的程序禁用ATS，以确保Ampiri SDK的行为正确。为了禁用ATS，应对你的程序Info.plistfile添加以下设置：

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

标准横幅广告
================

用于测试的广告空间的ID (STANDARD): `"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"`
可用的横幅广告尺寸
- 320x50 （推荐）
- 728x90

在你的UIViewController子类中使用以下方法：

```objective-c
- (AMPBannerView *)loadBannerWithSize:(CGSize)size 
    identifier:(NSString *)identifier	
    adUnitId:(NSString *)adUnitId
    success:(void (^)(AMPBannerView *banner))
    failure:(void (^)(AMPError *error))failure;	
```

例如：

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
if self.bannerView != nil {
    self.bannerView?.stop()
    self.bannerView?.removeFromSuperview()
    self.bannerView = nil
}

self.bannerView = AmpiriSDK.sharedSDK().loadBannerWithSize(self.bannerSize!, 
	adUnitId: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69", success: nil, failure: nil)
	self.view.addSubview(self.bannerView!)
	
```

对 `viewDidAppear` 和 `viewWillDisappear` 方法增加以下代码：

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
    self.bannerView?.resumeAutoUpdate()
}

override func viewDidDisappear(animated: Bool) {
    self.bannerView?.pauseAutoUpdate()
}
```

如果你希望关闭横幅广告的自动更新：

```objective-c
self.bannerView.autoUpdate = NO;
```

如果你希望停止横幅广告，并从屏幕移除：

```objective-c
[self.bannerView stop];
```

### 标准横幅广告事件处理

为了处理横幅广告事件，你应当实现区块或订阅通知：

 | 方法 | 说明  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|` (void (^)(AMPBannerView *banner))success `| 在成功处理横幅广告之后调用。 |
|` (void (^)(AMPError *error))failure `| 在横幅广告没有被处理时调用|
|` kAMPNotification_BannerClicked `| 在点击横幅广告后调用。在此事件之后，app将被最小化，并打开外部浏览器 |


插播广告
=============

用于测试的广告空间ID (FULLSCREEN): `"2cb34a73-0012-4264-9526-bde1fce2ba92"`
根据屏幕尺寸自动定义横幅广告尺寸。
在你的`UIViewController`子类中使用以下方法：

```objective-c
- (void)loadFullscreenWithIdentifier:(NSString *)identifier
    options:(AMPFullscreenLoadOptions)options
    forViewController:(UIViewController *)viewController
    success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
    failure:(void (^)(AMPError *error))failure;
```

对于全屏横幅广告，有3种展示选择：

```objective-c
typedef NS_ENUM(NSInteger, AMPFullscreenLoadOptions)
{
    AMPFullscreenLoadOptionsDefault = 0,
    AMPFullscreenLoadOptionsShowAfterLoad,
    AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};
```

默认选择是加载横幅广告，如果横幅广告被加载则调用成功区块。你可以立即从此区块显示横幅广告。`ShowAfterLoad`选项加载横幅广告并立即显示，然后调用成功区块。从成功区块中，你可以将它保存到你的UIViewController控制器子类属性中或什么都不做。`ShowAfterLoadWithDelay`选项加载横幅广告，调用成功区块，并在某个延迟之后显示，该延迟由服务器返回。从成功区块中，你可以将其保存到你的`UIViewController`子类属性中，立即显示或什么都不做。

**注释：如果没有规定延迟，插播广告将在加载完成后立即显示。**

例如：

*objective-c*

```objective-c

[[AmpiriSDK sharedSDK] loadFullscreenWithIdentifier:@"2cb34a73-0012-4264-9526-bde1fce2ba92"
    options:AMPFullscreenLoadOptionsDefault
    forViewController:self
    success:^(AMPFullscreenBannerController *fullscreenController) {} failure:nil];
```

*swift*

```swift
AmpiriSDK.sharedSDK().loadFullscreenWithAdUnitId("2cb34a73-0012-4264-9526-bde1fce2ba92", 
	options: .ShowAfterLoad, forViewController: self, success: nil, failure: nil)
```
### Interstitial events handling

为了处理插播广告事件，你应当实现区块或订阅通知。可用选择如下：

| 方法 | 说明 |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPFullscreenBannerController` `*fullscreenController))success `| 在处理全屏横幅广告之后调用。在调用此方法之后，横幅广告可用于显示。|
|`(void (^)(AMPError *error))failure `|  如果没有下载全屏横幅广告则调用。|
|`kAMPNotification_FullscreenControllerClicked `|	在点击横幅广告后调用。在此事件之后，app将被最小化，并打开外部浏览器。|
|`kAMPNotification_FullscreenControllerDidHide	`| 在全屏横幅广告从屏幕上消失之后调用。|
|`kAMPNotification_FullscreenControllerDidShow `|在全屏横幅广告显示后调用|
|`kAMPNotification_FullscreenControllerWillHide `| 在点击"close" 按钮之后调用，在全屏横幅广告消失之前。|
|`kAMPNotification_FullscreenControllerWillLoad `|在向服务器发送全屏横幅广告请求之前调用。|
|`kAMPNotification_FullscreenControllerWillShow `|在显示全屏横幅广告之前调用。|



视频广告
=========

用于测试的视频广告空间的ID (VIDEO): `"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"`

在你的`UIViewController`子类中使用以下方法：

```objective-c
- (void)loadVideoWithAdUnitId:(NSString *)adUnitId
    success:(void (^)(AMPVideoController *videoController))success
    failure:(void (^)(AMPError *error))failure;
```

例如：

*objective-c*

```objective-c
[[AmpiriSDK sharedSDK] loadVideoWithAdUnitId:@"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"
	success:^(AMPVideoController *videoController) {} failure:nil];
```

*swift*

```swift
AmpiriSDK.sharedSDK().loadVideoWithAdUnitId("87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
    videoViewController in
    videoViewController.showFromViewController(self)
}, failure: nil)
```

### Video events handling

为了处理视频广告事件，你应当实现区块或订阅通知。可用方法如下：

| 方法 | 说明  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPVideoController` `	*videoController))success `|在处理视频之后调用。在调用此方法之后，视频广告可用显示。 |
|`(void (^)(AMPError *error))failure `|  在视频广告未被下载之后调用。 |
|`kAMPNotification_VideoControllerWillShow `| 当视频显示（将要显示）时调用。|
|`kAMPNotification_VideoControllerDidShow `|  当视频已经显示时调用。 |
|`kAMPNotification_VideoControllerWillHide `| 当视频将要隐藏时调用（将被关闭）。|
|`kAMPNotification_VideoControllerDidHide `|当视频隐藏（被关闭）时调用。|
|`kAMPNotification_VideoControllerStarted `| 当视频开始时调用。|
|`kAMPNotification_VideoControllerPause `| 当视频暂停时调用（目前没有实现）。|
|`kAMPNotification_VideoControllerResume `| 当视频恢复时调用（目前没有实现）。|
|`kAMPNotification_VideoControllerCompleted `|当视频显示完成时调用。|
|`kAMPNotification_VideoControllerWillLoad `| 在向服务器发送视频请求之前调用。|
|`kAMPNotification_VideoControllerClicked `|在点击视频之后调用。在此事件之后，app将被最小化，并打开外部浏览器。|



原生广告
==========

用于测试的广告空间ID (Native ad): `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

原生广告是无任何预定义包装UI的自然呈现，这使开发者能够自由的设计和控制广告。
开发者通过Interface Builder (creating .xib file)或手动在代码中创建UI控制配置原生广告的布局。
在你的`UIViewController`子类中使用以下方法：

```objective-c
- (void)loadNativeAdWithAdUnitId:(NSString *)adUnitId
	parentViewController:(UIViewController *)viewController
	adViewClassForRendering:(Class)adViewClass
	success:(void (^)(UIView *adNativeViewContainer))success
	failure:(void (^)(AMPError *error))failure;
```

以下方法执行原生广告和所有关联资源的非对称下载，并在此后将广告数据翻译为相关的UI控制。


当实现一个原生广告时，可以使用一个公用算法：

1. 创建你的`AMPNative` 的子类，名称任意 (例如，`MyNativeBannerView`)

2. 从以下两个选项之中选择一个。

	*XIB 选项  -  在单独的XIB文件中设计`MyNativeBannerView`的布局。开发者应当将需要的UI控制捆绑在此XIB和来自`<AMPNativeViewInterface>`的属性中，`AMPNativeView`采用了该属性。`MyNativeBannerView`类的实现必须覆盖`+ (NSString*)xibName`方法，该方法返回同一个XIB的名称。

	*编码选项 -  必须通过使用`<AMPNativeViewInterface>`（`AMPNativeView`采用）创建和布置UI控制，执行`MyNativeBannerView`类的实现。

3.  以要求的参数调用loadNativeAdWithSize，其中`adUnitId`是你的私有广告空间ID，className是`MyNativeBannerView`类的名称。在下载广告数据之后，SDK开始在步骤2中创建`MyNativeBannerView`类的实例。此后，SDK使原生广告数据翻译为此实例的约束控制。不是所有的控制都通过此方式完成，而是只有主要的一个：`ampTitleTextLabel, ampMainTextLabel,  ampIconImageView, ampMainImageView`。当翻译完成时，将调用具有此示例的成功完成的区块。

4.  在广告视图容器中翻译其它控制，例如`ampRatingView`。
** 注释：*MyNativeBannerView*类的属性可以为空，你不能从额外的翻译中获得广告数据 **. 

5. 在屏幕上显示广告视图容器。


6.  对点击处理注册广告视图容器。

例如：

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
AmpiriSDK.sharedSDK().loadNativeAdWithAdUnitId("7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController: self, adViewClassForRendering: NativeBannerView.self, success: {
    view in
    self.nativeView = view
}, failure: nil)
```

位置控制
================

用于测试的广告空间ID （原生广告类似）: `"7f900c7d-7ce3-4190-8e93-310053e70ca2"`

位置控制是基于`UITableView` 或 `UICollectionView` 在你的推送中添加原生广告的智能技术。用于位置控制的设置从服务器一侧返回，并且可以按需要进行改变。

为了更方便的集合ji'he，你可以使用我们的可定制模板：基于`AMPNativeAdsTemplateType`枚举的`in-Feed` 和 `Content Stream`:

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

定制清单

| AMPTemplateCustomizationObject的属性 | 说明  |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`ampBackgroundColor `| 广告单元的颜色 |
|`ampTitleFont `| 广告单元中标题标签的字体 |
|`ampTitleColor `| 广告单元中标题标签的文本颜色 |
|`ampDescriptionTextFont `| 广告单元中说明标签的字体|
|`ampDescriptionTextColor `|广告单元中说明标签的文本颜色|
|`ampDescriptionTextLeftOffset `|广告单元中说明标签的左偏移|
|`ampDescriptionTextRigthOffset `| 广告单元中说明标签的右偏移|
|`ampCoverImageLeftOffset `|广告主图像视图的左偏移|
|`ampCoverImageRightOffset `|广告主图像视图的右偏移|
|`ampCoverImageTopOffset `|广告主图像视图的顶部偏移|
|`ampCoverImageBottomOffset `|广告主图像视图的底部偏移|
|`ampCoverImageCornerRadius `|广告主图像布局的角半径|
|`ampCTAFont `| 调用活动标签字体 |
|`ampCTAColor `|调用活动视图背景颜色|
|`ampCTATextColor `| 调用活动标签文本颜色|
|`ampCTABorderColor `|调用活动层边界颜色|
|`ampCTACornerRadius `|调用活动层角半径 |
|`ampCTABorderWidth `| 调用活动层边界宽度|
|`ampCTARightOffset `|广告调用活动视图的右偏移|
|`ampCTABottomOffset `|广告调用活动视图的底部偏移|
|`ampSponsoredFont `| 赞助标签字体|
|`ampSponsoredColor `| 赞助标签文本颜色|
|`ampIconLeftOffset `|广告app图标视图的左偏移|
|`ampIconTopOffset `|广告app图标视图的顶部偏移|
|`ampIconHeight `|广告app图标视图的高度|
|`ampIconWidth `| 广告app图标视图的宽度|
|`ampIconCornerRadius `|广告app图标层的角半径|
|`ampIconContentMode `|广告app图标视图的内容模式|

如果你希望使用自己对原生广告的呈现，请使用以下方法：

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

这些方法工作原理与 [Native Ads](#native-ads)相同。你必须使用此类广告的说明设置方法中的域 `adViewClass`。

对于`UITableView`，你在`UITableViewDelegate`和`UITableViewDataSource`方法中无需做任何事情就可以在你的反馈中添加广告，原生广告将自动添加。

对于`UICollectionView`，如果您仅使用定制收集视图布局，你必须在`UICollectionViewDelegate` 和 `UICollectionViewDataSource`方法中写入一些代码，以便在你的推送中添加广告，对于`UICollectionViewFlowLayout`，原生广告将自动添加：

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
override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if (self.adapter?.shouldDisplayAdAtIndexPath(indexPath) == true) {
        let cell: AMPAdContainerCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AMPAdContainerCollectionViewCell", forIndexPath: indexPath) as! AMPAdContainerCollectionViewCell

        cell.layer.zPosition = 100
        return (self.adapter?.adRenderedAdCellAtIndexPath(indexPath, inCell: cell))!
    } else {
        //your feed cell
    }
}
```

** 注释：如果你希望在没有广告的推送中了解某个单元的最初索引路径，使用此方法（对于加载来自你的数据组的数据非常重要）：**
```objective-c
- (NSIndexPath *)originalIndexPath:(NSIndexPath *)indexPath;
```
UITableView`和` UICollectionView`的`方法与`NSIndexPath`共事。如果你想使用它们请使用'的UITableView （ AMPLocationControl ） `和` UICollectionView （ AMPLocationControl ）` categoies （在` AMPTableViewStreamAdapter.h`和` AMPCollectionViewStreamAdapter.h声明`） 。有类别包含用` amp_`前缀相同的方法，返回原来的indexPaths 。

如果你想知道定制清单加载广告，订阅通知` kAMPNotification_LocationControlAdsDidLoad`在` NSNotificationCenter` 。

其它
=====

### Test mode (开发模式)
在开发阶段，强烈建议将testMode 设置为 `YES`，以避免产生错误表达和信号声带。默认设置为`NO`。

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>
[AmpiriSDK setTestMode:YES];
```

### User data

如果要将用户数据包括在SDK中，请设置以下性质：

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

例如：

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

//remove all user data from everywhere
[AmpiriSDK resetUserData];
[AmpiriSDK setGender:AMPUserGenderMale];
[AmpiriSDK setAge:25];
[AmpiriSDK setBirthday:[NSDate date]];
[AmpiriSDK setInterests:@[@"running", @"shopping", @"fitness", @"sport"]];
```


