//
//  AMPStatistics.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 3/29/16.
//  Copyright © 2016 ampiri. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AMPStatistics : NSObject

+ (NSDictionary *)statisticsForIdentifier:(NSString *)identifier;

+ (void)resetStatisticsForIdentifier:(NSString *)identifier;

+ (void)resetStatistics;

@end
