//
//  TYDistributionCell.m
//  QianLongZan
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "TYDistributionCell.h"

@implementation TYDistributionCell

static NSString *identifier = @"TYDistributionCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    TYDistributionCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TYDistributionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
