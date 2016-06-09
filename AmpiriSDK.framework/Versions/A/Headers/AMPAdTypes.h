//
//  AMPAdTypes.h
//  AmpiriSDK
//
//  Created by Glispa GmbH on 12/8/15.
//  Copyright © 2015 Glispa GmbH. All rights reserved.
//

#ifndef AMPAdTypes_h
#define AMPAdTypes_h

typedef NS_ENUM(NSInteger, AMPNativeAdsTemplateType) {
    AMPNativeAdsTemplateTypeNo = -1,
    AMPNativeAdsTemplateTypeInFeed = 0,
    AMPNativeAdsTemplateTypeContentStream
};

typedef NS_ENUM(NSUInteger, AMPFullscreenLoadOptions) {
    AMPFullscreenLoadOptionsDefault = 0,
    AMPFullscreenLoadOptionsShowAfterLoad,
    AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};

typedef enum {
    AMPUserGenderMale,
    AMPUserGenderFemale,
    AMPUserGenderOther
} AMPUserGender;

#endif /* AMPAdTypes_h */
