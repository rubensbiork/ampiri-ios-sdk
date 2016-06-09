//
//  AMPTweet.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 06.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AMPTweet : NSObject

@property(nonatomic, copy, readonly) NSString *tweetMessage;
@property(nonatomic, copy, readonly) NSString *date;
@property(nonatomic, copy, readonly) NSString *author;
@property(nonatomic, strong, readonly) NSURL *imageURL;

- (void)serializeFromJSON:(NSDictionary *)JSON;

@end
