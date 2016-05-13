//
//  HMStatusDetailFrame.h
//  黑马微博
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMStatus, HMStatusOriginalFrame, HMStatusRetweetedFrame;

@interface HMStatusDetailFrame : NSObject
@property (nonatomic, strong) HMStatusOriginalFrame *originalFrame;
@property (nonatomic, strong) HMStatusRetweetedFrame *retweetedFrame;

/** 微博数据 */
@property (nonatomic, strong) HMStatus *status;

/**
 *  自己的frame
 */
@property (nonatomic, assign) CGRect frame;
@end
