//
//  HMEmotionGridView.m
//  黑马微博
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMEmotionGridView.h"
#import "MQEmotion.h"
#import "HMEmotionView.h"
#import "HMEmotionPopView.h"
#import "HMEmotionTool.h"

@interface HMEmotionGridView()
@property (nonatomic, weak) UIButton *deleteButton;
@property (nonatomic, strong) NSMutableArray *emotionViews;
@property (nonatomic, strong) HMEmotionPopView *popView;
@end

@implementation HMEmotionGridView

- (HMEmotionPopView *)popView
{
    if (!_popView) {
        self.popView = [HMEmotionPopView popView];
    }
    return _popView;
}

- (NSMutableArray *)emotionViews
{
    if (!_emotionViews) {
        self.emotionViews = [NSMutableArray array];
    }
    return _emotionViews;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加删除按钮
        UIButton *deleteButton = [[UIButton alloc] init];
        [deleteButton setImage:[UIImage imageWithName:@"compose_emotion_delete"] forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageWithName:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
        [deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
        
        // 给自己添加一个长按手势识别器
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] init];
        [recognizer addTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

/**
 *  根据触摸点返回对应的表情控件
 */
- (HMEmotionView *)emotionViewWithPoint:(CGPoint)point
{
    __block HMEmotionView *foundEmotionView = nil;
    [self.emotionViews enumerateObjectsUsingBlock:^(HMEmotionView *emotionView, NSUInteger idx, BOOL *stop) {
        if (CGRectContainsPoint(emotionView.frame, point)) {
            foundEmotionView = emotionView;
            // 停止遍历
            *stop = YES;
        }
    }];
    return foundEmotionView;
}

/**
 *  触发了长按手势
 */
- (void)longPress:(UILongPressGestureRecognizer *)recognizer
{
    // 1.捕获触摸点
    CGPoint point = [recognizer locationInView:recognizer.view];
    
    // 2.检测触摸点落在哪个表情上
    HMEmotionView *emotionView = [self emotionViewWithPoint:point];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) { // 手松开了
        // 移除表情弹出控件
        [self.popView dismiss];
        
        // 选中表情
        [self selecteEmotion:emotionView.emotion];
    } else { // 手没有松开
        // 显示表情弹出控件
        [self.popView showFromEmotionView:emotionView];
    }
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    // 添加新的表情
    int count = emotions.count;
    int currentEmotionViewCount = self.emotionViews.count;
    for (int i = 0; i<count; i++) {
        HMEmotionView *emotionView = nil;
        
        if (i >= currentEmotionViewCount) { // emotionView不够用
            emotionView = [[HMEmotionView alloc] init];
//            emotionView.backgroundColor = HMRandomColor;
            [emotionView addTarget:self action:@selector(emotionClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:emotionView];
            [self.emotionViews addObject:emotionView];
        } else { // emotionView够用
            emotionView = self.emotionViews[i];
        }
        // 传递模型数据
        emotionView.emotion = emotions[i];
        emotionView.hidden = NO;
    }
    
    // 隐藏多余的emotionView
    for (int i = count; i<currentEmotionViewCount; i++) {
        UIButton *emotionView = self.emotionViews[i];
        emotionView.hidden = YES;
    }
}

/**
 *  监听表情的单击
 */
- (void)emotionClick:(HMEmotionView *)emotionView
{
    [self.popView showFromEmotionView:emotionView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.popView dismiss];
    });
    
    // 选中表情
    [self selecteEmotion:emotionView.emotion];
}

/**
 *  选中表情
 */
- (void)selecteEmotion:(MQEmotion *)emotion
{
    if (emotion == nil) return;
#warning 注意：先添加使用的表情，再发通知
    // 保存使用记录
    [HMEmotionTool addRecentEmotion:emotion];
    
    // 发出一个选中表情的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:HMEmotionDidSelectedNotification object:nil userInfo:@{HMSelectedEmotion : emotion}];
}

/**
 *  点击了删除按钮
 */
- (void)deleteClick
{
    // 发出一个选中表情的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:HMEmotionDidDeletedNotification object:nil userInfo:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat leftInset = 15;
    CGFloat topInset = 15;
    
    // 1.排列所有的表情
    int count = self.emotionViews.count;
    CGFloat emotionViewW = (self.width - 2 * leftInset) / HMEmotionMaxCols;
    CGFloat emotionViewH = (self.height - topInset) / HMEmotionMaxRows;
    for (int i = 0; i<count; i++) {
        UIButton *emotionView = self.emotionViews[i];
        emotionView.x = leftInset + (i % HMEmotionMaxCols) * emotionViewW;
        emotionView.y = topInset + (i / HMEmotionMaxCols) * emotionViewH;
        emotionView.width = emotionViewW;
        emotionView.height = emotionViewH;
    }
    
    // 2.删除按钮
    self.deleteButton.width = emotionViewW;
    self.deleteButton.height = emotionViewH;
    self.deleteButton.x = self.width - leftInset - self.deleteButton.width;
    self.deleteButton.y = self.height - self.deleteButton.height;
}

@end
