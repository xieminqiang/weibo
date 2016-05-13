//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
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
