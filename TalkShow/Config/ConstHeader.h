//
//  ConstHeader.h
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#ifndef TalkShow_ConstHeader_h
#define TalkShow_ConstHeader_h

// 调试
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

//
#define USER_TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:@"USER_TOKEN"]

// 版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define OS_VERSION [[UIDevice currentDevice]systemVersion]  //字符串 无符号数
#define OS_VERSION_VALUE    [OS_VERSION floatValue]
#define OS_G7 OS_VERSION_VALUE>=7.0
#define OS_G6 OS_VERSION_VALUE>=6.0
#define OS_G5 OS_VERSION_VALUE>=5.0
#define OS_L7 OS_VERSION_VALUE<7.0

// 页面
#define XD_SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
#define XD_VIEW_WIDTH 320
#define XD_VIEW_HEIGHT ([[UIScreen mainScreen] applicationFrame].size.height-49-44)
#define XD_DVIEW_HEIGHT ([[UIScreen mainScreen] applicationFrame].size.height-44)

#define XD_KEYBOARD_HEIGHT 216

#define INCH4 ([[UIScreen mainScreen] bounds].size.height == 568)

// 颜色
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define UIColorWithRGB(rgbValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]

#define C_BG_VIEW_COLOR RGB(239,239,239)//[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0]
#define C_MASK_COLOR    RGBA(0, 0, 0, .3)
#define C_CLEAR_COLOR   [UIColor clearColor]
#define C_WHITE_COLOR   [UIColor whiteColor]
#define C_GRAY_COLOR    [UIColor lightGrayColor]

#define C_BLACK_COLOR   UIColorWithRGB(0xffffff)    //黑
#define C_BLACK2_COLOR  UIColorWithRGB(0x1e1e1e)    //浅黑

#define C_GRAY1_COLOR   UIColorWithRGB(0xcccccc)    //灰
#define C_GRAY2_COLOR   UIColorWithRGB(0x666666)    //浅灰
#define C_GRAY3_COLOR   RGB(102,102,102)            //
#define C_GRAY4_COLOR   UIColorWithRGB(0x333333)    //

// 字体
#define FONT_BB [UIFont systemFontOfSize:20.0]
#define FONT_B  [UIFont systemFontOfSize:19.0]
#define FONT_BS [UIFont systemFontOfSize:18.0]
#define FONT_MB [UIFont systemFontOfSize:17.0]
#define FONT_M  [UIFont systemFontOfSize:16.0]
#define FONT_MS [UIFont systemFontOfSize:15.0]
#define FONT_SB [UIFont systemFontOfSize:14.0]
#define FONT_S  [UIFont systemFontOfSize:13.0]      //14
#define FONT_SS [UIFont systemFontOfSize:12.0]
//极小
#define FONT_SURPER_SB [UIFont systemFontOfSize:11.0]
//加粗
#define FONT_B_MS  [UIFont boldSystemFontOfSize:15]


// 排版
#ifdef __IPHONE_6_0// NSTextAlignmentCenter // iOS6 and later
#   define kLabelAlignmentCenter    NSTextAlignmentCenter
#   define kLabelAlignmentLeft      NSTextAlignmentLeft
#   define kLabelAlignmentRight     NSTextAlignmentRight
#   define kLabelTruncationTail     NSLineBreakByTruncatingTail
#   define kLabelTruncationMiddle   NSLineBreakByTruncatingMiddle
#else // older versions
#   define kLabelAlignmentCenter    UITextAlignmentCenter
#   define kLabelAlignmentLeft      UITextAlignmentLeft
#   define kLabelAlignmentRight     UITextAlignmentRight
#   define kLabelTruncationTail     UILineBreakModeTailTruncation
#   define kLabelTruncationMiddle   UILineBreakModeMiddleTruncation
#endif

#ifdef __IPHONE_6_0
#   define kLineBreakModeCharaterWrap   NSLineBreakByCharWrapping
#else
#   define kLineBreakModeCharaterWrap   UILineBreakModeCharacterWrap
#endif

#endif
