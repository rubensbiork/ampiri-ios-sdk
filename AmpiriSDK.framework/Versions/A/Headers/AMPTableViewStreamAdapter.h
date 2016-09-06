//
//  AMPTableViewStreamAdapter.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 2/13/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPStreamAdapter.h"
#import "AMPAdTypes.h"

@class AMPTemplateCustomizationObject;

@interface AMPTableViewStreamAdapter : AMPStreamAdapter

@end

@interface AMPTableViewStreamAdapter (AMPTableViewEditMode)

/**
 *  If you want to insert rows use this methods for correct working location control
 *  @param indexPaths               - array of index paths which you would like to insert
 *  @param animation                - UITableView row animation enum
 */
- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  If you want to delete rows use wthis methods for correct working location control
 *  @param indexPaths               - array of index paths which you would like to delete
 *  @param animation                - UITableView row animation enum
 */
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

@end

