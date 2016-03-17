//
//  GlobalManager.h
//  YiChat
//
//  Created by SuperWang on 16/1/7.
//  Copyright (c) 2016年 智游. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
//公共数据的单例
@interface GlobalManager : NSObject
{
    MBProgressHUD *HUD;
}
@property(nonatomic,retain)NSIndexPath *selectedIndex;
+(GlobalManager*)sharedManager;
-(void)showHUDWithMsg:(NSString*)msg view:(UIView *)view;
-(void)showTestHUDWithMsg:(NSString*)msg view:(UIView *)view;
-(void)hideHUD;
@end
