//
//  HomeViewController.h
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController :  BaseViewController <UITableViewDataSource, PullTableViewDelegate>{
    PullTableView *pullTableView;

}

//@property (nonatomic, retain) PullTableView *pullTableView;

@end
