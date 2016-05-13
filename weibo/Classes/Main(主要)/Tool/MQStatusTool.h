//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  微博业务类：处理跟微博相关的一切业务，比如加载微博数据、发微博、删微博

#import <Foundation/Foundation.h>
#import "MQHomeStatusesParam.h"
#import "MQHomeStatusesResult.h"
#import "MQSendStatusParam.h"
#import "MQSendStatusResult.h"
#import "MQBaseTool.h"

@interface MQStatusTool : MQBaseTool

/**
 *  加载首页的微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)homeStatusesWithParam:(MQHomeStatusesParam *)param success:(void (^)(MQHomeStatusesResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  发没有图片的微博
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)sendStatusWithParam:(MQSendStatusParam *)param success:(void (^)(MQSendStatusResult *result))success failure:(void (^)(NSError *error))failure;

@end
