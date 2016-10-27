//
//  LeftViewController.m
//  BaseProject
//
//  Created by wujianming on 16/10/13.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "LeftViewController.h"
#import "RootViewController.h"
#import "BaseTabBarController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)commonInit {
    // backgroundview
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.7, SCREEN_HEIGHT)];
    bgView.image = [UIImage imageNamed:@"leftImage"];
    [self.view addSubview:bgView];
    
    self.tableViewFrame = CGRectMake(0, 164, SCREEN_WIDTH * 0.7, SCREEN_HEIGHT - 164);
    self.tableViewStype = UITableViewStylePlain;
    self.km_tableView.delegate = self;
    self.km_tableView.dataSource = self;
    self.km_tableView.rowHeight = 50.0f;
    self.km_tableView.backgroundColor = COLOR_CLEAR;
    [self.km_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.km_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ListFirst"];
    [self.view addSubview:self.km_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListFirst"];
    cell.textLabel.text = @"演示数据";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RootViewController *rootVc = (RootViewController *)ROOT_VIEW_CONTROLLER;
    [rootVc openLeftViewWithStatus:NO animation:YES];
    
    // 当前选中控制器push
    BaseViewController *baseVc = [[BaseViewController alloc] init];
    baseVc.title = @"基类测试控制器";
    BaseTabBarController *rightVc = (BaseTabBarController *)rootVc.rightViewController;
    [rightVc.selectedViewController pushViewController:baseVc animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *bg = [[UIView alloc] initWithFrame:cell.bounds];
    bg.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1];
    cell.selectedBackgroundView = bg;
    cell.backgroundColor = COLOR_CLEAR;
    cell.textLabel.textColor = COLOR_(@"11cd6e");
}

@end
