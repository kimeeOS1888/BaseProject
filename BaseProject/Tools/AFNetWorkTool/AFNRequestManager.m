//
//  AFNRequestManager.m
//  QianLongZan
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "AFNRequestManager.h"
#import "AFNBaseModel.h"
#import "AFNHTTPRequestManager.h"

@implementation AFNRequestManager

+ (void)POST:(NSString *)url parameter:(AFNBaseModel *)baseModel success:(SuccessBlock)success failure:(FailureBlock)failure {
    AFNHTTPRequestManager *httpManager = [AFNHTTPRequestManager shareInstance];
    NSString *postURL = [url stringByAppendingString:baseModel.API]; // 解析路径
    baseModel.API = nil; // 剔除携带信息
    NSDictionary *paramters = [baseModel mj_keyValues]; // 解释参数
    NSDictionary *newParamters = [self getMD5JsonDictionary:paramters];
    
    DBLog(@"请求路径: %@ \n\t请求参数: %@", postURL, newParamters);
    
    [httpManager POST:postURL parameters:newParamters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        success(responseObject,code);
        DBLog(@"请求路径:%@\n\t返回结果: %@", task.response.URL, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dic = [error userInfo];
        failure(error, dic[@"NSLocalizedDescription"]);
        DBLog(@"请求路径: %@\n\t返回错误结果: %@", dic[@"NSErrorFailingURLKey"], dic[@"NSLocalizedDescription"]);
    }];
}

+ (void)GET:(NSString *)url parameter:(AFNBaseModel *)baseModel success:(SuccessBlock)success failure:(FailureBlock)failure {
    AFNHTTPRequestManager *httpManager = [AFNHTTPRequestManager shareInstance];
    
    NSString *postURL = [url stringByAppendingString:baseModel.API]; // 解析路径
    baseModel.API = nil; // 剔除携带信息
    NSDictionary *paramters = [baseModel mj_keyValues]; // 解释参数
    NSDictionary *newParamters = [self getMD5JsonDictionary:paramters];
    DBLog(@"请求路径: %@ \n\t请求参数: %@", postURL, newParamters);
    
    [httpManager GET:postURL parameters:newParamters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        success(responseObject,code);
        DBLog(@"请求路径:%@\n\t返回结果: %@", task.response.URL, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dic = [error userInfo];
        failure(error, dic[@"NSLocalizedDescription"]);
        DBLog(@"请求路径: %@\n\t返回错误结果: %@", dic[@"NSErrorFailingURLKey"], dic[@"NSLocalizedDescription"]);
    }];
}

// Md5　加密后，重新组装的数组
+ (NSMutableDictionary *)getMD5JsonDictionary:(NSDictionary *)dic
{
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    // 版本号
    NSString *version = [NSString getVersion];
    
    // 时间戳
    NSString *timestamp = [NSString timestamp];
    
    // 其他标记
    NSString *token          = @"C86F49B4083006F2CFF8FA2718391F81";
    NSString *action         = @"";
    NSString *app_key        = @"QianLongZanAPP";
    NSString *dataJsonString = [dic mj_JSONString];
    dataJsonString = [dataJsonString stringByReplacingOccurrencesOfString:@"\\" withString:@""]; // 加这一句主要是因为转码后多了个斜杠
    NSString *format         = @"json";
    NSString *platform       = @"iOS";
    NSString *sign_method    = @"md5";
    
    // 组装 json 参数
    NSString *signString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
                            token,@"action",
                            action,@"app_key",
                            app_key,@"data",
                            dataJsonString,@"format",
                            format,@"platform",
                            platform,@"sign_method",
                            sign_method,@"timestamp",
                            timestamp,@"version",
                            version,token];
    
    // 加密参数
    NSString *sign = [signString md5Str];
    
    [newDic setObject:[NSString stringWithFormat:@"%@", action]
               forKey:@"Action"];
    [newDic setObject:[NSString stringWithFormat:@"%@", app_key]
               forKey:@"AppKey"];
    [newDic setObject:dic
               forKey:@"Data"];
    [newDic setObject:[NSString stringWithFormat:@"%@", format]
               forKey:@"Format"];
    [newDic setObject:[NSString stringWithFormat:@"%@", platform]
               forKey:@"Platform"];
    [newDic setObject:[NSString stringWithFormat:@"%@", sign_method]
               forKey:@"SignMethod"];
    [newDic setObject:[NSString stringWithFormat:@"%@", timestamp]
               forKey:@"Timestamp"];
    [newDic setObject:[NSString stringWithFormat:@"%@", version]
               forKey:@"Version"];
    [newDic setObject:[NSString stringWithFormat:@"%@", sign]
               forKey:@"Sign"];
    return newDic;
}

@end
