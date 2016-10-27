//
//  AFNHTTPRequestManager.m
//  QianLongZan
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "AFNHTTPRequestManager.h"

@implementation AFNHTTPRequestManager

+ (instancetype)shareInstance {
    static AFNHTTPRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html",nil];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        instance.requestSerializer  = [AFJSONRequestSerializer serializer];
        instance.responseSerializer =[AFJSONResponseSerializer serializer];
    });
    
    return instance;
}

@end
