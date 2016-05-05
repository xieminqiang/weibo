//
//  UIImage+MQimage.m
//  微博
//
//  Created by 谢明强 on 15/10/26.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "UIImage+MQimage.h"

@implementation UIImage (MQimage)
+ (instancetype)imageWithNamed:(NSString *)imagename{
    UIImage *image = [UIImage imageNamed:imagename];
    return [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];


}
+ (instancetype)resizedImage:(NSString *)name {

    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
