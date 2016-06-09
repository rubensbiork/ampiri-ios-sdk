//
//  AMPTweetsManager.h
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 06.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMPTweet.h"


@interface AMPTweetsManager : NSObject

+ (instancetype)sharedManager;

- (void)loadNextSetOfTweets:(void (^)(NSArray<AMPTweet *> *tweets, NSError *error))complitionBlock;

@end
