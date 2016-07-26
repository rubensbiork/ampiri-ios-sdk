//
//  CollectionViewCircleLayout.h
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionViewCircleLayoutTwoKindDelegate <NSObject>
@optional
- (BOOL)shouldUseDefaultAttributeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface CollectionViewCircleLayout : UICollectionViewLayout
@property (nonatomic, weak) id <CollectionViewCircleLayoutTwoKindDelegate> delegate;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat radius;
@end
