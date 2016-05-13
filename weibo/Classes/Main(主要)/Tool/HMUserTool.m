//
//  HMUserTool.m
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMUserTool.h"
#import "MJExtension.h"
#import "MQHttpTool.h"

@implementation HMUserTool
+ (void)userInfoWithParam:(HMUserInfoParam *)param success:(void (^)(HMUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[HMUserInfoResult class] success:success failure:failure];
}

+ (void)unreadCountWithParam:(HMUnreadCountParam *)param success:(void (^)(HMUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:param resultClass:[HMUnreadCountResult class] success:success failure:failure];
}
@end
