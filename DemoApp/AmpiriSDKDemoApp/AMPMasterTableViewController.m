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
#import "AMPNativeAdDetailsViewController.h"
#import "AMPContentStreamTableViewController.h"
#import "AMPCustomTableViewController.h"
#import "AMPInfeedTableViewController.h"
#import "AMPInfeedEditableTableViewController.h"
#import "AMPInfeedFlowLayoutCollectionViewController.h"
#import "AMPContentStreamFlowLayoutCollectionViewController.h"
#import "AMPCustomTemplateFlowLayoutCollectionViewController.h"
#import "AMPCustomTemplateCustomLayoutCollectionViewController.h"

@interface AMPMasterTableViewController ()

@property (nonatomic, strong) NSArray *adItems;

@end

@implementation AMPMasterTableViewController


#pragma mark - Table view data source


- (NSArray *)adItems {
    if (!_adItems) {
        NSMutableArray *mutableAdItems = [NSMutableArray arrayWithArray:
                                                                 @[@{@"title" : @"BANNERS", @"controller" : [AMPBannersDetailViewController class]},
                                                                         @{@"title" : @"INTERSTITIALS", @"controller" : [AMPFullscreensDetailViewController class]},
                                                                         @{@"title" : @"VIDEOS", @"controller" : [AMPVideosDetailViewController class]},
                                                                         @{@"title" : @"NATIVE", @"controller" : [AMPNativeAdDetailsViewController class]}]];
        [mutableAdItems addObject:@{@"title" : @"LOCATION CONTROL", @"adItems" : @[
                @{@"title" : @"UITableView Examples",
                        @"adItems" : @[
                        @{@"title" : @"Infeed", @"xib_controller" : [AMPInfeedTableViewController class], @"xib_name" : @"AMPBaseTableViewController"},
                        @{@"title" : @"Infeed (editable)", @"xib_controller" : [AMPInfeedEditableTableViewController class], @"xib_name" : @"AMPBaseTableViewController"},
                        @{@"title" : @"Content stream", @"xib_controller" : [AMPContentStreamTableViewController class], @"xib_name" : @"AMPBaseTableViewController"},
                        @{@"title" : @"Custom view", @"xib_controller" : [AMPCustomTableViewController class], @"xib_name" : @"AMPBaseTableViewController"}
                ]},
                @{@"title" : @"UICollectionView Examples",
                        @"adItems" : @[
                        @{@"title" : @"Flow layout", @"adItems" : @[
                                @{@"title" : @"Infeed", @"xib_controller" : [AMPInfeedFlowLayoutCollectionViewController class], @"xib_name" : @"AMPBaseCollectionViewController"},
                                @{@"title" : @"Content stream", @"xib_controller" : [AMPContentStreamFlowLayoutCollectionViewController class], @"xib_name" : @"AMPBaseCollectionViewController"},
                                @{@"title" : @"Custom template", @"xib_controller" : [AMPCustomTemplateFlowLayoutCollectionViewController class], @"xib_name" : @"AMPBaseCollectionViewController"}
                        ]},
                        @{@"title" : @"Custom template", @"xib_controller" : [AMPCustomTemplateCustomLayoutCollectionViewController class], @"xib_name" : @"AMPBaseCollectionViewController"}
                ]}
        ]}];
        _adItems = [NSArray arrayWithArray:mutableAdItems];
    }
    return _adItems;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.adItems[indexPath.row][@"title"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *rowDetails = self.adItems[indexPath.row];
    if (rowDetails[@"controller"]) {
        UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]
                instantiateViewControllerWithIdentifier:NSStringFromClass(rowDetails[@"controller"])];
        viewController.title = rowDetails[@"title"];
        [self.navigationController showDetailViewController:viewController sender:nil];
    } else if (rowDetails[@"xib_controller"] && rowDetails[@"xib_name"]) {
        Class ViewControllerClass = rowDetails[@"xib_controller"];
        UIViewController *viewController = (UIViewController *) [[ViewControllerClass alloc] initWithNibName:rowDetails[@"xib_name"] bundle:[NSBundle mainBundle]];
        [self.navigationController showDetailViewController:viewController sender:nil];
    } else if (rowDetails[@"adItems"]) {
        AMPMasterTableViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]
                instantiateViewControllerWithIdentifier:NSStringFromClass([AMPMasterTableViewController class])];
        viewController.adItems = rowDetails[@"adItems"];
        viewController.title = rowDetails[@"title"];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
