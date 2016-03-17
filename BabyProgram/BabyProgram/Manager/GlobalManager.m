//
//  GlobalManager.m
//  YiChat
//
//  Created by SuperWang on 16/1/7.
//  Copyright (c) 2016年 智游. All rights reserved.
//

#import "GlobalManager.h"

@implementation GlobalManager
//单例的开放入口,便于外部访问
+(GlobalManager*)sharedManager
{
    static GlobalManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GlobalManager alloc]init];
    });
    return manager;
}

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//loading视图的封装
-(void)showHUDWithMsg:(NSString*)msg view:(UIView *)view
{
    if (!HUD)
    {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    HUD.labelText = msg;
    [HUD show:YES];
}

//纯文字的
-(void)showTestHUDWithMsg:(NSString*)msg view:(UIView *)view
{
    if (!HUD)
    {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = msg;
    [HUD show:YES];
    //定制消失时间
    [HUD hide:YES afterDelay:1];
    HUD = nil;
}

-(void)hideHUD
{
    [HUD hide:YES];
    HUD = nil;
}


@end
