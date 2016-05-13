//
//  HMStatusPhotosView.m
//  黑马微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMStatusPhotosView.h"
#import "HMStatusPhotoView.h"
#import "UIImageView+WebCache.h"
#import "HMPhoto.h"

#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

#define HMStatusPhotosMaxCount 9
#define HMStatusPhotosMaxCols(photosCount) ((photosCount==4)?2:3)
#define HMStatusPhotoW 70
#define HMStatusPhotoH HMStatusPhotoW
#define HMStatusPhotoMargin 10

@interface HMStatusPhotosView()
@end

@implementation HMStatusPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 预先创建9个图片控件
        for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
            HMStatusPhotoView *photoView = [[HMStatusPhotoView alloc] init];
            photoView.tag = i;
            [self addSubview:photoView];
            
            // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(tapPhoto:)];
            [photoView addGestureRecognizer:recognizer];
        }
    }
    return self;
}

/**
 *  监听图片的点击
 */
- (void)tapPhoto:(UITapGestureRecognizer *)recognizer
{
    // 1.创建图片浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    
    // 2.设置图片浏览器显示的所有图片
    NSMutableArray *photos = [NSMutableArray array];
    int count = self.pic_urls.count;
    for (int i = 0; i<count; i++) {
        HMPhoto *pic = self.pic_urls[i];
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        // 设置图片的路径
        photo.url = [NSURL URLWithString:pic.bmiddle_pic];
        // 设置来源于哪一个UIImageView
        photo.srcImageView = self.subviews[i];
        [photos addObject:photo];
    }
    browser.photos = photos;
    
    // 3.设置默认显示的图片索引
    browser.currentPhotoIndex = recognizer.view.tag;
    
    // 3.显示浏览器
    [browser show];
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;
    
    for (int i = 0; i<HMStatusPhotosMaxCount; i++) {
        HMStatusPhotoView *photoView = self.subviews[i];
        
        if (i < pic_urls.count) { // 显示图片
            photoView.photo = pic_urls[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.pic_urls.count;
    int maxCols = HMStatusPhotosMaxCols(count);
    for (int i = 0; i<count; i++) {
        HMStatusPhotoView *photoView = self.subviews[i];
        photoView.width = HMStatusPhotoW;
        photoView.height = HMStatusPhotoH;
        photoView.x = (i % maxCols) * (HMStatusPhotoW + HMStatusPhotoMargin);
        photoView.y = (i / maxCols) * (HMStatusPhotoH + HMStatusPhotoMargin);
    }
}

+ (CGSize)sizeWithPhotosCount:(int)photosCount
{
    int maxCols = HMStatusPhotosMaxCols(photosCount);
    
    // 总列数
    int totalCols = photosCount >= maxCols ?  maxCols : photosCount;
    
    // 总行数
    int totalRows = (photosCount + maxCols - 1) / maxCols;
    
    // 计算尺寸
    CGFloat photosW = totalCols * HMStatusPhotoW + (totalCols - 1) * HMStatusPhotoMargin;
    CGFloat photosH = totalRows * HMStatusPhotoH + (totalRows - 1) * HMStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
