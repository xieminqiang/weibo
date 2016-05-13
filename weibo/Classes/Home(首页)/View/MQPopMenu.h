//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  弹出菜单

#import <UIKit/UIKit.h>

typedef enum {
    HMPopMenuArrowPositionCenter = 0,
    HMPopMenuArrowPositionLeft = 1,
    HMPopMenuArrowPositionRight = 2
} HMPopMenuArrowPosition;

@class MQPopMenu;

@protocol HMPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidDismissed:(MQPopMenu *)popMenu;
@end

@interface MQPopMenu : UIView
@property (nonatomic, weak) id<HMPopMenuDelegate> delegate;

@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;

@property (nonatomic, assign) HMPopMenuArrowPosition arrowPosition;

/**
 *  初始化方法
 */
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contentView;

/**
 *  设置菜单的背景图片
 */
- (void)setBackground:(UIImage *)background;

/**
 *  显示菜单
 */
- (void)showInRect:(CGRect)rect;

/**
 *  关闭菜单
 */
- (void)dismiss;
@end
