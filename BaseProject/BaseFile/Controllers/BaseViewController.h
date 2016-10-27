//
//  BaseViewController.h
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationBar.h"

@interface BaseViewController : UIViewController

/**
 * 初始化列表类型 Plain or Group, 默认为Plain
 * 例如：self.tableViewStype = UITableViewStyleGrouped;
 * 优先级：1
 */
@property (assign, nonatomic) UITableViewStyle tableViewStype;

@property (assign, nonatomic) CGRect tableViewFrame;

/**
 * 懒加载初始化列表
 * 例如：[self.view addSubview:self.tableView];
 * 优先级：2
 */
@property (strong, nonatomic) UITableView *km_tableView;

/**
 * 自定义导航栏
 */
@property (strong, nonatomic) BaseNavigationBar *km_navigationBar;

@end
