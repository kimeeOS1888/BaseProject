//
//  BaseNavigationBar.h
//  BaseProject
//
//  Created by wujianming on 16/10/11.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ItemActionBlock)(UIButton *item);

@interface BaseNavigationBar : UIView

@property (strong, nonatomic) UIButton *titleItem;
@property (strong, nonatomic) UIButton *leftItem;
@property (strong, nonatomic) UIButton *rightItem;

- (void)leftItemActionCompletion:(ItemActionBlock)completion;
- (void)rightItemActionCompletion:(ItemActionBlock)completion;

@end
