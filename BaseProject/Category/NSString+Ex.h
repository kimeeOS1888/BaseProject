//
//  NetApiClient.m
//  TTTest
//
//  Created by xkun on 15/6/19.
//  Copyright (c) 2015年 xkun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ex)
//生成用户标示
+ (NSString *)userAgentStr;
//MD5加密
- (NSString *)md5Str;
//sha1加密
- (NSString *)sha1Str;
//检测字符串字节大小
+ (NSString *)sizeDisplayWithByte:(CGFloat)sizeOfByte;
//去掉字符串中的空格
- (NSString *)trimWhitespace;
//转换拼音
- (NSString *)transformToPinyin;
//获取字符串自适应的size
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//获取字符串自适应的高
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//获取字符串自适应的宽
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//判断有没有表情
- (BOOL)containsEmoji;
//判断是否为空
- (BOOL)isEmpty;
//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点形
- (BOOL)isPureFloat;
//判断电话号码
- (BOOL)checkPhoneNumInput;
//获取时间戳
+ (NSString *)timestamp;
//获取app版本号
+ (NSString *)getVersion;
//字符串转码成UTF-8
- (NSString *)stringToUTF8;
//字符串转码Base64
- (NSString *)stringToBase64;
// 检测字符串是否包含emoji👀表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
// 每4个字符间加2空格
+ (NSString *)formatSpace:(NSString *)Space;

@end
