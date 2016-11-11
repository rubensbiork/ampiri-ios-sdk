# Change Log
All notable changes to this project will be documented in this file.

## [3.3.3]
### Fixed
- Location control minor issues


## [3.3.2]
### Fixed
- Location control minor issues

## [3.3.1]
### Fixed
- Native ad cache timeouts
- Location control minor issues

## [3.3.0]
### Added
- Baidu Ad Network support
- VAST video support

### Changed
- Demo application updated to Swift 3.0
- Chartboost SDK updated to 6.5.1
- Google Mobile Ads SDK updated to 7.12.1
- Mopub SDK updated to 4.9.1
- Vungle SDK updated to 3.2.2
- Facebook Audience SDK updated to 4.16.0
- Baidu SDK updated to 4.3.1

### Fixed
- UI bugs in Location control templates


## [3.2.2]
### Added
- New simplified demo application
- Multiple ad anits support
- Cool down timeout for ad requests

### Changed
- AdColony SDK updated to 2.6.2
- Chartboost SDK updated to 6.4.6
- Google Mobile Ads SDK updated to 7.9.0
- Mopub SDK updated to 4.7.0
- `useDefaultGridMode` parameter removed from `UICollectionView` templated location control

### Fixed
- Location control various UI bugs
- Location control support for data source dynamic changes

## [3.2.1]
### Changed
- `adUnitId` is used instead of different names for identifying ad units across the test application, demo application and documentation
- Facebook Audience SDK updated to 4.14.0
- Google Mobile Ads SDK updated to 7.9.0

### Fixed
- Crash caused by Facebook Audience SDK
- Click was not registered for some Chartboost video ads
- Disappearance of Mopub ads in location control

## [3.2.0]
### Added
- Facebook media view support (Native video and Carousel ads)
- Location control ads preloading
- Internal web view for showing non-AppStore ads.
- Fixed size items for Location control in `UICollectionView`

### Changed
- iOS Deployment target set to 8.0
- AdColony SDK updated to 2.6.2
- Facebook Audience SDK updated to 4.13.1
- Vungle SDK updated to 3.2.1
- Chartboost SDK updated to 6.4.6
- Mopub SDK updated to 4.7.0
- Rating is hidden in ad if it’s 0

### Fixed
- Startapp interstitials click handling
- InMobi banners click handling
- Admob ads display in Feed
- Location control memory usage
- Location control impression issues
- Smooth scroll for location control


## [3.1.0]
### Added
- Feed ads support for ```UITableView``` and ```UICollectionView```
- Customizable templates for infeed ads
- Custom layout support for ```UICollectionView```
- Applovin ad network integration

### Changed
- Facebook Audience updated to 4.11.0
- Chartboost updated to 6.4.4
- Google Mobile Ads updated to 7.8.0
- Mopub updated to 4.6.0

### Fixed
- Server-side video loading
- All fields in native ad are clickable
- VAST video loading
- Chartboost video orientation bug
- Vungle and Chartboost click and videoCompleted requests



[3.1.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.1.0
[3.2.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.0
[3.2.1]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.1
[3.2.2]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.2.2
[3.3.0]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.0
[3.3.1]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.1
[3.3.2]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.2
[3.3.3]: https://github.com/ampiri/ampiri-ios-sdk/releases/tag/v3.3.3
