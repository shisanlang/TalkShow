//
//  AFServer.m
//  TalkShow
//
//  Created by dxd on 14/11/19.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "AFServer.h"

static AFServer* server = nil;

@implementation AFServer

+ (AFServer*)sharedInstance {
    if (!server) {
        server = [[self alloc] init];
    }
    return server;
}

- (void)GET:(NSString*)url
 parameters:(NSDictionary *)parameters
finishBlock:(FinishLoadHandle)finishBlock
failedBlock:(FailedLoadHandle)failedBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = HTTP_TIME_OUT;
    [manager.requestSerializer setValue:USER_TOKEN forHTTPHeaderField:@"Token"];
//    manager.requestSerializer.HTTPRequestHeaders;
    DLog(@"url = %@",url);
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = responseObject;
//        NSString *result =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSData *data2 = [result dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictionary = (NSDictionary *)data;
            if (finishBlock) { finishBlock(dictionary); }
            
        } else if ([jsonObject isKindOfClass:[NSArray class]]) {
            NSArray *nsArray = (NSArray *)jsonObject;
            if (finishBlock) { finishBlock(nsArray); }
            
        } else if ([jsonObject isKindOfClass:[NSString class]]) {
            NSString *result =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if (finishBlock) { finishBlock(result); }
            
        } else {
            if (finishBlock) { finishBlock(nil); }
            DLog(@"An error happened while deserializing the JSON data.");
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failedBlock) { failedBlock(error); }
    }];
}

- (void)POST:(NSString*)url
  parameters:(NSDictionary*)parameters
    filePath:(NSString*)filePath
 finishBlock:(FinishLoadHandle)finishBlock
 failedBlock:(FailedLoadHandle)failedBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    if (filePath) {
        [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:@"image" error:nil];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSData *data = responseObject;
            NSString *result =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if (finishBlock) { finishBlock(result); }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failedBlock) { failedBlock(error); }
        }];
    } else {
        [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSData *data = responseObject;
            NSString *result =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if (finishBlock) { finishBlock(result); }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failedBlock) { failedBlock(error); }
        }];
    }
}



@end
