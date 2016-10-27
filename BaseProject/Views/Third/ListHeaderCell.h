//
//  ListHeaderCell.h
//  BaseProject
//
//  Created by kimeeos on 16/9/22.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)(UIButton *selectedItem);

@interface ListHeaderCell : UICollectionViewCell

@property (strong, nonatomic) UIButton *item;
- (void)selectedItemCompletion:(SelectedBlock)completion;

@end
