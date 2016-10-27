//
//  HomePageController.m
//  BaseProject
//
//  Created by wujianming on 16/10/17.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "HomePageController.h"
// 彩蛋控制器
#import "WIFISetupHelper.h"

@interface HomePageController ()

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)commonInit {
    self.title = @"首页";
    
    // 彩蛋入口
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"WIFISetup" title:nil target:self action:@selector(wifiSetup) contentMode:UIControlContentHorizontalAlignmentRight];
}

- (void)wifiSetup {
    WIFISetupHelper *wifiVc = [[WIFISetupHelper alloc] init];
    [self presentViewController:wifiVc animated:YES completion:nil];
}

// 彩蛋测试
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DBLog(@"当前缓存HOST: %@", AFNBaseURL);
}

@end
