//
//  AMPImageCache.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 08.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "AMPImageCache.h"


@interface AMPImageCache ()

@property (nonatomic, strong) NSCache *imgCache;

@end

@implementation AMPImageCache

+ (AMPImageCache *)sharedImageCache {
    static AMPImageCache *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
        instance.imgCache = [NSCache new];
    });
    
    return instance;
}


- (void)addImage:(UIImage *)image withURL:(NSURL *)imageURL {
    [self.imgCache setObject:image forKey:imageURL];
}


- (UIImage *)imageWithURL:(NSURL *)imageURL {
    return [self.imgCache objectForKey:imageURL];
}


- (BOOL)doesExistImageWithURL:(NSURL *)imageURL {
    return ([self.imgCache objectForKey:imageURL] != nil);
}

@end

