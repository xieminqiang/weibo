//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQStatusDetailView.h"
#import "MQStatusRetweetedView.h"
#import "MQStatusOriginalView.h"
#import "MQStatusDetailFrame.h"

@interface MQStatusDetailView()
@property (nonatomic, weak) MQStatusOriginalView *originalView;
@property (nonatomic, weak) MQStatusRetweetedView *retweetedView;
@end

@implementation MQStatusDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) { // 初始化子控件
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImage:@"timeline_card_top_background"];
        
        // 1.添加原创微博
        MQStatusOriginalView *originalView = [[MQStatusOriginalView alloc] init];
        [self addSubview:originalView];
        self.originalView = originalView;
        
        // 2.添加转发微博
        MQStatusRetweetedView *retweetedView = [[MQStatusRetweetedView alloc] init];
        [self addSubview:retweetedView];
        self.retweetedView = retweetedView;
    }
    return self;
}

- (void)setDetailFrame:(MQStatusDetailFrame *)detailFrame
{
    _detailFrame = detailFrame;
    
    self.frame = detailFrame.frame;
    
    // 1.原创微博的frame数据
    self.originalView.originalFrame = detailFrame.originalFrame;
    
    // 2.原创转发的frame数据
    self.retweetedView.retweetedFrame = detailFrame.retweetedFrame;
}

@end
