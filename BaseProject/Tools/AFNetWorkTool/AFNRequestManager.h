//
//  AFNRequestManager.h
//  QianLongZan
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id response, NSInteger resposeCode);
typedef void(^FailureBlock)(NSError *error, NSString *errorMsg);

@class AFNBaseModel;

@interface AFNRequestManager : NSObject

+ (void)GET:(NSString *)url parameter:(AFNBaseModel *)baseModel success:(SuccessBlock)success failure:(FailureBlock)failure;
+ (void)POST:(NSString *)url parameter:(AFNBaseModel *)baseModel success:(SuccessBlock)success failure:(FailureBlock)failure;

@end
