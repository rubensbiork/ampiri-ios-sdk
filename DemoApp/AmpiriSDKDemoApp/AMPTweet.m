//
//  AMPTweet.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 06.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "AMPTweet.h"
#import "NSDictionary+AMPHasKey.h"

@interface AMPTweet ()

@property(nonatomic, copy) NSString *tweetMessage;
@property(nonatomic, copy) NSString *date;
@property(nonatomic, copy) NSString *author;
@property(nonatomic, strong) NSURL *imageURL;

@end


@implementation AMPTweet

- (void)serializeFromJSON:(NSDictionary *)JSON {
    NSArray *media = ![JSON amp_hasKey:@"entities"] ? [NSArray array] :
        ![(NSDictionary *) [JSON objectForKey:@"entities"] amp_hasKey:@"media"] ? [NSArray array] :
            [(NSDictionary *) [JSON objectForKey:@"entities"] objectForKey:@"media"];
    
    self.imageURL = [NSURL URLWithString:
                               ![[media lastObject] amp_hasKey:@"media_url"] ? @"" :
                                   [(NSDictionary *) [media lastObject] objectForKey:@"media_url"]
    ];
    
    self.tweetMessage = ![JSON amp_hasKey:@"text"] ? @"" : [JSON objectForKey:@"text"];
    
    self.author = ![JSON amp_hasKey:@"user"] ? @"" :
        ![(NSDictionary *) [JSON objectForKey:@"user"] amp_hasKey:@"name"] ? @"" :
            [(NSDictionary *) [JSON objectForKey:@"user"] objectForKey:@"name"];
    
    self.date = [self getDateFromTwitterDateString:![JSON amp_hasKey:@"created_at"] ? @"" : [JSON objectForKey:@"created_at"]];
}


- (NSString *)getDateFromTwitterDateString:(NSString *)tweetCreatedAt {
    NSDateFormatter *twitterDateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [twitterDateFormatter setLocale:usLocale];
    [twitterDateFormatter setDateStyle:NSDateFormatterLongStyle];
    [twitterDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [twitterDateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    
    return [NSDateFormatter localizedStringFromDate:[twitterDateFormatter dateFromString:tweetCreatedAt]
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
