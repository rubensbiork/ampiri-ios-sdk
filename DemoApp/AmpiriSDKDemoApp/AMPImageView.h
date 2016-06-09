//
//  AMPImageView.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 12/01/15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AFCImageViewDelegate <NSObject>

- (void)imageLoadForURL:(NSURL *)tweet didLoadFromCache:(BOOL)loadFromCache;

@end


@interface AMPImageView : UIImageView

- (void)setImageWithURL:(NSURL *)imageURL delegate:(id <AFCImageViewDelegate>)delegate;

@end
