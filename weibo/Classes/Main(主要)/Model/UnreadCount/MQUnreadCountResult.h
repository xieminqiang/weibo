//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <Foundation/Foundation.h>

@interface MQUnreadCountResult : NSObject
/**
 *  新微博未读数
 */
@property (nonatomic, assign) int status;

/**
 *  新粉丝数
 */
@property (nonatomic, assign) int follower;

/**
 *  新评论数
 */
@property (nonatomic, assign) int cmt;

/**
 *  新私信数
 */
@property (nonatomic, assign) int dm;

/**
 *  新提及我的微博数
 */
@property (nonatomic, assign) int mention_cmt;

/**
 *  新提及我的评论数
 */
@property (nonatomic, assign) int mention_status;

/**
 *  消息未读数
 */
- (int)messageCount;

/**
 *  所有未读数
 */
- (int)totalCount;
@end
