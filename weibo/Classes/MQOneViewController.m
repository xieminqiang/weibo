//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQOneViewController.h"
#import "MQTwoViewController.h"
#import "UIViewController+JTNavigationExtension.h"

@interface MQOneViewController ()
- (IBAction)jumpTwo;

@end

@implementation MQOneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(jumpTwo)];





//    self.jt_fullScreenPopGestureEnabled =YES; //关闭当前控制器的全屏返回手势
}
- (IBAction)jumpTwo {
    MQTwoViewController *two = [[MQTwoViewController alloc] init];
    two.title = @"TwoVc";
    [self.navigationController pushViewController:two animated:YES];
}

@end
