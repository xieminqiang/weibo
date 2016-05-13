//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <Foundation/Foundation.h>
#import "MQUserInfoParam.h"
#import "MQUserInfoResult.h"
#import "MQUnreadCountParam.h"
#import "MQUnreadCountResult.h"
#import "MQBaseTool.h"

@interface MQUserTool : MQBaseTool
/**
 *  加载用户的个人信息
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)userInfoWithParam:(MQUserInfoParam *)param success:(void (^)(MQUserInfoResult *result))success failure:(void (^)(NSError *error))failure;

+ (void)unreadCountWithParam:(MQUnreadCountParam *)param success:(void (^)(MQUnreadCountResult *result))success failure:(void (^)(NSError *error))failure;
@end
