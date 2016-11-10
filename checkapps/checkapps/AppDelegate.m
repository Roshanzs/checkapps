//
//  AppDelegate.m
//  checkapps
//
//  Created by 紫贝壳 on 16/11/10.
//  Copyright © 2016年 紫贝壳. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray *allApplications = [workspace performSelector:@selector(allApplications)];
    //    NSLog(@"%@",allApplications);
    
    //    NSInteger count = 0;
    //    for (NSString *str in allApplications) {
    //        NSString *app = [NSString stringWithFormat:@"%@",str];
    //        NSRange rang = [app rangeOfString:@"YYKitDemo"];
    //        if (rang.length > 1) {
    //            count ++;
    //        }
    //    }
    //    if (count > 0) {
    //        NSLog(@"已经安装了YYKitDemo");
    //    }else{
    //        NSLog(@"未安装YYKitDemo");
    //    }
    
    
    
    //------------------------------------------------------------------------------------
    
    for (NSString *appstr in allApplications) {
        NSString *s = [NSString stringWithFormat:@"%@",appstr];
        NSRange startRange;
        NSRange endRange;
        startRange = [s rangeOfString:@"Application/"];
        endRange = [s rangeOfString:@".app>"];
        
        if (startRange.length > 1) {
            NSRange range = NSMakeRange(startRange.location + 49, endRange.location - startRange.location -49);
            NSLog(@"已经安装了%@",[s substringWithRange:range]);
        }
        
        
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
