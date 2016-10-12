//
//  AMPBaseCollectionViewController.h
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 11.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPBaseCollectionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
