//
//  BaseTableViewCell.m
//  BaseProject
//
//  Created by wujianming on 16/9/22.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

static NSString *identifier = @"BaseTableViewCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
