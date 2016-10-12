//
//  AMPVASTError.h
//  AMPVastLib
//
//  Created by Glispa GmbH on 22/07/16.
//  Copyright © 2016 Glispa Gmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kAMPVASTErrorDomain;

typedef enum : NSUInteger {
    AMPVASTErrorMaximumWrapperDepth = 1200,
    AMPVASTErrorXMLParseFailure,
    AMPVASTErrorNoAdsFound,
    AMPVASTErrorNetworkError
} AMPVastErrorCode;

@interface AMPVASTError : NSError

@property (nonatomic, readonly) NSString *amp_errorDescription;

+ (id)errorWithCode:(NSInteger)errorCode andLocalizedDescription:(NSString *)localizedDescription;

@end

