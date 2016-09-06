//
//  AMPBaseTableViewController.m
//  AmpiriSDKDemoApp
//
//  Created by Viacheslav Leonov on 10.08.16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

#import "AMPBaseTableViewController.h"
#import "AMPLocationControlTableViewCell.h"
#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"

static NSInteger const kAMPSectionsCount = 3;

@interface AMPBaseTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation AMPBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AMPLocationControlTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AMPLocationControlTableViewCell class])];
    [self loadData];
}

#pragma mark Not related to ads


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMPLocationControlTableViewCell *adCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AMPLocationControlTableViewCell class])];

    AMPDataUnit *item = self.dataSource[indexPath.section][indexPath.row];

    adCell.tweetNameLabel.text = item.name;
    if (!item.photo) {
        adCell.tweetImageView.image = nil;
    } else {
        adCell.tweetImageView.image = [UIImage imageNamed:item.photo];
    }

    adCell.tweetTextLabel.text = item.specification;

    [adCell layoutIfNeeded];

    return adCell;
}


#pragma mark Editable table support

- (IBAction)loadClicked:(id)sender {
    NSAssert(YES, @"Called from derived classes");
}

- (IBAction)editModeClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.tableView.editing = sender.selected;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *itemsGroupe = self.dataSource[indexPath.section];
        [itemsGroupe removeObjectAtIndex:indexPath.row];

//        if (self.adapter == nil) {
//            [tableView beginUpdates];
//            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [tableView endUpdates];
//        }
    }
}


- (NSIndexPath *)              tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                     toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    return proposedDestinationIndexPath;
}


- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
    AMPDataUnit *unit = self.dataSource[sourceIndexPath.section][sourceIndexPath.row];
    [self.dataSource[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [self.dataSource[destinationIndexPath.section] insertObject:unit atIndex:destinationIndexPath.row];
}

#pragma mark - Data

- (void)loadData {
    NSArray *units = [AMPDataUnitManager createDataUnitList:16];
    [self organizeData:units bySection:kAMPSectionsCount];
}

- (void)organizeData:(NSArray *)dataArray bySection:(NSInteger)sectionsCount {
    self.dataSource = [NSMutableArray new];
    NSInteger itemsInSection = dataArray.count / sectionsCount;
    NSInteger startPos = 0;
    for (int i = 0; i < sectionsCount; i++) {
        NSArray *groupe = [dataArray subarrayWithRange:NSMakeRange(startPos, MIN(itemsInSection, dataArray.count - startPos))];
        startPos += groupe.count;
        NSMutableArray *itemsGroupe = [NSMutableArray arrayWithArray:groupe];
        [self.dataSource addObject:itemsGroupe];
    }

    if (startPos < dataArray.count) {
        NSMutableArray *itemsGroupe = [self.dataSource lastObject];
        [itemsGroupe arrayByAddingObjectsFromArray:[dataArray subarrayWithRange:NSMakeRange(startPos, dataArray.count - startPos)]];
    }
}

@end
