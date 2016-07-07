//
//  AMPDataUnit.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPDataUnit.h"

@interface AMPDataUnit()
@property (strong, nonatomic) UIImage *photo;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *specification;
@property (copy, nonatomic) NSString *pinUnit;
@end

@implementation AMPDataUnit
@synthesize photo = _photo;
@synthesize name = _name;
@synthesize specification = _specification;
@synthesize pinUnit = _pinUnit;

- (instancetype)initDataUnitWithName:(NSString*)name andSpecification:(NSString*)specification andPhoto:(UIImage*)photo {
    if (self = [super init]) {
        self.name = name;
        self.specification = specification;
        self.photo = photo;
        self.pinUnit = [@ (arc4random() % 2016) stringValue];
    }
    return self;
}

@end
