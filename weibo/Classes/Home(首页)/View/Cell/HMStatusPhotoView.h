//
//  HMStatusPhotoView.h
//  黑马微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//  一个HMStatusPhotoView代表1张配图

#import <UIKit/UIKit.h>
@class HMPhoto;
@interface HMStatusPhotoView : UIImageView
@property (nonatomic, strong) HMPhoto *photo;
@end
