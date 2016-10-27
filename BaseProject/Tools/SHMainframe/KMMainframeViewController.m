//
//  KMMainframeViewController.m
//  KMMainframe
//
//  Created by Sam on 15/12/31.
//  Copyright © 2015年 Sam. All rights reserved.
//

#import "KMMainframeViewController.h"
#import "UIViewController+KMMainframe.h"

@interface KMMainframeViewController ()

@property (nonatomic,assign) CGFloat lastMoveX;

@end

@implementation KMMainframeViewController

/**
 左边视图控制器最大占据屏幕总宽度的比例
 */
- (void)setLeftViewControllerMaxScaleOfWidth:(CGFloat)leftViewControllerMaxScaleOfWidth
{
    leftViewControllerMaxScaleOfWidth = MAX(0.1, leftViewControllerMaxScaleOfWidth);
    leftViewControllerMaxScaleOfWidth = MIN(1.0, leftViewControllerMaxScaleOfWidth);
    _leftViewControllerMaxScaleOfWidth = leftViewControllerMaxScaleOfWidth;
}

/**
 左边视图控制器刚开始展示的区域起始值占自身总宽度的比例
 */
- (void)setLeftViewControllerStartScaleOfWidth:(CGFloat)leftViewControllerStartScaleOfWidth{
    leftViewControllerStartScaleOfWidth = MAX(0.0, leftViewControllerStartScaleOfWidth);
    leftViewControllerStartScaleOfWidth = MIN(1.0, leftViewControllerStartScaleOfWidth);
    _leftViewControllerStartScaleOfWidth = leftViewControllerStartScaleOfWidth;
}

/**
 右边视图控制器移动到最右边时的缩放比例
 */

- (void)setRigthViewControllerMinScaleSizeX:(CGFloat)rigthViewControllerMinScaleSizeX
{
    rigthViewControllerMinScaleSizeX = MAX(0.1, rigthViewControllerMinScaleSizeX);
    rigthViewControllerMinScaleSizeX = MIN(1.0, rigthViewControllerMinScaleSizeX);
    _rigthViewControllerMinScaleSizeX = rigthViewControllerMinScaleSizeX;
    self.leftViewController.view.frame = CGRectMake(self.leftViewControllerMoveRangMinX, 0.0, self.view.bounds.size.width * (2.0 - self.leftViewControllerStartScaleOfWidth), self.view.bounds.size.height);
}

- (void)setRigthViewControllerMinScaleSizeY:(CGFloat)rigthViewControllerMinScaleSizeY
{
    rigthViewControllerMinScaleSizeY = MAX(0.1, rigthViewControllerMinScaleSizeY);
    rigthViewControllerMinScaleSizeY = MIN(1.0, rigthViewControllerMinScaleSizeY);
    _rigthViewControllerMinScaleSizeY = rigthViewControllerMinScaleSizeY;
    
    self.leftViewController.view.frame = CGRectMake(self.leftViewControllerMoveRangMinX, 0.0, self.view.bounds.size.width * (2.0 - self.leftViewControllerStartScaleOfWidth), self.view.bounds.size.height);
}

/**
 左边视图控制器view的X移动的最小和最大值
 */

- (CGFloat)leftViewControllerMoveRangMinX
{
    return  -self.view.frame.size.width * self.leftViewControllerStartScaleOfWidth;
}

- (CGFloat)leftViewControllerMoveRangMaxX
{
    return 0.0;
}


/**
 右边视图控制器view的X移动的最小和最大值
 */

- (CGFloat)rigthViewControllerMoveRangeMinX
{
    return  0.0;
}

- (CGFloat)rigthViewControllerMoveRangeMaxX
{
    return  self.view.frame.size.width * self.leftViewControllerMaxScaleOfWidth;
}


/**
 右边视图控制器
 */
- (void)setRightViewController:(UIViewController *)rightViewController{
    
    [_rightViewController removeFromParentViewController];
    [_rightViewController.view removeFromSuperview];
    
    [self.view addSubview:rightViewController.view];
    [self addChildViewController:rightViewController];
    
    _rightViewController = rightViewController;
    
    //添加拖拽手势
    [self addMainFramePanGestureRecognizer];
}

/**
 左边视图控制器
 */
- (void)setLeftViewController:(UIViewController *)leftViewController{
    
    [_leftViewController removeFromParentViewController];
    [_leftViewController.view removeFromSuperview];
    
    [self.view addSubview:leftViewController.view];
    [self addChildViewController:leftViewController];
    
    _leftViewController = leftViewController;
    
}

//MARK: - 方法覆盖
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addNotificationMoniter];
    self.rigthViewControllerMinScaleSizeX = 1.0;
    self.rigthViewControllerMinScaleSizeY = 1.0;
    self.leftViewControllerMaxScaleOfWidth = 0.8;
    self.leftViewControllerStartScaleOfWidth = 0.5;
    self.rightViewControllerPanLocationX = 64/SCREEN_WIDTH;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //初始化位置大小
    self.leftViewController.view.frame = CGRectMake(self.leftViewControllerMoveRangMinX, 0.0, self.view.bounds.size.width * (2.0 - self.leftViewControllerStartScaleOfWidth), self.view.bounds.size.height);
    self.rightViewController.view.frame = self.view.bounds;
}


