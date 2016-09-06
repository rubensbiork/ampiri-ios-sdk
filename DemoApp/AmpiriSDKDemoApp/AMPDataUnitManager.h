//
//  AMPDataUnitManager.h
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AMPDataUnit;

@interface AMPDataUnitManager : NSObject

+ (NSArray<AMPDataUnit *> *)createDataUnitList:(NSUInteger)count;

+ (NSArray<AMPDataUnit *> *)createDataUnitList:(NSUInteger)count from:(NSUInteger)from;
@end
