


//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo




#import <Foundation/Foundation.h>
@class MQEmotion;

@interface MQEmotionTool : NSObject
/**
 *  默认表情
 */
+ (NSArray *)defaultEmotions;
/**
 *  emoji表情
 */
+ (NSArray *)emojiEmotions;
/**
 *  浪小花表情
 */
+ (NSArray *)lxhEmotions;
/**
 *  最近表情
 */
+ (NSArray *)recentEmotions;

/**
 *  保存最近使用的表情
 */
+ (void)addRecentEmotion:(MQEmotion *)emotion;
@end
