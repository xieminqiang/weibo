//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import <Foundation/Foundation.h>
#import "MQBaseParam.h"

@interface MQSendStatusParam : MQBaseParam
/**	true	string	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。*/
@property (nonatomic, copy) NSString *status;
@end
