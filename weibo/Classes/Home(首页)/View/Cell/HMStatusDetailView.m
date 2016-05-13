//
//  HMStatusDetailView.m
//  黑马微博
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMStatusDetailView.h"
#import "HMStatusRetweetedView.h"
#import "HMStatusOriginalView.h"
#import "HMStatusDetailFrame.h"

@interface HMStatusDetailView()
@property (nonatomic, weak) HMStatusOriginalView *originalView;
@property (nonatomic, weak) HMStatusRetweetedView *retweetedView;
@end

@implementation HMStatusDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) { // 初始化子控件
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImage:@"timeline_card_top_background"];
        
        // 1.添加原创微博
        HMStatusOriginalView *originalView = [[HMStatusOriginalView alloc] init];
        [self addSubview:originalView];
        self.originalView = originalView;
        
        // 2.添加转发微博
        HMStatusRetweetedView *retweetedView = [[HMStatusRetweetedView alloc] init];
        [self addSubview:retweetedView];
        self.retweetedView = retweetedView;
    }
    return self;
}

- (void)setDetailFrame:(HMStatusDetailFrame *)detailFrame
{
    _detailFrame = detailFrame;
    
    self.frame = detailFrame.frame;
    
    // 1.原创微博的frame数据
    self.originalView.originalFrame = detailFrame.originalFrame;
    
    // 2.原创转发的frame数据
    self.retweetedView.retweetedFrame = detailFrame.retweetedFrame;
}

@end
