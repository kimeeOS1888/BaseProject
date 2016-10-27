//
//  AppDelegate.m
//  BaseProject
//
//  Created by wujianming on 16/9/21.
//  Copyright © 2016年 szteyou. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "WIFISetupHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    RootViewController *rootVc = [[RootViewController alloc] init];
    self.window.rootViewController = rootVc;
    [self.window makeKeyAndVisible];
    // HOST设置
    [WIFISetupHelper checkHostCache];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
