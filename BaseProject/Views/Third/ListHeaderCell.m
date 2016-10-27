//
//  ListHeaderCell.m
//  BaseProject
//
//  Created by kimeeos on 16/9/22.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "ListHeaderCell.h"

@interface ListHeaderCell ()

@property (copy, nonatomic) SelectedBlock callBack;

@end

@implementation ListHeaderCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_WHITE;
        
        self.item = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.item.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self.item setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
        [self.item setTitleColor:COLOR_RED forState:UIControlStateSelected];
        [self addSubview:self.item];
        
        [self.item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self.item addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)selectedAction:(UIButton *)btn {
    if (_callBack) {
        _callBack(btn);
    }
}

- (void)selectedItemCompletion:(SelectedBlock)completion {
    _callBack = completion;
}

@end
