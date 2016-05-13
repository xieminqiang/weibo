//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQMessageViewController.h"
#import "HMSearchBar.h"
#import "UIViewController+JTNavigationExtension.h"

@interface MQMessageViewController ()

@end

@implementation MQMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:self action:@selector(composeMsg)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    HMSearchBar *searchBar = [HMSearchBar searchBar];
    searchBar.width = 150;
    searchBar.height = 30;
    searchBar.x = 100;
    searchBar.y = 100;
    [self.view addSubview:searchBar];
//    self.jt_fullScreenPopGestureEnabled = YES;
}

/**
 *  写私信
 */
- (void)composeMsg
{
    HMLog(@"composeMsg");
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据----%d", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc = [[UIViewController alloc] init];
    newVc.view.backgroundColor = [UIColor blueColor];
    newVc.title = @"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}
@end
