//
//  AppDelegate.m
//  ios_facebook_notifications
//
//  Created by Stanley Ng on 7/8/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessengerViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeStatusBar];
    [self customizeTabBarController];
    [self customizeWindow];
    
    return YES;
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

- (void)customizeWindow
{
    /*
    LoginViewController *vc = [[LoginViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
     */
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
}

- (void)customizeStatusBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)customizeTabBarController
{
    // Create view controllers
    
    UIViewController *feedViewController = [[FeedViewController alloc] init];
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];

    UIViewController *requestsViewController = [[RequestsViewController alloc] init];
    UINavigationController *requestsNavigationController = [[UINavigationController alloc] initWithRootViewController:requestsViewController];
    
    UIViewController *messengerViewController = [[MessengerViewController alloc] init];
    UINavigationController *messengerNavigationController = [[UINavigationController alloc] initWithRootViewController:messengerViewController];

    UIViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];
    
    UIViewController *moreViewController = [[MoreViewController alloc] init];
    UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    
    // Configure the tab bar controller
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[
                                         feedNavigationController,
                                         requestsNavigationController,
                                         messengerNavigationController,
                                         notificationsNavigationController,
                                         moreNavigationController
                                        ];
    
    // Configure the tab bar items
    

    self.tabBarController = tabBarController;
}

@end
