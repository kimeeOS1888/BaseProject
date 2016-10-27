//
//  NSDate+Extention.h
//  CustomNavTest
//
//  Created by kimeeos on 16/5/30.
//  Copyright © 2016年 kimeeos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extention)

/** 获取本周第一天*/
+ (instancetype)dateWithCurrentWeekAtFirst;
+ (NSString *)dateStringWithCurrentWeekAtFirst;

/** 获取本周最后一天*/
+ (instancetype)dateWithCurrentWeekAtLast;
+ (NSString *)dateStringWithCurrentWeekAtLast;

/** 获取当月第一天*/
+ (instancetype)dateWithCurrentMonthAtFirst;
+ (NSString *)dateStringWithCurrentMonthAtFirst; // 默认格式@"yyyy-MM-dd"

/** 获取当月最后一天*/
+ (instancetype)dateWithCurrentMonthAtLast;
+ (NSString *)dateStringWithCurrentMonthAtLast;

/** 今天*/
+ (NSString *)todayString;

/**现在的年月*/
+ (NSString *)nowYearMonth;

/** 昨天*/
+ (instancetype)yesterday;
+ (NSString *)yesterdayString;

/** 明天*/
+ (instancetype)tomorrow;
+ (NSString *)tomorrowString;

/** 正数表示往后几天，负数表示往前几天，index = 1 明天， -1 昨天 0 今天*/
+ (instancetype)dateWithIndex:(NSInteger)index;
+ (NSString *)dateStringWithIndex:(NSInteger)index;

/** 日期格式化*/
- (NSString *)dateWithDateFormat:(NSString *)str;

@end
