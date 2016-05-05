//
//  MQSearchBar.m
//  微博测试
//
//  Created by 谢明强 on 15/10/29.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "MQSearchBar.h"

@implementation MQSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizedImage:@"searchbar_textfield_background"];

        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //设置放大镜
        UIImageView *leftImage = [[UIImageView alloc] init];
        leftImage.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        leftImage.width = leftImage.image.size.width + 10;
        leftImage.height = leftImage.image.size.height;
        leftImage.contentMode = UIViewContentModeCenter;
        self.leftViewMode = UITextFieldViewModeAlways;
        //右边显示x（清除）
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.leftView = leftImage;
    }
    return self;
}

+ (instancetype)searchBar{
 return [[self alloc] init];
    
}

@end
