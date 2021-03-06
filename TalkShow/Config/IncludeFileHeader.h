//
//  IncludeFileHeader.h
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#ifndef TalkShow_IncludeFileHeader_h
#define TalkShow_IncludeFileHeader_h

//文件

//view
#import "UIView+Common.h"
//nav
#import "CRGradientNavigationBar.h"
#define UIColorFromRGB(rgbValue)[UIColor colorWithRed:((float)((rgbValue&0xFF0000)>>16))/255.0 green:((float)((rgbValue&0xFF00)>>8))/255.0 blue:((float)(rgbValue&0xFF))/255.0 alpha:1.0]

#import "MLNavigationController.h"
//url
#import "AFHTTPRequestOperationManager.h"
#import "AFServer.h"
#define AFHTTP [AFServer sharedInstance]
#define HTTP_TIME_OUT 10
//table
//#import "PullTableView.h"
#import "SVPullToRefresh.h"
//hub
#import "MBProgressHUD.h"
//image
#import "UIImageView+WebCache.h"
//正则
//DB
#import "FMDatabase.h"
//Cache
//瑞士军刀
#import "Victorinox.h"
//Button
#import "Button+Block.h"
//View
#import "BaseViewController.h"
#import "VideoViewController.h"
#import "PlayVideoViewController.h"

#endif
