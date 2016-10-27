//
//  NSDictionary+Chinese.m
//  AFNTestDemo
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "NSDictionary+Ex.h"

@implementation NSDictionary (Ex)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"{\n"];
    
    for (id obj in [self allKeys]) {
        [strM appendFormat:@"\t\t%@ = ", obj];
        
        [strM appendFormat:@"%@\n", self[obj]];
    }
    
    [strM appendString:@"}"];
    
    return strM;
}

@end