/**
 添加通知消息监控
 */
- (void)addNotificationMoniter
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rigthViewControllerPanGestureRecognizer:) name:KMViewControllerExtensionEventNotificationNamePan object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rigthViewControllerTapGestureRecognizer:) name:KMViewControllerExtensionEventNotificationNameTap object:nil];
}

//MARK: - 事件响应

/**
 处理拖拽消息
 */
- (void)rigthViewControllerPanGestureRecognizer:(NSNotification *) notification
{
    UIPanGestureRecognizer *panGestureRecognizer = notification.userInfo[@"panGestureRecognizer"];
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.lastMoveX = 0.0;
    }
    
    CGPoint rightLocate = [panGestureRecognizer locationInView:self.rightViewController.view];
    if ([self.rightViewController isKindOfClass:[UITabBarController class]]) { // Tabbar的情况手势有效区过滤
        UITabBarController *tempVc = (UITabBarController *)self.rightViewController;
        if (rightLocate.x > SCREEN_WIDTH * _rightViewControllerPanLocationX || tempVc.selectedViewController.childViewControllers.count != 1) {
            [self openLeftViewWithStatus:NO animation:YES];
            return;
        }
    }
    else if ([self.rightViewController isKindOfClass:[UINavigationController class]]) { // Nav的情况
        if (rightLocate.x > SCREEN_WIDTH * _rightViewControllerPanLocationX || self.rightViewController.childViewControllers.count != 1) {
            [self openLeftViewWithStatus:NO animation:YES];
            return;
        }
    }
    else {
        if (rightLocate.x > SCREEN_WIDTH * _rightViewControllerPanLocationX) {
            [self openLeftViewWithStatus:NO animation:YES];
            return;
        }
    }
    
    CGFloat rigthVcRangeMinX = self.rigthViewControllerMoveRangeMinX;
    CGFloat rigthVcRangeMaxX = self.rigthViewControllerMoveRangeMaxX;
    CGFloat currenX = self.rightViewController.view.frame.origin.x;
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat moveOffset = translation.x - self.lastMoveX;
        self.lastMoveX = translation.x;
        CGFloat moveX = currenX + moveOffset;
        moveX = MAX(moveX, rigthVcRangeMinX);
        moveX = MIN(moveX, rigthVcRangeMaxX);
        CGFloat scaleX = 1.0 - moveX / rigthVcRangeMaxX * (1.0 - self.rigthViewControllerMinScaleSizeX);
        CGFloat scaleY = 1.0 - moveX / rigthVcRangeMaxX * (1.0 - self.rigthViewControllerMinScaleSizeY);
        
        self.rightViewController.view.transform = CGAffineTransformMakeScale(scaleX,scaleY);
        CGRect tempFrame = self.rightViewController.view.frame;
        tempFrame.origin.x = moveX;
        self.rightViewController.view.frame = CGRectMake(moveX, self.rightViewController.view.frame.origin.y, self.rightViewController.view.frame.size.width, self.rightViewController.view.frame.size.height);
        tempFrame = self.leftViewController.view.frame;
        tempFrame.origin.x = self.leftViewControllerMoveRangMinX + moveX * self.leftViewControllerStartScaleOfWidth / self.leftViewControllerMaxScaleOfWidth;
        self.leftViewController.view.frame = tempFrame;
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self openLeftViewWithStatus:currenX >= rigthVcRangeMaxX * 0.5 animation:YES];
    }
}

/**
 处理点击事件
 */
- (void)rigthViewControllerTapGestureRecognizer:(NSNotification *) notification
{
    [self openLeftViewWithStatus:NO animation:YES];
}

/**
 回到最初或最终位置
 */
- (void)openLeftViewWithStatus:(BOOL) openStatus animation:(BOOL) animation
{
    CGFloat duration = animation ? 0.15 :0.0;
    [UIView animateWithDuration:duration animations:^{
        if(openStatus){
            self.rightViewController.view.transform = CGAffineTransformMakeScale(self.rigthViewControllerMinScaleSizeX, self.rigthViewControllerMinScaleSizeY);
            CGRect tempFrame = self.rightViewController.view.frame;
            tempFrame.origin.x = self.rigthViewControllerMoveRangeMaxX;
            self.rightViewController.view.frame = tempFrame;
            
            tempFrame = self.leftViewController.view.frame;
            tempFrame.origin.x = self.leftViewControllerMoveRangMaxX;
            self.leftViewController.view.frame = tempFrame;
            
            // 添加点击事件，这里需要view屏蔽rightview本身的其他事件
            [self.rightViewController addOnceMainFrameTapGestureRecognizer];
        }
        else {
            self.rightViewController.view.transform = CGAffineTransformIdentity;
            CGRect tempFrame = self.rightViewController.view.frame;
            tempFrame.origin.x = self.rigthViewControllerMoveRangeMinX;
            self.rightViewController.view.frame = tempFrame;
            tempFrame = self.leftViewController.view.frame;
            tempFrame.origin.x = self.leftViewControllerMoveRangMinX;
            self.leftViewController.view.frame = tempFrame;
            
            [self.rightViewController removeOnceMainFrameTapGestureRecognizer];
        }
    }];
}

@end
