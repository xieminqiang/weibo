//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <UIKit/UIKit.h>

@interface MQLoadMoreFooter : UIView
+ (instancetype)footer;

- (void)beginRefreshing;
- (void)endRefreshing;

@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;
@end
