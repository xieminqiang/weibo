//
//  HMUserInfoParam.h
//  黑马微博
//
//  Created by apple on 14-7-11.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQBaseParam.h"

@interface MQUserInfoParam : HMBaseParam
/** false	int64	需要查询的用户ID。*/
@property (nonatomic, copy) NSString *uid;
@end
