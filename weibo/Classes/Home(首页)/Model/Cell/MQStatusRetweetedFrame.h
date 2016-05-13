//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <Foundation/Foundation.h>
@class MQStatus;
@interface MQStatusRetweetedFrame : NSObject
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 配图相册  */
@property (nonatomic, assign) CGRect photosFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;

/** 转发微博的数据 */
@property (nonatomic, strong) MQStatus *retweetedStatus;
@end
