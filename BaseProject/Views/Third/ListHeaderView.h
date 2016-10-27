//
//  ListHeaderView.h
//  BaseProject
//
//  Created by kimeeos on 16/9/22.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedItemBlock)(NSInteger index);

@interface ListHeaderView : UIView

@property (copy, nonatomic) NSArray *titles;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) UIView *sliderView;
@property (strong, nonatomic) UIView *bottomView;

- (void)selectedItemCompletion:(SelectedItemBlock)completion;

@end
