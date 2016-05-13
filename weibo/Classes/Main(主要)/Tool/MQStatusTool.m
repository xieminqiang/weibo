//
//  HMStatusTool.m
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
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
