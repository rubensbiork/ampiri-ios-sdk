//
//  AMPAdResource.h
//  AmpiriSDK
//
//  Created by Siarhei Barmotska on 17/08/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#ifndef AMPAdResource_h
#define AMPAdResource_h

typedef NS_ENUM(NSUInteger, AMPAdResourceType) {
    AMPAdResourceTypeNone = 0,
    AMPAdResourceTypeIcon = 1 << 0,
    AMPAdResourceTypeImage = 1 << 1,
    AMPAdResourceTypeVideo = 1 << 2,
    AMPAdResourceTypeMedia = AMPAdResourceTypeImage | AMPAdResourceTypeVideo,
    AMPAdResourceTypeAll = AMPAdResourceTypeIcon | AMPAdResourceTypeMedia
};

#endif /* AMPAdResource_h */
