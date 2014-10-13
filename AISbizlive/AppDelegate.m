//
//  AppDelegate.m
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#import "AppDelegate.h"
#import "AISGlobal.h"
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:self.session];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [defaults stringForKey:@"lang"];
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[AISColor lightgreenColor] CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UITabBar appearance] setBackgroundImage:image];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName ,[UIFont systemFontOfSize:12.0f],NSFontAttributeName, nil] forState:UIControlStateNormal];
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName ,[UIFont systemFontOfSize:12.0f],NSFontAttributeName, nil] forState:UIControlStateSelected];
    CGRect rect1 = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context1, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context1, rect1);
    
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[AISColor lightgreenColor],NSForegroundColorAttributeName ,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setBackgroundImage:image1 forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[AISColor lightgreenColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"Back_Arrow.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"Back_Arrow.png"]];
    
    [[UINavigationBar appearance] setShadowImage:image];
    if(!language)
    {
        [defaults setValue:@"EN" forKey:@"lang"];
        [defaults synchronize];
    }
    [defaults setObject:@"NO" forKey:@"login"];
    [defaults synchronize];
    // Override point for customization after application launch.
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

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppEvents activateApp];
    [FBAppCall handleDidBecomeActiveWithSession:self.session];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    
     [self.session close];
}

@end
