//
//  TodaySaleRequest.h
//  BabyProgram
//
//  Created by jie on 16/3/4.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodaySaleRequest : NSObject
//1.今日特卖 --上新
+(void)onTheNewRequest:(void(^)(NSDictionary *dic))complete;

//1.2今日特卖 --童装
+(void)onTheChildren:(NSInteger)tag  cBlock:(void(^)(NSDictionary *dic))complete;
//1.3童装公共界面
+(void)onTheCommandChildren:(void(^)(NSDictionary *dic))complete;
//1.4搜索界面
+(void)searchClassRequest:(void(^)(NSDictionary *dic))complete;
//1.5搜索界面
+(void)searchBrandRequest:(void(^)(NSDictionary *dic))complete;
//圈界面
+(void)onTheRingRequest:(void(^)(NSDictionary *dic))complete;

@end
