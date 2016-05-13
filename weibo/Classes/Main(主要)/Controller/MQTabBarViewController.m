//
//  HMTabBarViewController.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MQTabBarViewController.h"
#import "MQHomeViewController.h"
#import "MQMessageViewController.h"
#import "HMDiscoverViewController.h"
#import "MQProfileViewController.h"
#import "MQNavigationController.h"
#import "MQTabBar.h"
#import "MQComposeViewController.h"
#import "MQUserTool.h"
#import "MQAccount.h"
#import "MQAccountTool.h"
#import "JTNavigationController.h"
#import "MQOneViewController.h"
#import "JTViewController.h"

@interface MQTabBarViewController () <HMTabBarDelegate, UITabBarControllerDelegate>
@property (nonatomic, weak) MQHomeViewController *home;
@property (nonatomic, weak) MQMessageViewController *message;
@property (nonatomic, weak) MQProfileViewController *profile;
@property (nonatomic, weak) UIViewController *lastSelectedViewContoller;
@end

@implementation MQTabBarViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
    // 创建自定义tabbar
    [self addCustomTabBar];
    
    // 利用定时器获得用户的未读数
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getUnreadCount) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
{
    UIViewController *vc = [viewController.viewControllers firstObject];
    if ([vc isKindOfClass:[MQHomeViewController class]]) {
        if (self.lastSelectedViewContoller == vc) {
            [self.home refresh:YES];
        } else {
            [self.home refresh:NO];
        }
    }
    
    self.lastSelectedViewContoller = vc;
}

- (void)getUnreadCount
{
    // 1.请求参数
    MQUnreadCountParam *param = [MQUnreadCountParam param];
    param.uid = [MQAccountTool account].uid;
    
    // 2.获得未读数
    [MQUserTool unreadCountWithParam:param success:^(MQUnreadCountResult *result) {
        // 显示微博未读数
        if (result.status == 0) {
            self.home.tabBarItem.badgeValue = nil;
        } else {
            self.home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
        }
        
        // 显示消息未读数
        if (result.messageCount == 0) {
            self.message.tabBarItem.badgeValue = nil;
        } else {
            self.message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.messageCount];
        }
        
        // 显示新粉丝数
        if (result.follower == 0) {
            self.profile.tabBarItem.badgeValue = nil;
        } else {
            self.profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
        }
        
        // 在图标上显示所有的未读数
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
        HMLog(@"总未读数--%d", result.totalCount);
    } failure:^(NSError *error) {
        HMLog(@"获得未读数失败---%@", error);
    }];
}

/**
 *  创建自定义tabbar
 */
- (void)addCustomTabBar
{
    // 创建自定义tabbar
    MQTabBar *customTabBar = [[MQTabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    MQHomeViewController *home = [[MQHomeViewController alloc] init];
    [self addOneChlildVc:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];

    self.home = home;
    self.lastSelectedViewContoller = home;

    MQMessageViewController *message = [[MQMessageViewController alloc] init];
    [self addOneChlildVc:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
   self.message = message;


    HMDiscoverViewController *discover = [[HMDiscoverViewController alloc] init];
    [self addOneChlildVc:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    MQProfileViewController *profile = [[MQProfileViewController alloc] init];
    [self addOneChlildVc:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.profile = profile;


}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    MQNavigationController *nav = [[MQNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

#pragma mark - HMTabBarDelegate
- (void)tabBarDidClickedPlusButton:(MQTabBar *)tabBar
{
    // 弹出发微博控制器
    MQComposeViewController *compose = [[MQComposeViewController alloc] init];
    MQNavigationController *nav = [[MQNavigationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}
@end