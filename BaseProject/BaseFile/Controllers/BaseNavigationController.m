//
//  BaseNavigationController.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#define BackIndicatorImage @"back-WHITH"

#import "BaseNavigationController.h"
#import "BaseNavigationBar.h"
#import "RootViewController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)commonInit {
    // 设置主题
    UINavigationBar *appearance = [UINavigationBar appearance];
    appearance.tintColor = COLOR_WHITE;
    // 背景及阴影图
    [appearance setBackgroundImage:[UIImage imageWithColor:COLOR_CLEAR] forBarMetrics:UIBarMetricsDefault];
//    [appearance setShadowImage:[UIImage imageWithColor:COLOR_CLEAR]];
    
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName : COLOR_WHITE, NSFontAttributeName : Font18};
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    // 全局返回图标
    UIImage *backImage = [UIImage imageWithColor:COLOR_CLEAR];
    [appearance setBackIndicatorImage:[backImage original]];
    [appearance setBackIndicatorTransitionMaskImage:[backImage original]];
    
    [self setFullScreenGesture:YES];
}

- (void)setFullScreenGesture:(BOOL)fullScreenGesture {
    if (fullScreenGesture) {
        //获取系统侧滑手势
        UIGestureRecognizer *systemPopGes = self.interactivePopGestureRecognizer;
        //禁用系统侧滑
        systemPopGes.enabled = NO;
        //得到系统target-action数组
        NSMutableArray *_targets = [systemPopGes valueForKey:@"_targets"];
        //取出系统实现侧滑的target
        id systemPanTarget = [_targets.firstObject valueForKey:@"target"];
        //获取系统实现侧滑的action
        SEL systemAction = NSSelectorFromString(@"handleNavigationTransition:");
        //自定义滑动手势
        UIPanGestureRecognizer *myPan = [[UIPanGestureRecognizer alloc] initWithTarget:systemPanTarget action:systemAction];
        myPan.delegate = self;
        myPan.maximumNumberOfTouches = 1;
        //向系统实现侧滑的view中加入自定义的滑动手势
        [systemPopGes.view addGestureRecognizer:myPan];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    
    // 自定义页面不响应手势
    //UIViewController *vc = [self.childViewControllers lastObject];
    //if ([vc isKindOfClass:[CustomController class]]) {
        //return NO;
    //}
    
    return YES;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        // 根控制器自定义bar初始化
        BaseViewController *rootVc = (BaseViewController *)rootViewController;
        [rootViewController.view addSubview:rootVc.km_navigationBar];
        // 统一设置返回导航左键
        rootViewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"option" title:nil target:self action:@selector(show) contentMode:UIControlContentHorizontalAlignmentLeft];
    }
    
    return self;
}

- (void)show {
    [GlobelHelper showLeftView];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        // PUSH 自定义导航bar初始化
        BaseViewController *pushVc = (BaseViewController *)viewController;
        [viewController.view addSubview:pushVc.km_navigationBar];
        [pushVc.km_navigationBar.leftItem setImage:[UIImage imageNamed:BackIndicatorImage] forState:UIControlStateNormal];
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
