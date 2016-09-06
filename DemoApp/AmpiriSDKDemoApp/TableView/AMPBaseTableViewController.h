//
//  AMPBaseTableViewController.h
//  AmpiriSDKDemoApp
//
//  Created by Viacheslav Leonov on 10.08.16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPBaseTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
