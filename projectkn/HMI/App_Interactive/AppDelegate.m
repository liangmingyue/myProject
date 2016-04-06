//
//  AppDelegate.m
//  projectkn
//
//  Created by xie minna on 14-2-8.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

//当程序完成载入后调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    // Override point for customization after application launch.
    ViewController *vc = [[ViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 4;
//    //1.设置icon上的数字图标
//    //设置主界面icon上的数字图标，在2.0中引进， 缺省为0
//    
//    //2.设置摇动手势的时候，是否支持redo,undo操作
//    
//    //摇动手势，是否支持redo undo操作。
//    //3.0以后引进，缺省YES
//    [UIApplication sharedApplication].applicationSupportsShakeToEdit =YES;
//    
//    //3.判断程序运行状态
//    
//    //判断程序运行状态，在2.0以后引入
//    
//    if([UIApplication sharedApplication].applicationState ==UIApplicationStateInactive){
//        NSLog(@"程序在运行状态");
//    }
//    
//    //4.阻止屏幕变暗进入休眠状态
//    //阻止屏幕变暗，慎重使用,缺省为no 2.0
////    [UIApplication sharedApplication].idleTimerDisabled =YES;
//    // 慎重使用本功能，因为非常耗电。
//    
//    //5.显示联网状态
//    
//    //显示联网标记 2.0
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    
//    //6.在map上显示一个地址
//    NSString* addressText =@"1 Infinite Loop, Cupertino, CA 95014";
//    // URL encode the spaces
//    addressText =  [addressText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
//    NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];
//    
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlText]];
//    
//    NSString *recipients =@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=Hello from California!";
//    NSString *body =@"&body=It is raining in sunny California!";
//    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
//    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:email]];
//    
//    //8.打电话到一个号码
//    // Call Google 411
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://8004664411"]];
    
   // 9.发送短信
    // Text to Google SMS
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://466453"]];
    
    return YES;
}

//应用程序转为后台（非激活）状态时被调用
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//当程序从后台将要重新回到前台时候调用，这个刚好跟上面的那个方法相反。
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//应用程序转为激活状态时被调用
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// try to clean up as much memory as possible. next step is to terminate app//内存较低时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application;      
{

}

// midnight, carrier time update, daylight savings time change //当系统时间发生改变时执行
- (void)applicationSignificantTimeChange:(UIApplication *)application;

{

}

//请求委托打开一个URL资源
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
 
    return YES;
}

//当一个运行着的应用程序收到一个远程的通知 发送到委托去...
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0)
{

}

//当一个运行着的程序接受一个本地的通知时执行
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

{

}
@end
