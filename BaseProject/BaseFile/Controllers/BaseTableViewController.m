//
//  BaseTableViewController.m
//  BaseProject
//
//  Created by wujianming on 16/9/23.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)baseInit {
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = COLOR_VIEW_BACKGROUND;
    [self.tableView setSeparatorInset:(UIEdgeInsets){0, 600, 0, 0}];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setSeparatorInset:(UIEdgeInsets){0, 10, 0, 10}];
}

@end
