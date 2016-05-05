//
//  MQTabBarViewController.m
//  微博测试
//
//  Created by 谢明强 on 15/10/26.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "MQTabBarViewController.h"
#import "MQDiscoverViewController.h"
#import "MQHomeViewController.h"
#import "MQMessageViewController.h"
#import "MQProfileViewController.h"
#import "UIImage+MQimage.h"
#import "MQNavigationViewController.h"


@interface MQTabBarViewController ()

@end

@implementation MQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MQHomeViewController *home = [[MQHomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:[UIImage imageNamed:@"tabbar_home"] SelectedImageName:[UIImage imageWithNamed:@"tabbar_home_selected"]];

    MQMessageViewController *message = [[MQMessageViewController alloc]init];
    [self addOneChildVc:message title:@"消息" imageName:[UIImage imageNamed:@"tabbar_message_center"] SelectedImageName:[UIImage imageWithNamed:@"tabbar_message_center_selected"]];
    MQDiscoverViewController *discover = [[MQDiscoverViewController alloc] init];
    [self addOneChildVc:discover title:@"发现" imageName:[UIImage imageNamed:@"tabbar_discover"] SelectedImageName:[UIImage imageWithNamed:@"tabbar_discover_selected"]];
    MQProfileViewController *profile = [[MQProfileViewController alloc] init];
    [self addOneChildVc:profile title:@"我" imageName:[UIImage imageWithNamed:@"tabbar_profile"] SelectedImageName:[UIImage imageWithNamed:@"tabbar_profile_selected"]];
}
- (void)addOneChildVc:(UIViewController *)ChildVc title:(NSString *)title imageName:(UIImage *)imageName SelectedImageName:(UIImage *)SelectedImageName {
    // ChildVc.view.backgroundColor = MQrandomColor;

    ChildVc.title = title;
    ChildVc.tabBarItem.image = imageName;
     ChildVc.tabBarItem.selectedImage = SelectedImageName;
    MQNavigationViewController *navVc = [[MQNavigationViewController alloc] initWithRootViewController:ChildVc];
    [self addChildViewController: navVc];

}


@end
