//
//  AMPNativeAd.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 23.12.15.
//  Copyright © 2015 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AMPNativeAd : NSObject

@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *icon;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@property(nonatomic, copy) NSString *callToActionTitle;
@property(nonatomic, assign) CGFloat starRating;

@end
