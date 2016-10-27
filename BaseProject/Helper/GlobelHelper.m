//
//  GlobelHelper.m
//  BaseProject
//
//  Created by wujianming on 16/10/14.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "GlobelHelper.h"
#import "KMMainframeViewController.h"
#import "BaseNavigationBar.h"

@implementation GlobelHelper

+ (void)showLeftView {
    KMMainframeViewController *mainVc = (KMMainframeViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [mainVc openLeftViewWithStatus:YES animation:YES];
}

@end
