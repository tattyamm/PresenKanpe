//
//  AppDelegate.m
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "KanpeViewController.h"
#import "AboutViewController.h"

@implementation AppDelegate
@synthesize window = window_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //ここから前の部分
    // windowを自分で作成
    CGRect bounds = [[UIScreen mainScreen] bounds];
    window_ = [[UIWindow alloc] initWithFrame:bounds];
    
    // ViewController1とViewController2を作成して、
    // そのviewをそれぞれwindowに追加
    mainViewController_ = [[MainViewController alloc] init];
    kanpeViewController_ = [[KanpeViewController alloc] init];
    aboutViewController_ = [[AboutViewController alloc] init];
    [window_ addSubview:mainViewController_.view];
    [window_ addSubview:kanpeViewController_.view];
    [window_ addSubview:aboutViewController_.view];
    
    // ViewController1のほうのviewを前面に出す
    [window_ bringSubviewToFront:mainViewController_.view];
    [window_ makeKeyAndVisible];
    
    return 0;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc {
    [mainViewController_ release];
    [window_ release];
    [super dealloc];
}

@end
