//
//  AMPLocationControlTableViewCell.h
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 21/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMPImageView.h"


@interface AMPLocationControlTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet AMPImageView *tweetImageView;
@property(nonatomic, weak) IBOutlet UILabel *tweetTextLabel;
@property(nonatomic, weak) IBOutlet UILabel *tweetNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *tweetDateLabel;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *tweetImageWidthConstrint;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *tweetImageHeigthConstrint;

@end
