//
//  KMMainframeViewController.h
//  KMMainframe
//
//  Created by Sam on 15/12/31.
//  Copyright © 2015年 Sam. All rights reserved.
//

#import "BaseViewController.h"

@interface KMMainframeViewController : BaseViewController

/**
 左边视图控制器最大占据屏幕总宽度的比例
 */
@property (nonatomic,assign) CGFloat leftViewControllerMaxScaleOfWidth;

/**
 左边视图控制器刚开始展示的区域起始值占自身总宽度的比例
 */
@property (nonatomic,assign) CGFloat leftViewControllerStartScaleOfWidth;

/**
 侧滑手势响应比例
 */
@property (nonatomic,assign) CGFloat rightViewControllerPanLocationX;

/**
 右边视图控制器移动到最右边时的缩放比例
 */
@property (nonatomic,assign) CGFloat rigthViewControllerMinScaleSizeX;

@property (nonatomic,assign) CGFloat rigthViewControllerMinScaleSizeY;

/**
 左边视图控制器view的X移动的最小和最大值
 */

@property (nonatomic,assign,readonly) CGFloat leftViewControllerMoveRangMinX;

@property (nonatomic,assign,readonly) CGFloat leftViewControllerMoveRangMaxX;

/**
 右边视图控制器view的X移动的最小和最大值
 */

@property (nonatomic,assign,readonly) CGFloat rigthViewControllerMoveRangeMinX;

@property (nonatomic,assign,readonly) CGFloat rigthViewControllerMoveRangeMaxX;


/**
 右边视图控制器
 */
@property (weak, nonatomic) UIViewController *rightViewController;
/**
 左边视图控制器
 */
@property (weak, nonatomic) UIViewController *leftViewController;

/**
 设置左边视图打开关闭状态
 */
- (void)openLeftViewWithStatus:(BOOL) openStatus animation:(BOOL) animation;

@end
