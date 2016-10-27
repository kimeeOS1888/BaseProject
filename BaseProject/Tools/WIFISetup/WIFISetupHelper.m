//
//  WIFISetupHelper.m
//  BaseProject
//
//  Created by wujianming on 16/10/17.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "WIFISetupHelper.h"
#import "WIFISetup.h"

@interface WIFISetupHelper ()<UITableViewDelegate, UITableViewDataSource>

@property (copy, nonatomic) NSString *cacheURL;

@end

@implementation WIFISetupHelper

static NSString *identifier = @"WIFISetupCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (void)checkHostCache {
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSDictionary *dic in HOST_MENUS) {
        [temp addObject:dic.allValues.firstObject];
    }
    
    if (![temp containsObject:HOST_CACHE]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:HOST_KEY];
        #ifdef DEBUG
        CACHE_HOST(temp.firstObject) // 默认环境设置
        #else
        CACHE_HOST(temp.lastObject) // 默认环境设置
        #endif
    }
}

- (void)commonInit {
    // 获取缓存路径
    _cacheURL = HOST_CACHE;
    
    // 检查当前路径集合中是否存在当前缓存
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSDictionary *dic in HOST_MENUS) {
        [temp addObject:dic.allValues.firstObject];
    }
    
    if (![temp containsObject:_cacheURL] && _cacheURL != nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:HOST_KEY];
        _cacheURL = nil;
    }
    
    // 自定义导航控制器
    [self.view addSubview:self.km_navigationBar];
    [self.km_navigationBar.titleItem setTitle:@"HOST设置" forState:UIControlStateNormal];
    [self.km_navigationBar.rightItem setTitle:@"完成" forState:UIControlStateNormal];
    
    WEAKSELF(weakSelf)
    [self.km_navigationBar rightItemActionCompletion:^(UIButton *item) {
        [weakSelf dismissViewControllerAnimated:weakSelf completion:nil];
    }];
    
    // 表体
    self.tableViewStype = UITableViewStyleGrouped;
    self.tableViewFrame = CGRectMake(0, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT);
    self.km_tableView.delegate = self;
    self.km_tableView.dataSource = self;
    [self.view addSubview:self.km_tableView];
    [self.km_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.km_tableView.rowHeight = 50.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return HOST_MENUS.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = HOST_MENUS[section];
    return dic.allValues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary *dic = HOST_MENUS[indexPath.section];
    cell.textLabel.text = dic.allValues[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (_cacheURL == nil && indexPath.section == 0) {
        // 缓存HOST为空，默认为首个路径
        CACHE_HOST(dic.allValues.firstObject)
        _cacheURL = dic.allValues.firstObject;
    }
    
    if ([dic.allValues[indexPath.row] isEqual:_cacheURL]) {
        cell.textLabel.textColor = COLOR_CD_RED;
    }
    else {
        cell.textLabel.textColor = COLOR_BLACK;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = HOST_MENUS[section];
    
    UIButton *header = [UIButton buttonWithType:UIButtonTypeCustom];
    header.titleLabel.font = Font13;
    [header setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
    [header setTitle:dic.allKeys[0] forState:UIControlStateNormal];
    [header setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [header setTitleEdgeInsets:(UIEdgeInsets){0,15,0,0}];
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = HOST_MENUS[indexPath.section];
    _cacheURL = dic.allValues[indexPath.row];
    [self.km_tableView reloadData];
    CACHE_HOST(dic.allValues[indexPath.row])
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
