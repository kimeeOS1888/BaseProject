//
//  ListHeaderView.m
//  BaseProject
//
//  Created by kimeeos on 16/9/22.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "ListHeaderView.h"
#import "ListHeaderCell.h"

@interface ListHeaderView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *listView;
@property (strong, nonatomic) UIButton *selectedItem;
@property (copy, nonatomic) SelectedItemBlock callBack;

@end

@implementation ListHeaderView

static NSString *identifier = @"ListHeaderCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.listView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.listView.backgroundColor = COLOR_WHITE;
        self.listView.delegate = self;
        self.listView.dataSource = self;
        [self.listView registerClass:[ListHeaderCell class] forCellWithReuseIdentifier:identifier];
        [self addSubview:self.listView];
        
        [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        self.sliderView = [[UIView alloc] init];
        self.sliderView.backgroundColor = COLOR_RED;
        [self addSubview:self.sliderView];
        
        self.bottomView = [[UIView alloc] init];
        self.bottomView.backgroundColor = COLOR_VIEW_BACKGROUND;
        [self addSubview:self.bottomView];
        
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.right.mas_equalTo(self.mas_right);
            make.height.mas_equalTo(0.5);
        }];
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // 初始化数组赋值完成，得到数组个数
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10.0);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(self.listView.bounds.size.width / self.titles.count - 20.0);
        make.height.mas_equalTo(2.0);
    }];
    
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ListHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.item setTitle:self.titles[indexPath.row] forState:UIControlStateNormal];
    
    WEAKSELF(weakSelf)
    [cell selectedItemCompletion:^(UIButton *selectedItem) {
        weakSelf.selectedItem.selected = NO;
        selectedItem.selected = YES;
        weakSelf.selectedItem = selectedItem;
        
        // 移动滑条
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.sliderView.layer.transform = CATransform3DMakeTranslation(cell.bounds.size.width * indexPath.row, 0, 0);
        }];
        
        if (weakSelf.callBack) {
            weakSelf.callBack(indexPath.row);
        }
    }];
    
    if (indexPath.row == _selectedIndex) {
        cell.item.selected = YES;
        self.selectedItem = cell.item;
        self.sliderView.layer.transform = CATransform3DMakeTranslation(cell.bounds.size.width * indexPath.row, 0, 0);
    }
    else {
        cell.item.selected = NO;
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH / self.titles.count, collectionView.bounds.size.height);
}

- (void)selectedItemCompletion:(SelectedItemBlock)completion {
    _callBack = completion;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self.listView reloadData];
}

@end
