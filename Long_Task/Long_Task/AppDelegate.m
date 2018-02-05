//
//  AppDelegate.m
//  Long_Task
//
//  Created by qi on 05/02/2018.
//  Copyright © 2018 tvu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

// about background task
@property (nonatomic,unsafe_unretained) UIBackgroundTaskIdentifier backgroundTaskIdentifer;
@property (nonatomic,strong)NSTimer *homeQuitTimer;
@property (nonatomic,assign) NSTimeInterval enterBackTime;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s,%i",__func__,__LINE__);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"%s,%i",__func__,__LINE__);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%s,%i",__func__,__LINE__);
    
    
    
    self.backgroundTaskIdentifer = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    /* test app in background time */
    if (_homeQuitTimer == nil) {
        _homeQuitTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                          target:self
                                                        selector:@selector(timerMethod:)
                                                        userInfo:nil
                                                         repeats:YES];
    }
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"%s,%i",__func__,__LINE__);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%s,%i",__func__,__LINE__);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"%s,%i",__func__,__LINE__);
}

/** calculator rest of the time  */
- (void)timerMethod:(NSTimer *)paramSender
{
    NSTimeInterval backgroundTimeRemaining = [[UIApplication sharedApplication] backgroundTimeRemaining];
    if (backgroundTimeRemaining == DBL_MAX) {
        NSLog(@"Background Time Remaining = Undetermined..");
    }else{
        NSLog(@"Background Time Remaining = %.02f Seconds",backgroundTimeRemaining);
    }
    
}

@end
