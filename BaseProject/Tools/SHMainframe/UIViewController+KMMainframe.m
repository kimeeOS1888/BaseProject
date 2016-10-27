//
//  UIViewController+KMMainframe.m
//  KMMainframe
//
//  Created by kimee on 15/12/31.
//  Copyright © 2015年 kimee. All rights reserved.
//

#import "UIViewController+KMMainframe.h"

#define kSHTapViewTag (15000)

@implementation UIViewController (KMMainframe)

//MARK: - 添加处理滑动手势

/**
 添加拖拽手势响应，给需要处理响应的UIViewController调用
 */
- (void) addMainFramePanGestureRecognizer
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(mainFramePanGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)removeOnceMainFrameTapGestureRecognizer {
    [[self.view viewWithTag:kSHTapViewTag] removeFromSuperview];
}

/**
 处理拖拽手势
 */
- (void)mainFramePanGestureRecognizer:(UIPanGestureRecognizer *)sender
{
    NSMutableDictionary<NSString *,id> *dic = [NSMutableDictionary<NSString *,id> dictionary];
    dic[@"panGestureRecognizer"] = sender;
    [[NSNotificationCenter defaultCenter] postNotificationName:KMViewControllerExtensionEventNotificationNamePan object:self userInfo:dic];
}

//MARK: - 添加处理点击手势
/**
 添加点击手势
 */
- (void)addOnceMainFrameTapGestureRecognizer
{
    UIView* view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.tag = kSHTapViewTag;
    //添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainFrameTapGestureRecognizer:)];
    tap.numberOfTapsRequired = 1;
    [view addGestureRecognizer:tap];
    
    //代理拖动事件
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onceViewPanGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
    
    [self.view addSubview:view];
}

/**
 处理点击手势
 */
- (void)mainFrameTapGestureRecognizer:(UITapGestureRecognizer *) sender
{
    NSMutableDictionary<NSString *,id> *dic = [NSMutableDictionary<NSString *,id> dictionary];
    dic[@"tapGestureRecognizer"] = sender;

      [[NSNotificationCenter defaultCenter] postNotificationName:KMViewControllerExtensionEventNotificationNameTap object:self userInfo:dic];
    [self removeOnceMainFrameTapGestureRecognizer];
}

/**
 处理代理的拖拽手势
 */
- (void)onceViewPanGestureRecognizer:(UIPanGestureRecognizer *) sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [[self.view viewWithTag:kSHTapViewTag] removeFromSuperview];
    }
    [self mainFramePanGestureRecognizer:sender];
}


@end
