//
//  AMPLocationControlTableViewCell.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 21/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPLocationControlTableViewCell.h"


@implementation AMPLocationControlTableViewCell

- (void)layoutSubviews {
    self.tweetTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetTextLabel.frame);
    self.tweetNameLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetNameLabel.frame);
    [super layoutSubviews];
}

@end
