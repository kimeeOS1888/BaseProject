//
//  UIViewController+Ex.m
//  BaseProject
//
//  Created by wujianming on 16/9/23.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "UIViewController+Ex.h"

@implementation UIViewController (Ex)

- (void)alertWithSytle:(UIAlertControllerStyle)style title:(NSString *)title message:(NSString *)msg cancleTitle:(NSString *)cTitle {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:style];
    UIAlertAction *action = [UIAlertAction actionWithTitle:cTitle style:UIAlertActionStyleDestructive handler:nil];
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)alertWithSytle:(UIAlertControllerStyle)style title:(NSString *)title message:(NSString *)msg sureTitle:(NSString *)sTitle cancleTitle:(NSString *)cTitle sure:(void (^)())sure cancle:(void (^)())cancle {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:style];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:sTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (sure) {
                sure();
            }
        });
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:cTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (cancle) {
                cancle();
            }
        });
    }];
    [alertVc addAction:action1];
    [alertVc addAction:action2];
    [self presentViewController:alertVc animated:YES completion:nil];
}

@end
