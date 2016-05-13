//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQUser.h"

@implementation MQUser

- (BOOL)isVip
{
    // 是会员
    return self.mbtype > 2;
}

@end
