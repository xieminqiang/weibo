//
//  HMHomeStatusesResult.m
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MQHomeStatusesResult.h"
#import "MJExtension.h"
#import "MQStatus.h"

@implementation MQHomeStatusesResult
- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [MQStatus class]};
}
@end
