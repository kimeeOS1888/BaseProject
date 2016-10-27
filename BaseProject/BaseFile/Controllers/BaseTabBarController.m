//
//  BaseTabBarController.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomePageController.h"
#import "MiddlePageController.h"
#import "RightPageController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
} 

- (void)commonInit {
    // Controllers
    HomePageController *homeVc = [[HomePageController alloc] init];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVc];
    
    MiddlePageController *midVc = [[MiddlePageController alloc] init];
    BaseNavigationController *midNav = [[BaseNavigationController alloc] initWithRootViewController:midVc];
    
    RightPageController *rigVc = [[RightPageController alloc] init];
    BaseNavigationController *rigNav = [[BaseNavigationController alloc] initWithRootViewController:rigVc];
    
    // TabBarItems
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                       image:[[UIImage imageNamed:@"normal"] original]
                                               selectedImage:[[UIImage imageNamed:@"select"] original]];
    
    midNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"中页"
                                                       image:[[UIImage imageNamed:@"normal"] original]
                                               selectedImage:[[UIImage imageNamed:@"select"] original]];
    
    rigNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"右页"
                                                       image:[[UIImage imageNamed:@"normal"] original]
                                               selectedImage:[[UIImage imageNamed:@"select"] original]];
    
    self.viewControllers = @[homeNav, midNav, rigNav];
    
    // 自定义item字体颜色
    for (BaseNavigationController *vc in self.viewControllers) { // 导航栏tabbar设置
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : COLOR_BLACK,
                                                NSFontAttributeName : [UIFont boldSystemFontOfSize:11.0]}
                                     forState:UIControlStateNormal]; // 设置Item未选中颜色
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : COLOR_(@"11cd6e")}
                                     forState:UIControlStateSelected]; // 设置Item选中颜色
        [vc.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0, -3)];
    }
    
    // 主题
    UITabBar *appearance = [UITabBar appearance];
    appearance.tintColor = COLOR_NAV_BACKGROUND;
}

@end
