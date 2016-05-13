//
//  HMBaseParam.m
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MQBaseParam.h"
#import "MQAccountTool.h"
#import "MQAccount.h"

@implementation MQBaseParam
- (id)init
{
    if (self = [super init]) {
        self.access_token = [MQAccountTool account].access_token;
    }
    return self;
}

+ (instancetype)param
{
    return [[self alloc] init];
}
@end
