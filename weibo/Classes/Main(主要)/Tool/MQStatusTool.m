//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQStatusTool.h"
#import "MQHttpTool.h"
#import "MJExtension.h"

@implementation MQStatusTool

+ (void)homeStatusesWithParam:(MQHomeStatusesParam *)param success:(void (^)(MQHomeStatusesResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" param:param resultClass:[MQHomeStatusesResult class] success:success failure:failure];
}

+ (void)sendStatusWithParam:(MQSendStatusParam *)param success:(void (^)(MQSendStatusResult *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/2/statuses/update.json" param:param resultClass:[MQSendStatusResult class] success:success failure:failure];
}

@end
