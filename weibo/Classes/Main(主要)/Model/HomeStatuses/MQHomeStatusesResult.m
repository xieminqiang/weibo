//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQHomeStatusesResult.h"
#import "MJExtension.h"
#import "MQStatus.h"

@implementation MQHomeStatusesResult
- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [MQStatus class]};
}
@end
