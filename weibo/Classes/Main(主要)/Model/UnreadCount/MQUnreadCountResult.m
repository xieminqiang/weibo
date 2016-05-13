//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQUnreadCountResult.h"

@implementation MQUnreadCountResult

- (int)messageCount
{
    return self.cmt + self.dm + self.mention_cmt + self.mention_status;
}

- (int)totalCount
{
    return self.messageCount + self.status + self.follower;
}

@end
