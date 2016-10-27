//
//  UILabel+Ex.m
//  QianLongZan
//
//  Created by wujianming on 16/9/29.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "UILabel+Ex.h"

@implementation UILabel (Ex)

- (void)setupCustomStrings:(NSArray *)strings withColor:(UIColor *)color font:(UIFont *)font {
    // 文本字符串数据
    NSString *content = self.text;
    if (color == nil) {
        color = self.textColor;
    }
    NSArray *number = strings;
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:content];
    for (int i = 0; i < content.length; i ++) {
        // 每次只截取一个字符的范围
        NSString *a = [content substringWithRange:NSMakeRange(i, 1)];
        // 判断装有0-9的字符串的数字数组是否包含截取字符串出来的单个字符，从而筛选出符合要求的数字字符的范围NSMakeRange
        // NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle] 下划线属性
        if ([number containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} range:NSMakeRange(i, 1)];
        }
    }
    //完成查找数字，最后将带有字体下划线的字符串显示在UILabel上
    self.attributedText = attributeString;
}

@end
