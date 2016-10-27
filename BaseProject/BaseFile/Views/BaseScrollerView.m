//
//  BaseScrollerView.m
//  BaseProject
//
//  Created by wujianming on 16/10/12.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseScrollerView.h"

@interface BaseScrollerView ()<UIGestureRecognizerDelegate>

@end

@implementation BaseScrollerView

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")] || [otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UIView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    
    return NO;
}

@end
