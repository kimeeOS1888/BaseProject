//
//  UIBarButtonItem+Ex.m
//  QianLongZan
//
//  Created by wujianming on 16/9/26.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "UIBarButtonItem+Ex.h"

@implementation UIBarButtonItem (Ex)

+ (instancetype)itemWithImageName:(NSString *)name title:(NSString *)title target:(id)target action:(SEL)action contentMode:(UIControlContentHorizontalAlignment)mode {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 44);
    [button setContentHorizontalAlignment:mode];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (name) {
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        title = nil;
    }
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitleColor:COLOR_(@"333333") forState:UIControlStateNormal];
    }
    
    if (mode == UIControlContentHorizontalAlignmentLeft) {
        if (name) {
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        }
        if (title) {
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
        }
    }
    else if (UIControlContentHorizontalAlignmentRight) {
        if (name) {
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -3);
        }
        if (title) {
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -3);
        }
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

+ (instancetype)iconWithImageName:(NSString *)name target:(id)target action:(SEL)action contentMode:(UIControlContentHorizontalAlignment)mode {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 38, 38);
    [button setContentHorizontalAlignment:mode];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = button.bounds.size.height * 0.5;
    button.layer.masksToBounds = YES;
    
    if (name) {
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    }

    if (mode == UIControlContentHorizontalAlignmentLeft) {
        if (name) {
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
        }
    }
    else if (UIControlContentHorizontalAlignmentRight) {
        if (name) {
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -3);
        }
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

@end
