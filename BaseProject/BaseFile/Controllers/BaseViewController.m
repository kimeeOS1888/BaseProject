//
//  BaseViewController.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseInit];
    DBLog(@"--->ENTER: %@", [self class]);
}

- (void)dealloc {
    DBLog(@"--->EXIT: %@ Dealloc", [self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)baseInit {
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - Getter
- (UITableView *)km_tableView {
    if (_km_tableView == nil) {
        CGRect rect = _tableViewFrame.size.height > 0 ? _tableViewFrame : SCREEN_BOUNDS_WITHOUT_NAV;
        _km_tableView = [[UITableView alloc] initWithFrame:rect style:_tableViewStype];
        _km_tableView.backgroundColor = COLOR_VIEW_BACKGROUND;
        _km_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _km_tableView.showsVerticalScrollIndicator = NO;
    }
    
    return _km_tableView;
}

- (BaseNavigationBar *)km_navigationBar {
    if (_km_navigationBar == nil) {
        _km_navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT)];
        _km_navigationBar.backgroundColor = COLOR_NAV_BACKGROUND;
    }
    
    return _km_navigationBar;
}

@end
