Pod::Spec.new do |s|
s.name             = "ampiri-ios-sdk"
s.version          = "3.0.0"
s.summary          = "Ampiri iOS SDK"


s.homepage         = "http://ampiri.com/"
s.license          = { "type" => "Commercial", "text" => "  " }
s.author           = { "Ampiri" => "monetize@glispa.com" }

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source       = { :git => "https://github.com/ampiri/ampiri-ios-sdk.git", :tag => '3.0.0' }

# s.frameworks = "WebKit", "Security", "QuickLook", "MobileCoreServices", "CoreText", "AssetsLibrary",
# "Foundation", "CoreData", "Social", "MessageUI", "MediaPlayer", "EventKit", "EventKitUI",
# "QuartzCore", "CoreMedia", "CFNetwork", "SystemConfiguration", "CoreGraphics", "StoreKit",
# "CoreTelephony", "AVFoundation", "AdSupport", "AudioToolbox", "UIKit"

#s.libraries = "libz.1.2.5", "libxml2", "libsqlite3", "libz"

s.subspec 'Core' do |core|
  core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -lxml2' }
  core.vendored_frameworks = 'AmpiriSDK.framework'
end
s.subspec 'Adapters' do |adapters|
  adapters.dependency 'ampiri-ios-sdk/Core'

  adapters.subspec 'FBAudienceAdapter' do |s1|
    s1.dependency 'ampiri-ios-sdk/Core'
    s1.dependency 'FBAudienceNetwork', '~> 4.8'
    s1.vendored_libraries = 'Adapters/libAMPFBAudienceAdapter/libAMPFBAudienceAdapter.a'
  end

  adapters.subspec 'GoogleMobileAdsAdapter' do |s2|
    s2.dependency 'ampiri-ios-sdk/Core'
    s2.dependency 'GoogleMobileAds', '~> 7.6'
    s2.vendored_libraries = 'Adapters/libAMPGoogleMobileAdsAdapter/libAMPGoogleMobileAdsAdapter.a'
  end

  adapters.subspec 'MopubAdapter' do |s3|
    s3.dependency 'ampiri-ios-sdk/Core'
    s3.dependency 'mopub-ios-sdk', '~> 4.4'
    s3.vendored_libraries = 'Adapters/libAMPMopubAdapter/libAMPMopubAdapter.a'
  end

  adapters.subspec 'ChartboostAdapter' do |s4|
    s4.dependency 'ampiri-ios-sdk/Core'
    s4.dependency 'ChartboostSDK', '~> 6.1'
    s4.vendored_libraries = 'Adapters/libAMPChartboostAdapter/libAMPChartboostAdapter.a'
  end

  adapters.subspec 'NativeXAdapter' do |s5|
    s5.dependency 'ampiri-ios-sdk/Core'
    s5.dependency 'NativeX-iOS-SDK', '~> 5.5'
    s5.vendored_libraries = 'Adapters/libAMPNativeXAdapter/libAMPNativeXAdapter.a'
  end

  adapters.subspec 'UnityAdsAdapter' do |s6|
    s6.dependency 'ampiri-ios-sdk/Core'
    s6.dependency 'UnityAds', '~> 1.5'
    s6.vendored_libraries = 'Adapters/libAMPUnityAdsAdapter/libAMPUnityAdsAdapter.a'
  end

  adapters.subspec 'VungleAdapter' do |s7|
    s7.dependency 'ampiri-ios-sdk/Core'
    s7.dependency 'VungleSDK-iOS', '~> 3.2'
    s7.vendored_libraries = 'Adapters/libAMPVungleAdapter/libAMPVungleAdapter.a'
  end

  adapters.subspec 'AdColonyAdapter' do |s8|
    s8.dependency 'ampiri-ios-sdk/Core'
    s8.dependency 'AdColony', '~> 2.6'
    s8.vendored_libraries = 'Adapters/libAMPAdColonyAdapter/libAMPAdColonyAdapter.a'
  end
end
end
