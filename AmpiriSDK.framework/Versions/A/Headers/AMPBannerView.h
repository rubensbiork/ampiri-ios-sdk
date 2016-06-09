//
//  AMPBannerView.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 23/02/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


#define AMP_BANNER_SIZE_320x50 CGSizeMake(320,50)
#define AMP_BANNER_SIZE_728x90 CGSizeMake(728,90)

@interface AMPBannerView : UIView

@property(nonatomic, readonly) BOOL isStarted;
@property(nonatomic, assign) CGSize adSize;
@property(nonatomic, strong) CLLocation *location;
@property(nonatomic, assign) BOOL autoUpdate;

/**
 *  Dismiss banner
 */
- (void)stop;

/**
 *  Pause auto update of banner
 */
- (void)pauseAutoUpdate;

/**
 *  Resume auto update of banner
 */
- (void)resumeAutoUpdate;

@end
