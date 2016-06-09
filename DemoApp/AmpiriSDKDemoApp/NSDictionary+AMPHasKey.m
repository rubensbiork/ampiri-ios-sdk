//
//  NSDictionary+AMPHasKey.m
//  AmpiriSDKDemo
//
//  Created by Glispa GmbH on 06.01.15.
//  Copyright (c) 2015 Glispa GmbH. All rights reserved.
//

#import "NSDictionary+AMPHasKey.h"


@implementation NSDictionary (AMPHasKey)

- (BOOL)amp_hasKey:(id)key {
    return [[self allKeys] containsObject:key];
}

@end
