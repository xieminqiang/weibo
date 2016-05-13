//
//  HMStatusDetailFrame.h
//  黑马微博
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MQStatus, MQStatusOriginalFrame, MQStatusRetweetedFrame;

@interface MQStatusDetailFrame : NSObject
@property (nonatomic, strong) MQStatusOriginalFrame *originalFrame;
@property (nonatomic, strong) MQStatusRetweetedFrame *retweetedFrame;

/** 微博数据 */
@property (nonatomic, strong) MQStatus *status;

/**
 *  自己的frame
 */
@property (nonatomic, assign) CGRect frame;
@end
