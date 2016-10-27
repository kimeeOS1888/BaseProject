//
//  AFNHTTPRequestManager.h
//  AFNTestDemo
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFNHTTPRequestManager : AFHTTPSessionManager

+ (instancetype)shareInstance;

@end
