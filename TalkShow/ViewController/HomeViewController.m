//
//  HomeViewController.m
//  TalkShow
//
//  Created by dxd on 14-8-22.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "HomeViewController.h"
//#import "UIImageView+WebCache.h"

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
    
//    pullTableView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 0, XD_VIEW_WIDTH, XD_DVIEW_HEIGHT)];//self.view.bounds
//    pullTableView.pullDelegate = self;
//    pullTableView.delegate = self;
//    pullTableView.dataSource = self;
//    pullTableView.pullArrowImage = [UIImage imageNamed:@"blackArrow"];
//    pullTableView.pullBackgroundColor = C_CLEAR_COLOR;
//    pullTableView.pullTextColor = C_GRAY2_COLOR;
//    [self.view addSubview:pullTableView];

    
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
    
    
//    NSString* docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString* dbpath = [docsdir stringByAppendingPathComponent:@"user.sqlite"];
//
//    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
//    if (![db open]) {
//        return;
//    }
//    FMResultSet *s = [db executeQuery:@"SELECT COUNT(*) FROM myTable"];
//    if ([s next]) {
//        int totalCount = [s intForColumnIndex:0];
//    }
//    [db close];
    
    _data = [[NSMutableArray alloc]init];
    __weak typeof(self) weakSelf = self;//__weak HomeViewController *weakSelf = self;
//    __block HomeViewController * blockSelf = self;
    
    self.listView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XD_VIEW_WIDTH, XD_DVIEW_HEIGHT) style:UITableViewStylePlain];
    self.listView.backgroundColor = [UIColor cyanColor];
    self.listView.dataSource = self;
    self.listView.delegate = self;
    [self.listView setRowHeight:100];
    [self.view addSubview:self.listView];
    
    
    [self.listView addPullToRefreshWithActionHandler:^{
//        [weakSelf insertRowAtTop];
//        [_listView reloadData];
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf->page = 1;
            [AFHTTP GET:@"http://www.iyoapp.com/test/php/getpage.php" parameters:@{@"page":@(strongSelf->page)} finishBlock:^(id result){
                DLog(@"r = %@",result);
                if ([result count]<10) {
                    weakSelf.listView.showsInfiniteScrolling = NO;
                } else {
                    weakSelf.listView.showsInfiniteScrolling = YES;
                }
                [weakSelf.data removeAllObjects];
                [weakSelf.data addObjectsFromArray:result];
                [weakSelf.listView.pullToRefreshView stopAnimating];
                [weakSelf.listView reloadData];
                
            }failedBlock:^(NSError *error){
                DLog(@"e = %@",error);
            }];
        }
        
    }];
    
//     setup infinite sXcrolling
    [self.listView addInfiniteScrollingWithActionHandler:^{
//        [weakSelf insertRowAtBottom];
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf->page++;
            
            [AFHTTP GET:@"http://www.iyoapp.com/test/php/getpage.php" parameters:@{@"page":@(strongSelf->page)} finishBlock:^(id result){
                DLog(@"r = %@",result);
                if ([result count]<10) {
                    weakSelf.listView.showsInfiniteScrolling = NO;
                } else {
                    weakSelf.listView.showsInfiniteScrolling = YES;
                }
                [weakSelf.data addObjectsFromArray:result];
                [weakSelf.listView.infiniteScrollingView stopAnimating];
                [weakSelf.listView reloadData];
                
            }failedBlock:^(NSError *error){
                DLog(@"e = %@",error);
            }];
        }
    }];
    
//    NSString*path2=@(getenv("PATH"));
//    DLog(@"path2 = %@",path2);
}

//- (void)insertRowAtTop {
//    __weak __typeof(self) weakSelf = self;
//    [weakSelf.listView.pullToRefreshView stopAnimating];
//}
//
//
//- (void)insertRowAtBottom {
//    __weak __typeof(self) weakSelf = self;
//    [weakSelf.listView.infiniteScrollingView stopAnimating];
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if(!pullTableView.pullTableIsRefreshing) {
//        pullTableView.pullTableIsRefreshing = YES;
//        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0.0f];
//    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.listView triggerPullToRefresh];
}

- (void)viewDidUnload
{
//    pullTableView = nil;
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Refresh and load more methods

//- (void) refreshTable
//{
//    pullTableView.pullLastRefreshDate = [NSDate date];
//    pullTableView.pullTableIsRefreshing = NO;
//}
//
//- (void) loadMoreDataToTable
//{
//    pullTableView.pullTableIsLoadingMore = NO;
//}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", [_data[indexPath.row] intValue]];
    
    return cell;
}

//- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"Section %i begins here!", section];
//}
//
//- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"Section %i ends here!", section];
//    
//}

//#pragma mark - PullTableViewDelegate
//
//- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
//{
//    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0.0f];
//}
//
//- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
//{
//    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:0.0f];
//}

#pragma mark - table delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoViewController * playVideoVC = [[VideoViewController alloc]init];
    [self.navigationController pushViewController:playVideoVC animated:YES];
}







@end
