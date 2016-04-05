//
//  AMPVideoController.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 07/08/14.
//  Copyright (c) 2014 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AMPVideoController : UIViewController

@property(nonatomic, strong) CLLocation *location;
@property(nonatomic, assign, readonly) BOOL ready;

- (void)showFromViewController:(UIViewController *)viewController;

@end
