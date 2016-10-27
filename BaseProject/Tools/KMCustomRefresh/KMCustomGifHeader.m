//
//  KMCustomGifHeader.m
//  QianLongZan
//
//  Created by kimeeos on 16/9/29.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "KMCustomGifHeader.h"
#import "KMRefreshImage.h"

@interface KMCustomGifHeader ()

@end

@implementation KMCustomGifHeader

+ (instancetype)headerWithRefreshingCallBack:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    KMCustomGifHeader *header = [[KMCustomGifHeader alloc] init];
    header.refreshingBlock = refreshingBlock;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = NO;
    header.stateLabel.font = Font11;
    header.stateLabel.textColor = COLOR_GRAY;
    [header setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
    [header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    [header setImages:KMIMAGES forState:MJRefreshStateIdle]; // 停顿动画
    [header setImages:KMIMAGES forState:MJRefreshStatePulling]; // 下拉动画
    [header setImages:KMIMAGES forState:MJRefreshStateRefreshing]; // 刷新动画
    
    return header;
}

#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 70;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    UIImageView *imageView = nil;
    UILabel *stateLabel = nil;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            imageView = (UIImageView *)view;
            [imageView setContentMode:UIViewContentModeCenter];
        }
        
        if ([view isKindOfClass:[UILabel class]] && view.hidden == NO) {
            stateLabel = (UILabel *)view;
        }
    }

    imageView.bounds = CGRectMake(0, 0, self.mj_h * 0.6 - 10.0f, self.mj_h * 0.6 - 10.0f);
    imageView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5 - 10.0f);
    stateLabel.frame = CGRectMake(0, self.mj_h * 0.6, self.mj_w, self.mj_h * 0.4);
}

@end
