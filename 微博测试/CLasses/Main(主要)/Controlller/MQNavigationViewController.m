//
//  MQNavigationViewController.m
//  微博测试
//
//  Created by 谢明强 on 15/10/26.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "MQNavigationViewController.h"

@interface MQNavigationViewController ()

@end

@implementation MQNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)initialize {

    [self setupBarButtonItemTheme];
    [self setupNavigationBarTheme];

}
+(void)setupBarButtonItemTheme {


    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    NSMutableDictionary *nordict = [NSMutableDictionary dictionary];
    nordict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    nordict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
     [appearance setTitleTextAttributes:nordict forState:(UIControlStateNormal)];


    NSMutableDictionary *heightdict = [NSMutableDictionary dictionary];
  heightdict[NSForegroundColorAttributeName] = [UIColor redColor];
  heightdict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:heightdict forState:(UIControlStateNormal)];
 NSMutableDictionary *disdict = [NSMutableDictionary dictionary];
    disdict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disdict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:disdict forState:(UIControlStateDisabled)];
}
+ (void)setupNavigationBarTheme {

    UINavigationBar *appearance = [UINavigationBar appearance];

    NSMutableDictionary *navdict = [NSMutableDictionary dictionary];
    navdict[NSForegroundColorAttributeName] = [UIColor blackColor];
    navdict[NSFontAttributeName] = MQBodyfont;
    [appearance setTitleTextAttributes:navdict];
}




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count >0) {

        viewController.hidesBottomBarWhenPushed = YES;


        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithnorImage:[UIImage imageWithNamed:@"navigationbar_back"] heighImage:[UIImage imageWithNamed:@"navigationbar_back_highlighted"] targer:self action:@selector(back)];

        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithnorImage:[UIImage imageWithNamed:@"navigationbar_more"] heighImage:[UIImage imageWithNamed:@"navigationbar_more_highlighted"] targer:self action:@selector(more)];
        NjLog(@"%@",self.navigationItem.leftBarButtonItem);
 
 }

    [super pushViewController:viewController animated:YES];
}

/**
 *  返回上一个控制器
 */
- (void)back {

    [self popViewControllerAnimated:YES];
}
/**
 *  返回目录
 */
- (void)more {


    [self popToRootViewControllerAnimated:YES];
}


@end
