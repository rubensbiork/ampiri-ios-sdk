//
//  AMPBaseCollectionViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Viacheslav Leonov on 11.08.16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

#import "AMPBaseCollectionViewController.h"

@interface AMPBaseCollectionViewController ()

@end

@implementation AMPBaseCollectionViewController

- (IBAction)loadClicked:(id)sender {
    NSAssert(YES, @"Called from derived classes");
}
@end
