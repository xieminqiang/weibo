//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  用户模型

#import <Foundation/Foundation.h>

@interface MQUser : NSObject
/** string 	友好显示名称 */
@property (nonatomic, copy) NSString *name;

/** string 	用户头像地址（中图），50×50像素 */
@property (nonatomic, copy) NSString *profile_image_url;

/** 会员类型 */
@property (nonatomic, assign) int mbtype;

/** 会员等级 */
@property (nonatomic, assign) int mbrank;

@property (nonatomic, assign, getter = isVip, readonly) BOOL vip;
@end
