//
//  KMUserInfoManager.h
//  UserInfoManager
//
//  Created by wujianming on 16/6/1.
//  Copyright © 2016年 szteyou. All rights reserved.
//  用户信息管理类

#import <Foundation/Foundation.h>
#import "KMUserInfo.h"

@interface KMUserInfoManager : NSObject

// 是否登录
+ (BOOL)isLogin;

// 保存信息
+ (void)saveInfo:(KMUserInfo *)info;

// 获取信息
+ (KMUserInfo *)getInfo;

// 删除信息
+ (void)deleteInfo;

@end
