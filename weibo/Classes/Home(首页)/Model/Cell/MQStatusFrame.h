//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  一个frame包括一个cell内部所有子控件的fame数据和显示数据

#import <Foundation/Foundation.h>
@class MQStatus, MQStatusDetailFrame;

@interface MQStatusFrame : NSObject
/** 子控件的frame数据 */
@property (nonatomic, assign) CGRect toolbarFrame;
@property (nonatomic, strong) MQStatusDetailFrame *detailFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 微博数据 */
@property (nonatomic, strong) MQStatus *status;
@end
