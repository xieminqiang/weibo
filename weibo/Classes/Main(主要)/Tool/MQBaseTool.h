//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//  最基本的业务工具类

#import <Foundation/Foundation.h>

@interface MQBaseTool : NSObject
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end
