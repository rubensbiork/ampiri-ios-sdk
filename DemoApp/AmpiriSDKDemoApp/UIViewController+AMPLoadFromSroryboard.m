//
//  UIViewController+AMPLoadFromSroryboard.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "UIViewController+AMPLoadFromSroryboard.h"


@implementation UIViewController (AMPLoadFromSroryboard)

+ (instancetype)amp_loadFromStoryboardWithName:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]]
                          instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

@end
