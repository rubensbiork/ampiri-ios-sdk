//
//  AMPMasterTableViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 03/12/15.
//  Copyright © 2015 Glispa GmbH All rights reserved.
//

#import "AMPMasterTableViewController.h"
#import "AMPBannersDetailViewController.h"
#import "AMPFullscreensDetailViewController.h"
#import "AMPVideosDetailViewController.h"
#import "UIViewController+AMPLoadFromSroryboard.h"
#import "AMPNativeAdDetailsViewController.h"
#import "AMPTableViewLocationControlAdDetailsViewController.h"
#import "AMPCollectionViewLocationControlAdDetailsViewController.h"


@interface AMPMasterTableViewController ()

@property (nonatomic, strong, readonly) NSArray *adItems;

@end

@implementation AMPMasterTableViewController


#pragma mark - Table view data source


- (NSArray *)adItems {
    return @[@"BANNERS", @"INTERSTITIALS", @"VIDEOS", @"NATIVE", @"LOCATION CONTROL"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.adItems[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.splitViewController showDetailViewController:[AMPBannersDetailViewController amp_loadFromStoryboardWithName:@"Main"]
                                      sender:nil];
            break;
        
        case 1:
            [self.splitViewController showDetailViewController:[AMPFullscreensDetailViewController amp_loadFromStoryboardWithName:@"Main"]
                                      sender:nil];
            break;

        case 2:
            [self.splitViewController showDetailViewController:[AMPVideosDetailViewController amp_loadFromStoryboardWithName:@"Main"]
                                      sender:nil];
            break;

        case 3:
            [self.splitViewController showDetailViewController:[AMPNativeAdDetailsViewController amp_loadFromStoryboardWithName:@"Main"]
                                      sender:nil];
            break;
        
        case 4: {
            UITabBarController *tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = @[[AMPTableViewLocationControlAdDetailsViewController amp_loadFromStoryboardWithName:@"Main"], [AMPCollectionViewLocationControlAdDetailsViewController amp_loadFromStoryboardWithName:@"Main"]];
            
            [tabBarController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *_Nonnull obj,
                    NSUInteger idx,
                    BOOL *_Nonnull stop) {
                obj.title = idx == 0 ? @"Table" : @"Collection";
            }];
            [self.splitViewController showDetailViewController:tabBarController sender:nil];
            break;
        }

        default:
            break;
    }
}

@end
