//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#define HMAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

#import "MQAccountTool.h"
#import "MQAccount.h"

@implementation MQAccountTool

+ (void)save:(MQAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:HMAccountFilepath];
}

+ (MQAccount *)account
{
    // 读取帐号
    MQAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HMAccountFilepath];
    
    // 判断帐号是否已经过期
    NSDate *now = [NSDate date];

    if ([now compare:account.expires_time] != NSOrderedAscending) { // 过期
        account = nil;
    }
    return account;
}

+ (void)accessTokenWithParam:(MQAccessTokenParam *)param success:(void (^)(MQAccount *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/oauth2/access_token" param:param resultClass:[MQAccount class] success:success failure:failure];
}
@end
