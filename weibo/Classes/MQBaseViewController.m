//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQBaseViewController.h"

@interface MQBaseViewController ()

@end

@implementation MQBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)more
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
