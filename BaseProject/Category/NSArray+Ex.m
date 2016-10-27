//
//  NSArray+Chinese.m
//  AFNTestDemo
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "NSArray+Ex.h"

@implementation NSArray (Ex)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"(\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t\t%@,\n", obj];
    }
    [strM appendString:@")"];
    
    return strM;
}

@end
