//
//  AMPLocationControlCollectionViewCell.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 22/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPLocationControlCollectionViewCell.h"


@implementation AMPLocationControlCollectionViewCell

- (void)layoutSubviews {
    self.tweetTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetTextLabel.frame);
    self.tweetNameLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetNameLabel.frame);
    [super layoutSubviews];
}

@end
