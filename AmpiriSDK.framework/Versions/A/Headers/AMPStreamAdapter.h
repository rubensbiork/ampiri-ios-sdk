//
//  AMPStreamAdapter.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//


@interface AMPStreamAdapter : NSObject

@property (nonatomic, strong, readonly) UIViewController *parentViewController;

/**
 *  Cancel loading ads in your feed
 */
- (void)cancelAdsLoading;

/**
 *  Add location control for native ads to your UITableView
 *  @param tableView                - UITableView which should content native ads
 *  @param viewController           - UIViewController which delegate tableView
 *  @param identifier               - your Ads place id identifier
 *  @param adViewClass              - UIView subclass with your own native ad representation
 *
 *  @return AMPTableViewStreamAdapter object which add native ads to your UITableView and return original indexPaths
 */
- (NSInteger)totalNumberOfRowsInSection:(NSInteger)section withDataSourceCount:(NSInteger)count;

/**
 *  Converts index path from view to original data source
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return original index path without ad cells
 */
- (NSIndexPath *)originalIndexPath:(NSIndexPath *)indexPath;

/**
 *  Converts dataSource index paths to view's index paths
 *  @param indexPaths                - array of index paths which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return actual indexPath in UITableView or UICollectionView considering added Ads
 */
- (NSMutableArray *)streamIndexPathsFromDataSourceIndexPaths:(NSArray *)indexPaths;

/**
 *  Converts original index path to view's index path
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return actual indexPath in UITableView or UICollectionView considering added Ads
 */
- (NSIndexPath *)streamIndexPathFromDataSourceIndexPath:(NSIndexPath *)indexPath;

/**
 *  Should display ad at this index path
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return should display ad at this index path
 */
- (BOOL)shouldDisplayAdAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Return native ad object for index path if it has to be shown
 *  @param indexPath                - index path which returned UITableView or UICollectionView dataSource/delegate methods
 *
 *  @return native ad object for index path if it has to be shown
 */
- (id)adObjectToDisplayAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  If you want to move sections use this methods for correct working location control
 *  @param section                  - old section number
 *  @param newSection               - new section number
 */
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

@end