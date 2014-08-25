//
//  HomeViewController.m
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "HomeViewController.h"
#import "UIImageView+WebCache.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

//@synthesize pullTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pullTableView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 0, XD_VIEW_WIDTH, XD_DVIEW_HEIGHT)];
    pullTableView.pullDelegate = self;
    pullTableView.dataSource = self;
    pullTableView.pullArrowImage = [UIImage imageNamed:@"blackArrow"];
    pullTableView.pullBackgroundColor = [UIColor yellowColor];
    pullTableView.pullTextColor = [UIColor blackColor];
    [self.view addSubview:pullTableView];

    
    // Do any additional setup after loading the view.
//    [AFHTTP GET:@"http://www.baidu.com/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
//    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 180)];
//    [imageV setImageWithURL:[NSURL URLWithString:@"http://images.55bbs.com/55shuoimg/pic/e6/95/c8/e695c8424b841f133bc9db8131b396f2610x14989.jpg"]
//                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]
//                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//                              DLog(@"123 %@",error);
//                          }];
//    [self.view addSubview:imageV];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    if(!pullTableView.pullTableIsRefreshing) {
        pullTableView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0.0f];
    }
    
}

- (void)viewDidUnload
{
    pullTableView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Refresh and load more methods

- (void) refreshTable
{
    pullTableView.pullLastRefreshDate = [NSDate date];
    pullTableView.pullTableIsRefreshing = NO;
}

- (void) loadMoreDataToTable
{
    pullTableView.pullTableIsLoadingMore = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %i begins here!", section];
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %i ends here!", section];
    
}

#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0.0f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:0.0f];
}







@end
