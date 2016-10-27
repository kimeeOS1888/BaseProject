//
//  CommonFile.h
//  TestOC
//
//  Created by wujianming on 16/9/20.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#ifndef CommonFile_h
#define CommonFile_h

// 日志输出宏
#ifdef DEBUG
#define DBLog(something, ...) NSLog((@"- 方法名: %s - %d行 - 输出信息: {\n\t"something @"\n}"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DBLog(...)
#endif

//弱引用宏
#define WEAKSELF(weakSelf) __weak __typeof(&*self) weakSelf = self;

// 快捷创建
#define KEY_WINDOW       [[UIApplication sharedApplication] keyWindow]
#define ROOT_VIEW_CONTROLLER [UIApplication sharedApplication].keyWindow.rootViewController

// 设备尺寸
#define NAVIGATION_HEIGHT 64.0
#define TABBAR_HEIGHT 49.0
#define SCREEN_BOUNDS   [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCALE_HEIGHT(height)     (height * (SCREEN_HEIGHT / 667.0))
#define SCALE_WIDTH(width)       (width * (SCREEN_WIDTH / 375.0))

// 常用布局尺寸
#define SCREEN_BOUNDS_WITHOUT_NAV CGRectMake(0, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT)
#define SCREEN_BOUNDS_WITHOUT_NAV_TABBAR CGRectMake(0, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT)

//iOS系统版本
#define iOS9    [[[UIDevice currentDevice]systemVersion]floatValue] >= 9.0
#define iOS8    [[[UIDevice currentDevice]systemVersion]floatValue] >= 8.0

// 常用颜色
#define COLOR_(color)           [UIColor colorWithHexString:color]
#define COLOR_VIEW_BACKGROUND   [UIColor colorWithHexString:@"F0F0F0"] // 全局背景色，淡灰
#define COLOR_NAV_BACKGROUND    [UIColor colorWithHexString:@"11CD6E"]
#define COLOR_BLACK             [UIColor colorWithHexString:@"000000"]
#define COLOR_GRAY              [UIColor colorWithHexString:@"C0C0C0"]
#define COLOR_WHITE             [UIColor colorWithHexString:@"FFFFFF"]
#define COLOR_RED               [UIColor colorWithHexString:@"FF0000"]
#define COLOR_CD_RED            [UIColor colorWithHexString:@"E3170D"] // 镉红
#define COLOR_ORANGE            [UIColor colorWithHexString:@"FF6100"]
#define COLOR_BROWN             [UIColor colorWithHexString:@"802A2A"] // 棕色
#define COLOR_BLUE              [UIColor colorWithHexString:@"0000FF"] // 蓝色
#define COLOR_DEEP_BLUE         [UIColor colorWithHexString:@"191970"] // 深蓝色
#define COLOR_TURQUOISE_BLUE    [UIColor colorWithHexString:@"00C78C"] // 土耳其玉色
#define COLOR_GREEN             [UIColor colorWithHexString:@"00FF00"]
#define COLOR_JADE_GREEN        [UIColor colorWithHexString:@"00C957"] // 翠绿色
#define COLOR_FOREST_GREEN      [UIColor colorWithHexString:@"228B22"] // 森林绿
#define COLOR_PURPLE            [UIColor colorWithHexString:@"A020F0"] // 紫色
#define COLOR_CLEAR             [UIColor clearColor] // 透明色

// 常用字体
#define Font(size) [UIFont systemFontOfSize:size]
#define Font11 [UIFont systemFontOfSize:11.0]
#define Font12 [UIFont systemFontOfSize:12.0]
#define Font13 [UIFont systemFontOfSize:13.0]
#define Font14 [UIFont systemFontOfSize:14.0]
#define Font15 [UIFont systemFontOfSize:15.0]
#define Font16 [UIFont systemFontOfSize:16.0]
#define Font17 [UIFont systemFontOfSize:17.0]
#define Font18 [UIFont systemFontOfSize:18.0]

#endif /* CommonFile_h */
