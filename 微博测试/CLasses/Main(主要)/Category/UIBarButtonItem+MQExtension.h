//
//  UIBarButtonItem+MQExtension.h
//  微博测试
//
//  Created by 谢明强 on 15/10/28.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MQExtension)
+ (UIBarButtonItem *)itemWithnorImage:(UIImage *)norImage heighImage:(UIImage *)heightimage targer:(id)targer action:(SEL)actoion;
@end
