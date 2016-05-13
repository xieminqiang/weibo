//
//  MQEmotion.h
//  weibo
//
//  Created by apple on 15-7-15.
//  Copyright (c) 2015年 weibo. All rights reserved.
//  表情

#import <Foundation/Foundation.h>

@interface MQEmotion : NSObject <NSCoding>
/** 表情的文字描述 */
@property (nonatomic, copy) NSString *chs;
/** 表情的文png图片名 */
@property (nonatomic, copy) NSString *png;
/** emoji表情的编码 */
@property (nonatomic, copy) NSString *code;


/** 表情的存放文件夹\目录 */
@property (nonatomic, copy) NSString *directory;
/** emoji表情的字符 */
@property (nonatomic, copy) NSString *emoji;
@end
