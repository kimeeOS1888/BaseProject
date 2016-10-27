//
//  WIFISetup.h
//  BaseProject
//
//  Created by wujianming on 16/10/17.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#ifndef WIFISetup_h
#define WIFISetup_h

#define HOST_KEY           @"DebugHost"
#define HOST_CACHE         [[NSUserDefaults standardUserDefaults] objectForKey:HOST_KEY]
#define CACHE_HOST(urlStr) [[NSUserDefaults standardUserDefaults] setObject:urlStr forKey:HOST_KEY];\
                           [[NSUserDefaults standardUserDefaults] synchronize];

#define HOST_MENUS       @[@{@"开发环境" : @"http://192.168.201.191:201"}, \
                           @{@"测试环境" : @"http://192.168.202.191:201"}, \
                           @{@"正式环境" : @"http://192.168.203.191:201"}]

#endif /* WIFISetup_h */
