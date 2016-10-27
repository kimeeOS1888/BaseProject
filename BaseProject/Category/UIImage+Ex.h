//
//  UIImage+Common.h
//  Catering
//
//  Created by apple_administrator on 16/3/23.
//  Copyright © 2016年 TeYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

+ (UIImage *)imageWithColor:(UIColor *)aColor;
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
- (UIImage*)scaledToSize:(CGSize)targetSize;
- (UIImage*)scaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
- (UIImage*)scaledToMaxSize:(CGSize )size;
- (UIImage *)convertToGrayscale;
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;
- (instancetype)original;

@end
