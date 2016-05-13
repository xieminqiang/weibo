//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQStatusDetailFrame.h"
#import "MQStatus.h"
#import "MQStatusOriginalFrame.h"
#import "MQStatusRetweetedFrame.h"

@implementation MQStatusDetailFrame

- (void)setStatus:(MQStatus *)status
{
    _status = status;
    
    // 1.计算原创微博的frame
    MQStatusOriginalFrame *originalFrame = [[MQStatusOriginalFrame alloc] init];
    originalFrame.status = status;
    self.originalFrame = originalFrame;
    
    // 2.计算转发微博的frame
    CGFloat h = 0;
    if (status.retweeted_status) {
        MQStatusRetweetedFrame *retweetedFrame = [[MQStatusRetweetedFrame alloc] init];
        retweetedFrame.retweetedStatus = status.retweeted_status;
        
        // 计算转发微博frame的y值
        CGRect f = retweetedFrame.frame;
        f.origin.y = CGRectGetMaxY(originalFrame.frame);
        retweetedFrame.frame = f;
        
        self.retweetedFrame = retweetedFrame;
        
        h = CGRectGetMaxY(retweetedFrame.frame);
    } else {
        h = CGRectGetMaxY(originalFrame.frame);
    }
    
    // 自己的frame
    CGFloat x = 0;
    CGFloat y = HMStatusCellMargin;
    CGFloat w = HMScreenW;
    self.frame = CGRectMake(x, y, w, h);
}

@end
