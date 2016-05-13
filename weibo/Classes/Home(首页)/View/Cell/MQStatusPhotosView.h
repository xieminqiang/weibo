//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  微博cell里面的相册 -- 里面包含N个HMStatusPhotoView

#import <UIKit/UIKit.h>

@interface MQStatusPhotosView : UIView
/**
 *  图片数据（里面都是HMPhoto模型）
 */
@property (nonatomic, strong) NSArray *pic_urls;

/**
 *  根据图片个数计算相册的最终尺寸
 */
+ (CGSize)sizeWithPhotosCount:(int)photosCount;

@end
