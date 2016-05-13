//
//  HMStatusRetweetedView.m
//  黑马微博
//
//  Created by apple on 14-7-14.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MQStatusRetweetedView.h"
#import "MQStatusRetweetedFrame.h"
#import "MQStatus.h"
#import "MQUser.h"
#import "MQStatusPhotosView.h"

@interface MQStatusRetweetedView()
/**  昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *textLabel;
/** 配图相册 */
@property (nonatomic, weak) MQStatusPhotosView *photosView;
@end

@implementation MQStatusRetweetedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImage:@"timeline_retweet_background"];
        
        // 1.昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = HMColor(74, 102, 105);
        nameLabel.font = HMStatusRetweetedNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 2.正文（内容）
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = HMStatusRetweetedTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // 3.配图相册
        MQStatusPhotosView *photosView = [[MQStatusPhotosView alloc] init];
        [self addSubview:photosView];
        self.photosView = photosView;
    }
    return self;
}

- (void)setRetweetedFrame:(MQStatusRetweetedFrame *)retweetedFrame
{
    _retweetedFrame = retweetedFrame;
    
    self.frame = retweetedFrame.frame;
    
    // 取出微博数据
    MQStatus *retweetedStatus = retweetedFrame.retweetedStatus;
    // 取出用户数据
    MQUser *user = retweetedStatus.user;
    
    // 1.昵称
    self.nameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.nameLabel.frame = retweetedFrame.nameFrame;
    
    // 2.正文（内容）
    self.textLabel.text = retweetedStatus.text;
    self.textLabel.frame = retweetedFrame.textFrame;
    
    // 3.配图相册
    if (retweetedStatus.pic_urls.count) { // 有配图
        self.photosView.frame = retweetedFrame.photosFrame;
        self.photosView.pic_urls = retweetedStatus.pic_urls;
        self.photosView.hidden = NO;
    } else {
        self.photosView.hidden = YES;
    }
}

@end