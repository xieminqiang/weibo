//
//  HMTabBar.h
//  黑马微博
//
//  Created by apple on 14-7-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MQTabBar;

@protocol HMTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(MQTabBar *)tabBar;

@end

@interface MQTabBar : UITabBar
@property (nonatomic, weak) id<HMTabBarDelegate> tabBarDelegate;
@end
