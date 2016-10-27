//
//  KMUserInfoManager.m
//  UserInfoManager
//
//  Created by wujianming on 16/6/1.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#define kUserInfoKey @"KMUSERKEY"

#import "KMUserInfoManager.h"
#import "MJExtension.h"

@implementation KMUserInfoManager

+ (BOOL)isLogin {
    KMUserInfo *uDefault = [KMUserInfoManager getInfo];
    return uDefault.userName.length ? YES : NO;
}

+ (void)saveInfo:(KMUserInfo *)info {
    NSMutableDictionary *infoDic = [info mj_keyValues];
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    [uDefault setObject:infoDic forKey:kUserInfoKey];
    [uDefault synchronize];
}

+ (KMUserInfo *)getInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *infoDic = [uDefault objectForKey:kUserInfoKey];
    KMUserInfo *km_userInfo = [KMUserInfo mj_objectWithKeyValues:infoDic];
    return km_userInfo;
}

+ (void)deleteInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    [uDefault removeObjectForKey:kUserInfoKey];
}

@end
