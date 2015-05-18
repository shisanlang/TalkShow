//
//  Victorinox.m
//  TalkShow
//
//  Created by dxd on 14-8-25.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "Victorinox.h"

@implementation Victorinox

//调试time
+ (void)printDebugTime:(NSString *)tagString {
    NSString* date;
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"hh:mm:ss:SSS"];
    date = [formatter stringFromDate:[NSDate date]];
    NSString * timeNow = [[NSString alloc] initWithFormat:@"%@_%@",tagString, date];
    DLog(@"%@", timeNow);
}

@end
