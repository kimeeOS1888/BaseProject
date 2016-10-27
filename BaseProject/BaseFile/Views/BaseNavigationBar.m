//
//  BaseNavigationBar.m
//  BaseProject
//
//  Created by wujianming on 16/10/11.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "BaseNavigationBar.h"

@interface BaseNavigationBar ()

@property (copy, nonatomic) ItemActionBlock leftCallBack;
@property (copy, nonatomic) ItemActionBlock rightCallBack;

@end

@implementation BaseNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_(@"F0F0F0");
        
        self.titleItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titleItem.userInteractionEnabled = NO;
        self.titleItem.titleLabel.font = Font18;
        [self.titleItem setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
        [self.titleItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [self addSubview:self.titleItem];
        
        [self.titleItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(20.0, 60, 0, 60.0));
        }];
        
        self.leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftItem.titleLabel.font = Font13;
        [self.leftItem setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
        [self.leftItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.leftItem setImageEdgeInsets:(UIEdgeInsets){0, 12, 0, 0}];
        [self addSubview:self.leftItem];
        
        [self.leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.top.mas_equalTo(20.0);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.right.mas_equalTo(self.titleItem.mas_left).offset(-5.0);
        }];
        
        [self.leftItem addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightItem.titleLabel.font = Font13;
        [self.rightItem setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
        [self.rightItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [self.rightItem setImageEdgeInsets:(UIEdgeInsets){0, 0, 0, 12}];
        [self.rightItem setTitleEdgeInsets:(UIEdgeInsets){0, 0, 0, 12}];
        [self addSubview:self.rightItem];
        
        [self.rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleItem.mas_right).offset(5.0);
            make.top.mas_equalTo(20.0);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.right.mas_equalTo(self.mas_right);
        }];
        
        [self.rightItem addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)leftItemAction:(UIButton *)btn {
    if (_leftCallBack) {
        _leftCallBack(btn);
    }
}

- (void)rightItemAction:(UIButton *)btn {
    if (_rightCallBack) {
        _rightCallBack(btn);
    }
}

- (void)leftItemActionCompletion:(ItemActionBlock)completion {
    _leftCallBack = completion;
}

- (void)rightItemActionCompletion:(ItemActionBlock)completion {
    _rightCallBack = completion;
}

@end
