//
//  AMPFullscreenBannerController.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 04/03/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AMPFullscreenBannerController : NSObject

@property(nonatomic, strong) CLLocation *location;
@property(nonatomic, readonly) BOOL ready;

- (void)showFromViewController:(UIViewController *)viewController;

@end
