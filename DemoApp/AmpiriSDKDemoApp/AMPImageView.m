//
//  AMPImageView.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 12/01/15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "AMPImageView.h"
#import "AMPImageCache.h"


@interface AMPImageView ()

@property (nonatomic, weak) id <AFCImageViewDelegate> delegate;

@end

@implementation AMPImageView

- (void)setImageWithURL:(NSURL *)imageURL delegate:(id <AFCImageViewDelegate>)delegate {
    if (imageURL.absoluteString.length > 0) {
        if ([[AMPImageCache sharedImageCache] doesExistImageWithURL:imageURL]) {
            UIImage *tweetImage = [[AMPImageCache sharedImageCache] imageWithURL:imageURL];
            self.image = tweetImage;
            if ([self.delegate performSelector:@selector(imageLoadForURL:didLoadFromCache:)]) {
                [self.delegate imageLoadForURL:imageURL didLoadFromCache:YES];
            }
        } else {
            self.delegate = delegate;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
                __block NSData *data = [NSData dataWithContentsOfURL:imageURL];
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    UIImage *tweetImage = nil;
                    if (data) {
                        tweetImage = [UIImage imageWithData:data];
                        [[AMPImageCache sharedImageCache] addImage:tweetImage withURL:imageURL];
                    }
                    self.alpha = 0;
                    self.image = tweetImage;
                    __weak typeof(self) weakSelf = self;
                    [UIView animateWithDuration:0.2 animations:^{
                        weakSelf.alpha = 1;
                    }];
                    if ([self.delegate performSelector:@selector(imageLoadForURL:didLoadFromCache:)]) {
                        [self.delegate imageLoadForURL:imageURL didLoadFromCache:NO];
                    }
                    data = nil;
                });
            });
        }
    }
}

@end
