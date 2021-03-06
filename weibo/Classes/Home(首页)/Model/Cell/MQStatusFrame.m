//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQStatusFrame.h"
#import "MQStatus.h"
#import "MQStatusDetailFrame.h"

@implementation MQStatusFrame

- (void)setStatus:(MQStatus *)status
{
    _status = status;
    
    // 1.计算微博具体内容（微博整体）
    [self setupDetailFrame];
    
    // 2.计算底部工具条
    [self setupToolbarFrame];
    
    // 3.计算cell的高度
    self.cellHeight = CGRectGetMaxY(self.toolbarFrame);
}

/**
 *  计算微博具体内容（微博整体）
 */
- (void)setupDetailFrame
{
    MQStatusDetailFrame *detailFrame = [[MQStatusDetailFrame alloc] init];
    detailFrame.status = self.status;
    self.detailFrame = detailFrame;
}

/**
 *  计算底部工具条
 */
- (void)setupToolbarFrame
{
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.detailFrame.frame);
    CGFloat toolbarW = HMScreenW;
    CGFloat toolbarH = 35;
    self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
}

@end
