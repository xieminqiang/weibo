//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQPhoto.h"

@implementation MQPhoto
- (void)setThumbnail_pic:(NSString *)thumbnail_pic
{
    _thumbnail_pic = [thumbnail_pic copy];
    
    self.bmiddle_pic = [thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
}
@end
