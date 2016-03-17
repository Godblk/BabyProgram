//
//  AppDelegate.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "AppDelegate.h"
#import "TodaySaleViewController.h"
#import "GlobalBuyViewController.h"
#import "RingViewController.h"
#import "ShoppingCarViewController.h"
#import "AboutMeViewController.h"
#import "RegisterViewController.h"

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//新浪微博SDK头文件
#import "WeiboSDK.h"
//微信SDK头文件
#import "WXApi.h"
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
      
//    //NSLog(@"沙盒路径: %@",NSHomeDirectory());
  
   
    
    //跳转到tabbar布局页面--1
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    [self customizeInterface];
    
    //* -----------------------新浪集成--------------------------- *
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     */
    
    [ShareSDK registerApp:@"iosv1101"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ),
                            ]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
                 
                default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"1792910695"
                                           appSecret:@"519d2c4c81a07921bb6b1751d81dc44e"
                                         redirectUri:@"http://www.sharesdk.cn"
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 //微信
                 [appInfo SSDKSetupWeChatByAppId:@"wx5a82c8ebdf55f16d"
                                       appSecret:@"b76173571e70f53e3d8bb3b70f96d665"];
                 break;
             case SSDKPlatformTypeQQ:
                 //腾讯QQ
                 [appInfo SSDKSetupQQByAppId:@"1105055930"
                                      appKey:@"xPBUIoIPlIVP2rQZ"
                                    authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeRenren:
                 [appInfo        SSDKSetupRenRenByAppId:@"226427"
                                                 appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                                              secretKey:@"f29df781abdd4f49beca5a2194676ca4"
                                               authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeGooglePlus:
                 [appInfo SSDKSetupGooglePlusByClientID:@"232554794995.apps.googleusercontent.com"
                                           clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                            redirectUri:@"http://localhost"
                                               authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
    
    
    return YES;
}

#pragma mark - Methods
- (void)setupViewControllers
{
    //1.今日特卖
    UIViewController *todayVC = [[TodaySaleViewController alloc] init];
//    todayVC.title =@"今日特卖";
    UIViewController *todayNav = [[UINavigationController alloc]
                                                   initWithRootViewController:todayVC];
    todayNav.title = @"今日特卖";
    
    //2.全球购
    UIViewController *globalVC = [[GlobalBuyViewController alloc] init];
    globalVC.title =@"全球购";
    UIViewController *globalNav = [[UINavigationController alloc]
                                                    initWithRootViewController:globalVC];
    globalNav.title = @"全球购";
    
    //3.圈儿
    UIViewController *ringVC = [[RingViewController alloc] init];
    ringVC.title =@"圈儿";
    UIViewController *ringNav = [[UINavigationController alloc]
                                   initWithRootViewController:ringVC];
    ringNav.title = @"圈儿";
    
    //4.购物车
    UIViewController *shoppingVC = [[ShoppingCarViewController alloc] init];
    shoppingVC.title = @"购物车";
    UIViewController *shoppingNav = [[UINavigationController alloc]
                                                   initWithRootViewController:shoppingVC];
    shoppingNav.title = @"购物车";
    
    //5.我的
    UIViewController *aboutMeVC = [[AboutMeViewController alloc] init];
    aboutMeVC.title =@"我的";
    UIViewController *aboutMeNav = [[UINavigationController alloc]
                                     initWithRootViewController:aboutMeVC];
    aboutMeNav.title = @"我的";

    
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[todayNav, globalNav,ringNav,shoppingNav,aboutMeNav]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"ic_tabbar_home", @"ic_tabbar_oversea",@"ic_c2c_tab_weigou",@"ic_tabbar_shopping",@"ic_tabbar_my"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}

- (void)customizeInterface
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
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
