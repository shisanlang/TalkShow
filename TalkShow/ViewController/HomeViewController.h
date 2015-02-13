//
//  HomeViewController.h
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

@interface HomeViewController :  BaseViewController <UITableViewDataSource,UITableViewDelegate>{
//    PullTableView *pullTableView;
//    UITableView * tableView;
    int page;
}

//@property (nonatomic, retain) PullTableView *pullTableView;
@property (nonatomic, retain) UITableView * listView;
@property (nonatomic, retain) NSMutableArray * data;


@end
