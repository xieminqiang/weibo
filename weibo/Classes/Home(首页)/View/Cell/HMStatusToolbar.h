//
//  HMStatusToolbar.h
//  黑马微博
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 heima. All rights reserved.
//  封装底部的工具条

#import <UIKit/UIKit.h>
@class HMStatus;

@interface HMStatusToolbar : UIImageView
@property (nonatomic, assign) HMStatus *status;
@end
