//
//  VideoViewController.m
//  TalkShow
//
//  Created by dxd on 14-8-27.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 50, 100, 30);
    [button setTitle:@"Play" forState:UIControlStateNormal];
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender){
        PlayVideoViewController * playVideoVC = [[PlayVideoViewController alloc]init];
        [weakSelf.navigationController pushViewController:playVideoVC animated:YES];
    }];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
