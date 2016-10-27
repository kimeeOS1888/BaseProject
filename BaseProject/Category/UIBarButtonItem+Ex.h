//
//  UIBarButtonItem+Ex.h
//  QianLongZan
//
//  Created by wujianming on 16/9/26.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Ex)

+ (instancetype)itemWithImageName:(NSString *)name title:(NSString *)title target:(id)target action:(SEL)action contentMode:(UIControlContentHorizontalAlignment)mode;
+ (instancetype)iconWithImageName:(NSString *)name target:(id)target action:(SEL)action contentMode:(UIControlContentHorizontalAlignment)mode;

@end
