//
//  AMPTemplateCustomizationObject.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 19/04/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AMPTemplateCustomizationObject : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)defaultCustomization;

@property(nonatomic, strong) UIColor *_Nonnull ampBackgroundColor;

/*
 Customization of the title label
 */
@property(nonatomic, strong) UIFont *_Nonnull ampTitleFont;
@property(nonatomic, strong) UIColor *_Nonnull ampTitleColor;

/*
Customization of the description label
 */
@property(nonatomic, strong) UIFont *_Nonnull ampDescriptionTextFont;
@property(nonatomic, strong) UIColor *_Nonnull ampDescriptionTextColor;
@property(nonatomic, assign) CGFloat ampDescriptionTextLeftOffset;
@property(nonatomic, assign) CGFloat ampDescriptionTextRigthOffset;


/*
 Customization of the cover image button
 */

@property(nonatomic, assign) CGFloat ampCoverImageLeftOffset;
@property(nonatomic, assign) CGFloat ampCoverImageRightOffset;
@property(nonatomic, assign) CGFloat ampCoverImageTopOffset;
@property(nonatomic, assign) CGFloat ampCoverImageBottomOffset;
@property(nonatomic, assign) CGFloat ampCoverImageCornerRadius;

/*
 Customization of the CTA button
 */
@property(nonatomic, strong) UIFont *_Nonnull ampCTAFont;
@property(nonatomic, strong) UIColor *_Nonnull ampCTAColor;
@property(nonatomic, strong) UIColor *_Nonnull ampCTATextColor;
@property(nonatomic, strong) UIColor *_Nonnull ampCTABorderColor;
@property(nonatomic, assign) CGFloat ampCTACornerRadius;
@property(nonatomic, assign) CGFloat ampCTABorderWidth;
@property(nonatomic, assign) CGFloat ampCTARightOffset;
@property(nonatomic, assign) CGFloat ampCTABottomOffset;

/*
 Customization of the sponsored label
 */
@property(nonatomic, strong) UIFont *_Nonnull ampSponsoredFont;
@property(nonatomic, strong) UIColor *_Nonnull ampSponsoredColor;

/*
 Customization of the icon
 */
@property(nonatomic, assign) CGFloat ampIconLeftOffset;
@property(nonatomic, assign) CGFloat ampIconTopOffset;
@property(nonatomic, assign) CGFloat ampIconHeight;
@property(nonatomic, assign) CGFloat ampIconWidth;
@property(nonatomic, assign) CGFloat ampIconCornerRadius;
@property(nonatomic, assign) UIViewContentMode ampIconContentMode;


NS_ASSUME_NONNULL_END


@end
