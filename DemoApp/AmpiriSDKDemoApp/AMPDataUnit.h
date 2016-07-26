//
//  AMPDataUnit.h
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AMPDataUnit : NSObject
@property (strong, nonatomic, readonly) UIImage *photo;
@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *specification;

- (instancetype)initDataUnitWithName:(NSString *)name andSpecification:(NSString *)specification andPhoto:(UIImage *)photo;
@end
