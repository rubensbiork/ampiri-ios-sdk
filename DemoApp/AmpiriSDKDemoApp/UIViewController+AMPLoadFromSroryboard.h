//
//  UIViewController+AMPLoadFromSroryboard.h
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 04/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (AMPLoadFromSroryboard)

+ (instancetype)amp_loadFromStoryboardWithName:(NSString *)storyboardName;

@end
