//
//  AMPImageCache.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AMPImageCache : NSObject

+ (instancetype)sharedImageCache;

- (void)addImage:(UIImage *)image withURL:(NSURL *)imageURL;

- (UIImage *)imageWithURL:(NSURL *)imageURL;

- (BOOL)doesExistImageWithURL:(NSURL *)imageURL;

@end
