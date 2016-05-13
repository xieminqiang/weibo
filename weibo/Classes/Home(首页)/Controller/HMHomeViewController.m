//
//  HMHomeViewController.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMOneViewController.h"
#import "HMTitleButton.h"
#import "HMPopMenu.h"
#import "MQAccountTool.h"
#import "MQAccount.h"
#import "UIImageView+WebCache.h"
#import "HMStatus.h"
#import "HMStatusFrame.h"
#import "HMUser.h"
#import "MJExtension.h"
#import "HMLoadMoreFooter.h"
#import "HMStatusTool.h"
#import "HMUserTool.h"
#import "HMStatusCell.h"
#import "JTNavigationController.h"
#import "UIViewController+JTNavigationExtension.h"

@interface HMHomeViewController () <HMPopMenuDelegate>
/**
 *  微博数组(存放着所有的微博frame数据)
 */
@property (nonatomic, strong) NSMutableArray *statusFrames;

@property (nonatomic, weak) UIRefreshControl *refreshControl;
@property (nonatomic, weak) HMLoadMoreFooter *footer;
@property (nonatomic, weak) HMTitleButton *titleButton;
@end

@implementation HMHomeViewController

#pragma mark - 初始化
- (NSMutableArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = HMColor(211, 211, 211);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置导航栏的内容
    [self setupNavBar];
    
    // 集成刷新控件
    [self setupRefresh];
    
    // 获得用户信息;
    [self setupUserInfo];
//    self.jt_fullScreenPopGestureEnabled = YES;
}

/**
 *  获得用户信息
 */
- (void)setupUserInfo
{
    // 1.封装请求参数
    HMUserInfoParam *param = [HMUserInfoParam param];
    param.uid = [MQAccountTool account].uid;
    
    // 2.加载用户信息
    [HMUserTool userInfoWithParam:param success:^(HMUserInfoResult *user) {
         // 设置用户的昵称为标题
         [self.titleButton setTitle:user.name forState:UIControlStateNormal];

         // 存储帐号信息
         MQAccount *account = [MQAccountTool account];
         account.name = user.name;
         [MQAccountTool save:account];
    } failure:^(NSError *error) {
        HMLog(@"请求失败-------%@", error);
    }];
}

/**
 *  设置导航栏的内容
 */
- (void)setupNavBar
{
    // 设置导航栏按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
//        JTViewController *firstVC = [[JTViewController alloc] init];
//        UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//        firstVC.title = @"First";
//        self.tabBarItem = firstItem;
//        JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:self];
//      firstNav.fullScreenPopGestureEnabled = YES;

    // 设置导航栏中间的标题按钮
    HMTitleButton *titleButton = [[HMTitleButton alloc] init];
    // 设置尺寸
    titleButton.height = 35;
    // 设置文字
    NSString *name = [MQAccountTool account].name;
    [titleButton setTitle:name ? name : @"首页" forState:UIControlStateNormal];
    // 设置图标
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 设置背景
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    // 监听按钮点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    self.titleButton = titleButton;
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.添加下拉刷新控件
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    
    // 2.监听状态
    [refreshControl addTarget:self action:@selector(refreshControlStateChange:) forControlEvents:UIControlEventValueChanged];
    
    // 3.让刷新控件自动进入刷新状态
    [refreshControl beginRefreshing];
    
    // 4.加载数据
    [self refreshControlStateChange:refreshControl];
    
    // 5.添加上拉加载更多控件
    HMLoadMoreFooter *footer = [HMLoadMoreFooter footer];
    self.tableView.tableFooterView = footer;
    self.footer = footer;
}

/**
 *  当下拉刷新控件进入刷新状态（转圈圈）的时候会自动调用
 */
- (void)refreshControlStateChange:(UIRefreshControl *)refreshControl
{
    [self loadNewStatuses:refreshControl];
}

