//
//  UIImage+MQimage.h
//  微博
//
//  Created by 谢明强 on 15/10/26.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MQimage)
+ (instancetype)imageWithNamed:(NSString *)imagename;
+ (instancetype)resizedImage:(NSString *)name;
@end