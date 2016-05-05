//
//  UIBarButtonItem+MQExtension.m
//  微博测试
//
//  Created by 谢明强 on 15/10/28.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "UIBarButtonItem+MQExtension.h"

@implementation UIBarButtonItem (MQExtension)
+ (UIBarButtonItem *)itemWithnorImage:(UIImage *)norImage heighImage:(UIImage *)heightimage targer:(id)targer action:(SEL)actoion {
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:norImage forState:(UIControlStateNormal)];
    [button setBackgroundImage:heightimage forState:(UIControlStateHighlighted)];
    [button addTarget:targer action:actoion forControlEvents:(UIControlEventTouchUpInside)];
    //设置字体与当前图片一样大小
    button.size = button.currentBackgroundImage.size;
  return  [[UIBarButtonItem alloc] initWithCustomView:button];

}
@end
