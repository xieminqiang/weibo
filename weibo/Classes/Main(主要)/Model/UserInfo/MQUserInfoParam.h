//
//  MQUserInfoParam.h
//  weibo
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2015年 weibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQBaseParam.h"

@interface MQUserInfoParam : MQBaseParam
/** false	int64	需要查询的用户ID。*/
@property (nonatomic, copy) NSString *uid;
@end
