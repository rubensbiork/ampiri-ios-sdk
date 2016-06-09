//
//  AMPTweetsManager.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 06.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "AMPTweetsManager.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>


@interface AMPTweetsManager ()

@property(nonatomic, strong) NSMutableArray *mutableTweets;

@property(nonatomic, strong) ACAccountStore *account;
@property(nonatomic, strong) ACAccountType *accountType;

@property(nonatomic, assign) NSUInteger currentTweetsPage;

@end


@implementation AMPTweetsManager

#pragma mark - Shared Instance


+ (instancetype)sharedManager {
    static id sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    return sharedManager;
}


#pragma mark - public


- (void)loadNextSetOfTweets:(void (^)(NSArray<AMPTweet *> *tweets, NSError *error))complitionBlock {
    __weak typeof(self) weakSelf = self;
    [self.account requestAccessToAccountsWithType:self.accountType
                                          options:nil
                                       completion:^(BOOL granted, NSError *error) {
                                           if (!granted) {
                                               dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                   if (complitionBlock) {
                                                       complitionBlock([NSArray array], error);
                                                   }
                                               });
                                               return;
                                           }

                                           NSArray *arrayOfAccounts = [weakSelf.account accountsWithAccountType:weakSelf
                                               .accountType];
                                           if (arrayOfAccounts.count < 1) {
                                               dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                   if (complitionBlock) {
                                                       complitionBlock([NSArray array], error);
                                                   }
                                               });
                                               return;
                                           }

                                           NSURL *twitterTimelineURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"];
                                           NSDictionary *parametres = @{@"q" : @"glispa", @"count" : @(90)};

                                           SLRequest *tweetsRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                                                         requestMethod:SLRequestMethodGET
                                                                                                   URL:twitterTimelineURL
                                                                                            parameters:parametres];
                                           tweetsRequest.account = [arrayOfAccounts lastObject];

                                           [tweetsRequest performRequestWithHandler:^(NSData *responseData,
                                               NSHTTPURLResponse *urlResponse,
                                               NSError *error) {
                                               NSError *localError = nil;
                                               [weakSelf serializeTweetsToLocalTweetsModel:[NSJSONSerialization JSONObjectWithData:responseData
                                                                                                                           options:NSJSONReadingMutableLeaves
                                                                                                                             error:&localError][@"statuses"]];
                                               weakSelf.currentTweetsPage++;

                                               dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                   if (complitionBlock) {
                                                       complitionBlock(weakSelf.mutableTweets, localError);
                                                   }
                                               });
                                           }];

                                       }];
}


- (NSArray *)tweets {
    return self.mutableTweets;
}


#pragma mark - private


- (instancetype)init {
    self = [super init];
    
    self.account = [ACAccountStore new];
    self.accountType = [self.account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    self.currentTweetsPage = 0;
    self.mutableTweets = [NSMutableArray array];
    
    return self;
}


- (void)serializeTweetsToLocalTweetsModel:(NSArray *)tweets {
    __weak typeof(self) weakSelf = self;
    [tweets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        AMPTweet *tweet = [AMPTweet new];
        [tweet serializeFromJSON:obj];
        [weakSelf.mutableTweets addObject:tweet];
    }];
}

@end
