//
//  KMCustomGifFooter.m
//  QianLongZan
//
//  Created by kimeeos on 16/9/29.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "KMCustomGifFooter.h"
#import "KMRefreshImage.h"

@implementation KMCustomGifFooter

+ (instancetype)footerWithRefreshingCallBack:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    KMCustomGifFooter *footer = [[KMCustomGifFooter alloc] init];
    footer.refreshingBlock = refreshingBlock;
    footer.stateLabel.hidden = NO;
    footer.stateLabel.font = Font11;
    footer.stateLabel.textColor = COLOR_GRAY;
    [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"——  END  ——" forState:MJRefreshStateNoMoreData];
    
    // 效果不太好，隐藏图片动画吧
//    [footer setImages:KMIMAGES forState:MJRefreshStateIdle]; // 停顿动画
//    [footer setImages:KMIMAGES forState:MJRefreshStatePulling]; // 下拉动画
//    [footer setImages:KMIMAGES forState:MJRefreshStateRefreshing]; // 刷新动画
    
    return footer;
}

#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 40;
}

#pragma mark 在这里设置子控件的位置和尺寸
//- (void)placeSubviews
//{
//    [super placeSubviews];
//    UIImageView *imageView = nil;
//    UILabel *stateLabel = nil;
//    
//    for (UIView *view in self.subviews) {
//        if ([view isKindOfClass:[UIImageView class]]) {
//            imageView = (UIImageView *)view;
//            [imageView setContentMode:UIViewContentModeCenter];
//        }
//        
//        if ([view isKindOfClass:[UILabel class]] && view.hidden == NO) {
//            stateLabel = (UILabel *)view;
//        }
//    }
//    
//    imageView.bounds = CGRectMake(0, 0, self.mj_h * 0.6 - 10.0f, self.mj_h * 0.6 - 10.0f);
//    imageView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5 - 5.0f);
//    stateLabel.frame = CGRectMake(0, self.mj_h * 0.6 + 5.0f, self.mj_w, self.mj_h * 0.4);
//}

@end
