//
//  AppDelegate.m
//  weibo
//
//  Created by 谢明强 on 15/10/26.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "AppDelegate.h"
#import "MQOAuthViewController.h"
#import "MQControllerTool.h"
#import "MQAccountTool.h"
#import "MQAccount.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"
//#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "MQNewfeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:1.0];
    application.statusBarHidden = NO;
    self.window = [[UIWindow alloc] init];
    self.window.frame= [UIScreen mainScreen].bounds;
    [self.window makeKeyAndVisible];
    MQAccount *account = [MQAccountTool account];
    if (account) {
        [MQControllerTool chooseRootViewController];
    } else { // 没有登录过
           self.window.rootViewController = [[MQOAuthViewController alloc] init];
    }
    // NSString *versionKey = @"CFBundleVersion";
    //    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    NSString *lastVersion = [defaults objectForKey:versionKey];
    //      NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    //    if ([lastVersion isEqualToString:currentVersion])  {
    // MQNewfeatureViewController *new = [[MQNewfeatureViewController alloc] init];
    //           //    }
    //
    //    ;

// self.window.rootViewController =[[MQNewfeatureViewController alloc] init];

    return YES;
}

/**
 *  程序进入后台的时候调用
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // 提醒操作系统：当前这个应用程序需要在后台开启一个任务
    // 操作系统会允许这个应用程序在后台保持运行状态（能够持续的时间是不确定）
    UIBackgroundTaskIdentifier taskID = [application beginBackgroundTaskWithExpirationHandler:^{
        // 后台运行的时间到期了，就会自动调用这个block
        [application endBackgroundTask:taskID];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // 赶紧清除所有的内存缓存
    [[SDImageCache sharedImageCache] clearMemory];

    // 赶紧停止正在进行的图片下载操作
    [[SDWebImageManager sharedManager] cancelAll];
}
@end
