//
//  HMOneViewController.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
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
