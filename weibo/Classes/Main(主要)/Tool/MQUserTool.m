//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQUserTool.h"
#import "MJExtension.h"
#import "MQHttpTool.h"

@implementation MQUserTool
+ (void)userInfoWithParam:(MQUserInfoParam *)param success:(void (^)(MQUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[MQUserInfoResult class] success:success failure:failure];
}

+ (void)unreadCountWithParam:(MQUnreadCountParam *)param success:(void (^)(MQUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:param resultClass:[MQUnreadCountResult class] success:success failure:failure];
}
@end
