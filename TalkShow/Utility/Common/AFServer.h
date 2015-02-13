//
//  AFServer.h
//  TalkShow
//
//  Created by dxd on 14/11/19.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFServer : NSObject

typedef void(^FinishLoadHandle) (id result);
typedef void(^FailedLoadHandle) (NSError *error);

+ (AFServer*)sharedInstance;
- (void)GET:(NSString*)url
 parameters:(NSDictionary *)parameters
finishBlock:(FinishLoadHandle)finishBlock
failedBlock:(FailedLoadHandle)failedBlock;

- (void)POST:(NSString*)url
  parameters:(NSDictionary*)parameters
    filePath:(NSString*)filePath
 finishBlock:(FinishLoadHandle)finishBlock
 failedBlock:(FailedLoadHandle)failedBlock;

@end
