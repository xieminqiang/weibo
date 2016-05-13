//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <Foundation/Foundation.h>
@class MQStatus, MQStatusOriginalFrame, MQStatusRetweetedFrame;

@interface MQStatusDetailFrame : NSObject
@property (nonatomic, strong) MQStatusOriginalFrame *originalFrame;
@property (nonatomic, strong) MQStatusRetweetedFrame *retweetedFrame;

/** 微博数据 */
@property (nonatomic, strong) MQStatus *status;

/**
 *  自己的frame
 */
@property (nonatomic, assign) CGRect frame;
@end
