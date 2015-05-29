//
//  AppDelegate.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/1/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "AppDelegate.h"
#import <RedditKit/RedditKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    NSString *postTime = [userInfo objectForKey:@"post"];
    
    __block UIBackgroundTaskIdentifier watchKitHandler;
    watchKitHandler = [[UIApplication sharedApplication] beginBackgroundTaskWithName:@"backgroundTask" expirationHandler:^{
        watchKitHandler = UIBackgroundTaskInvalid;
    }];
    
    if ([[userInfo objectForKey:@"request"] isEqualToString:@"post"]) {
        NSLog(@"delegate fired");
//        [[RKClient sharedClient] submitSelfPostWithTitle:postTime subredditName:@"test" text:nil captchaIdentifier:nil captchaValue:nil completion:^(NSError *error) {
//            if (error) {
//                NSLog(@"ERROR!");
//                NSLog([NSString stringWithFormat:@"there was an error: %@", error]);
//            } else {
//                NSLog(@"Post Success!");
//            }
//        }];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[UIApplication sharedApplication] endBackgroundTask:watchKitHandler];
    });
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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
