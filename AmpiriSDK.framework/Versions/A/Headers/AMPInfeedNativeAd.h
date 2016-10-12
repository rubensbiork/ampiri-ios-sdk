//
//  AMPInfeedNativeAd.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 2/17/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

@class AMPInternalNativeAd;
@protocol AMPNativeViewInterface;

@interface AMPInfeedNativeAd : NSObject
@property (strong, nonatomic, readonly) UIView <AMPNativeViewInterface> *adView;
@property (assign, nonatomic) CGRect desiredFrame;

@end
