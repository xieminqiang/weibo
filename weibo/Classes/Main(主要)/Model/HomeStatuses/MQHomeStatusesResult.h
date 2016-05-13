//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  封装加载首页微博数据的返回结果

#import <Foundation/Foundation.h>

@interface MQHomeStatusesResult : NSObject
/** 微博数组（装着HMStatus模型） */
@property (nonatomic, strong) NSArray *statuses;

/** 近期的微博总数 */
@property (nonatomic, assign) int total_number;
@end
