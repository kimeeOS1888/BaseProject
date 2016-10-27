//
//  UIViewController+KMMainframe.h
//  KMMainframe
//
//  Created by kimee on 15/12/31.
//  Copyright © 2015年 kimee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  KMViewControllerExtensionEventNotificationNamePan   @"ViewControllerMainFramePanGestureRecognizer"
#define  KMViewControllerExtensionEventNotificationNameTap   @"ViewControllerMainFrameTapGestureRecognizer"

@interface UIViewController (KMMainframe)

/**
 添加拖拽手势响应，给需要处理响应的UIViewController调用
 */
- (void)addMainFramePanGestureRecognizer;

/**
 添加点击手势
 */
- (void)addOnceMainFrameTapGestureRecognizer;
/**
 移除点击手势
 */
- (void)removeOnceMainFrameTapGestureRecognizer;

@end
