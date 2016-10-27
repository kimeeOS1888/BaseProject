//
//  KMRefreshHelper.m
//  QianLongZan
//
//  Created by kimeeos on 16/9/29.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "KMRefreshImage.h"

@implementation KMRefreshImage

+ (NSArray *)creatImages {
    NSMutableArray *images = [@[] mutableCopy];
    for (int i = 1; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", @(i)]];
        if (image == nil) {
            continue;
        }
        [images addObject:image];
    }
    
    return images;
}

@end
