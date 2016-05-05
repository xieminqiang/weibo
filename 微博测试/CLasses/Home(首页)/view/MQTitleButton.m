//
//  MQTitleButton.m
//  微博测试
//
//  Created by 谢明强 on 15/10/29.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "MQTitleButton.h"

@implementation MQTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = MQBodyfont;
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        self.titleLabel.textAlignment =  NSTextAlignmentRight;

       self.imageView.contentMode = UIViewContentModeCenter;
        
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.width- self.height;
    CGFloat height = self.height;
    return CGRectMake(x, y, width, height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat x = self.width- self.height;
    CGFloat y = 0;
    CGFloat width = self.height;
    CGFloat height = self.height;
    return CGRectMake(x, y, width, height);

}

@end
