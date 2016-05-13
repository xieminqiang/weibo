//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  微博cell

#import <UIKit/UIKit.h>
@class MQStatusFrame;

@interface MQStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) MQStatusFrame *statusFrame;
@end
