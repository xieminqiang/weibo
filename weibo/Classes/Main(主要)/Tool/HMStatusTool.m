//
//  HMStatusTool.m
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMStatusTool.h"
#import "MQHttpTool.h"
#import "MJExtension.h"

@implementation HMStatusTool

+ (void)homeStatusesWithParam:(HMHomeStatusesParam *)param success:(void (^)(HMHomeStatusesResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" param:param resultClass:[HMHomeStatusesResult class] success:success failure:failure];
}

+ (void)sendStatusWithParam:(HMSendStatusParam *)param success:(void (^)(HMSendStatusResult *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/2/statuses/update.json" param:param resultClass:[HMSendStatusResult class] success:success failure:failure];
}

@end
