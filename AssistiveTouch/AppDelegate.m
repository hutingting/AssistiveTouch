//
//  AppDelegate.m
//  AssistiveTouch
//
//  Created by 胡廷廷 on 15/12/23.
//  Copyright © 2015年 hutingting. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()<AssistiveTouchDelegate>

@end

@implementation AppDelegate{
    UIImageView *_imageView;
    UILabel *_lbTitle;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    _assistive = [[AssistiveTouch alloc] initWithFrame:CGRectMake(0, 0, 40, 60) imageName:@"kf_00.png"];
//    _assistive.delegate = self;
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

///
/**
 *  浮窗点击事件
 */
-(void)assistiveTocuhs{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1008611"]];
}

@end