#pragma mark - 刷新
- (void)refresh:(BOOL)fromSelf
{
    if (self.tabBarItem.badgeValue) { // 有数字
        // 转圈圈
        [self.refreshControl beginRefreshing];
        
        // 刷新数据
        [self loadNewStatuses:self.refreshControl];
    } else if (fromSelf) { // 没有数字
        // 让表格回到最顶部
        NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView scrollToRowAtIndexPath:firstRow atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark - 加载微博数据

/**
 *  根据微博模型数组 转成 微博frame模型数据
 *
 *  @param statuses 微博模型数组
 *
 */
- (NSArray *)statusFramesWithStatuses:(NSArray *)statuses
{
    NSMutableArray *frames = [NSMutableArray array];
    for (HMStatus *status in statuses) {
        HMStatusFrame *frame = [[HMStatusFrame alloc] init];
        // 传递微博模型数据，计算所有子控件的frame
        frame.status = status;
        [frames addObject:frame];
    }
    return frames;
}

/**
 *  加载最新的微博数据
 */
- (void)loadNewStatuses:(UIRefreshControl *)refreshControl
{
    // 1.封装请求参数
    HMHomeStatusesParam *param = [HMHomeStatusesParam param];
    HMStatusFrame *firstStatusFrame =  [self.statusFrames firstObject];
    HMStatus *firstStatus = firstStatusFrame.status;
    if (firstStatus) {
        param.since_id = @([firstStatus.idstr longLongValue]);
    }
    
    // 2.加载微博数据
    [HMStatusTool homeStatusesWithParam:param success:^(HMHomeStatusesResult *result) {
        // 获得最新的微博frame数组
        NSArray *newFrames = [self statusFramesWithStatuses:result.statuses];
        
         // 将新数据插入到旧数据的最前面
         NSRange range = NSMakeRange(0, newFrames.count);
         NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
         [self.statusFrames insertObjects:newFrames atIndexes:indexSet];

         // 重新刷新表格
         [self.tableView reloadData];

         // 让刷新控件停止刷新（恢复默认的状态）
         [refreshControl endRefreshing];
         
         // 提示用户最新的微博数量
         [self showNewStatusesCount:newFrames.count];
    } failure:^(NSError *error) {
         HMLog(@"请求失败--%@", error);
         // 让刷新控件停止刷新（恢复默认的状态）
         [refreshControl endRefreshing];
    }];
}

/**
 *  加载更多的微博数据
 */
- (void)loadMoreStatuses
{
    // 1.封装请求参数
    HMHomeStatusesParam *param = [HMHomeStatusesParam param];
    HMStatusFrame *lastStatusFrame =  [self.statusFrames lastObject];
    HMStatus *lastStatus = lastStatusFrame.status;
    if (lastStatus) {
        param.max_id = @([lastStatus.idstr longLongValue] - 1);
    }
    
    // 2.加载微博数据
    [HMStatusTool homeStatusesWithParam:param success:^(HMHomeStatusesResult *result) {
        // 获得最新的微博frame数组
        NSArray *newFrames = [self statusFramesWithStatuses:result.statuses];

         // 将新数据插入到旧数据的最后面
         [self.statusFrames addObjectsFromArray:newFrames];

         // 重新刷新表格
         [self.tableView reloadData];

         // 让刷新控件停止刷新（恢复默认的状态）
         [self.footer endRefreshing];
    } failure:^(NSError *error) {
        HMLog(@"请求失败--%@", error);
        // 让刷新控件停止刷新（恢复默认的状态）
        [self.footer endRefreshing];
    }];
}

/**
 *  提示用户最新的微博数量
 *
 *  @param count 最新的微博数量
 */
- (void)showNewStatusesCount:(int)count
{
    // 0.清零提醒数字
    [UIApplication sharedApplication].applicationIconBadgeNumber -= self.tabBarItem.badgeValue.intValue;
    self.tabBarItem.badgeValue = nil;
    
    // 1.创建一个UILabel
    UILabel *label = [[UILabel alloc] init];
    
    // 2.显示文字
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%d条新的微博数据", count];
    } else {
        label.text = @"没有最新的微博数据";
    }
    
    // 3.设置背景
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"timeline_new_status_background"]];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    // 4.设置frame
    label.width = self.view.width;
    label.height = 35;
    label.x = 0;
    label.y = 64 - label.height;
    
    // 5.添加到导航控制器的view
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    // 6.动画
    CGFloat duration = 0.75;
    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
    } completion:^(BOOL finished) { // 向下移动完毕
        
        // 延迟delay秒后，再执行动画
        CGFloat delay = 1.0;
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            // 恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
            // 删除控件
            [label removeFromSuperview];
        }];
    }];
}

#pragma mark - 弹出菜单协议
- (void)popMenuDidDismissed:(HMPopMenu *)popMenu
{
    HMTitleButton *titleButton = (HMTitleButton *)self.navigationItem.titleView;
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

#pragma mark - 私有方法
/**
 *  点击标题点击
 */
- (void)titleClick:(UIButton *)titleButton
{
    // 换成箭头向上
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    // 弹出菜单
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor blueColor];
    
    HMPopMenu *menu = [[HMPopMenu alloc ] initWithContentView:nil];
    menu.delegate = self;
    menu.arrowPosition = HMPopMenuArrowPositionCenter;
    //    menu.dimBackground = YES;
    [menu showInRect:CGRectMake(100, 0, 200, 480)];
}

/**
 *  点击了遮盖
 */
- (void)coverClick
{
    HMLog(@"coverClick---");
}

- (void)friendSearch
{
    HMLog(@"friendSearch---");
    
    HMOneViewController *one = [[HMOneViewController alloc] init];
    one.title = @"OneVc";
      JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:one];
     firstNav.fullScreenPopGestureEnabled = YES;
    [self.navigationController pushViewController:one animated:YES];
}

- (void)pop
{
    HMLog(@"pop---");
    
    [self.titleButton setTitle:@"哈哈哈" forState:UIControlStateNormal];
}

#pragma mark - Table view 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning 为什么写在这里：为了监听tableView每次显示数据的过程
    self.footer.hidden = self.statusFrames.count == 0;
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMStatusCell *cell = [HMStatusCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

#pragma mark - tableView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc = [[UIViewController alloc] init];
    newVc.view.backgroundColor = [UIColor redColor];
    newVc.title = @"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statusFrames.count <= 0 || self.footer.isRefreshing) return;
    
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = self.view.height - self.tabBarController.tabBar.height;
    
    // 2.如果能看见整个footer
    if (delta <= (sawFooterH - 0)) {
        // 进入上拉刷新状态
        [self.footer beginRefreshing];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 加载更多的微博数据
            [self loadMoreStatuses];
        });
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMStatusFrame *frame = self.statusFrames[indexPath.row];
    return frame.cellHeight;
}
@end
