//
//  RootViewController.m
//  BaseProject
//
//  Created by wujianming on 16/10/13.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "RootViewController.h"
#import "LeftViewController.h"
#import "BaseTabBarController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)commonInit {
    // 创建ViewController
    LeftViewController *leftVc = [[LeftViewController alloc] init];
    BaseTabBarController *rigthVc = [[BaseTabBarController alloc] init];
    
    // 设置ViewController
    self.leftViewController = leftVc;
    self.rightViewController = rigthVc;
    
    // 设置左边视图控制最大占据屏幕总宽度的比例
    self.leftViewControllerMaxScaleOfWidth = 0.7;
    // 触摸比例
    self.rightViewControllerPanLocationX = (1 - self.leftViewControllerMaxScaleOfWidth);
    // 左边视图控制器刚开始展示的区域起始值占自身总宽度的比例
    self.leftViewControllerStartScaleOfWidth = self.leftViewControllerMaxScaleOfWidth * 0.5;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
