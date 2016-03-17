//
//  TodaySaleRequest.m
//  BabyProgram
//
//  Created by jie on 16/3/4.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "TodaySaleRequest.h"
#import "AFNetworking.h"

#define RINGRECOMMENTDATA  @"http://api.beibei.com/gateway/route.html?method=beibei.ctc.timeline.recommend.get&client_info=%7B%0A%20%20%22screen%22%20%3A%20%22320x568%22%2C%0A%20%20%22os%22%20%3A%20%228.4%22%2C%0A%20%20%22platform%22%20%3A%20%22iPhone%22%2C%0A%20%20%22model%22%20%3A%20%22iPod%20touch%22%2C%0A%20%20%22udid%22%20%3A%20%22e1f001a30bddb5a3ada73ccdafca8aedf68f25b0%22%2C%0A%20%20%22bd%22%20%3A%20%22App%20Store%22%2C%0A%20%20%22version%22%20%3A%20%223.9.2%22%2C%0A%20%20%22dn%22%20%3A%20%22iPod%20touch%22%0A%7D&"
#define RINGPAGEDATA @"page=1&sign=0E749A4ABA2E754E2FFAE0B7ED0F394C&timestamp=1457746849&page_size=20"

@implementation TodaySaleRequest
//1.今日特卖 --上新
+(void)onTheNewRequest:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlStr =@"http://sapi.beibei.com/resource/ads-iPhone-2147483646-App%20Store-19_42_36_59_7_5_28_1_22_3_53_43_91_58_54_6-3.9.2-0.html";
    
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObjectDic) {
        if (complete)
        {
            complete (responseObjectDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        //NSLog(@"error : %@",error);
    }];
}

//1.2今日特卖 --童装
+(void)onTheChildren:(NSInteger)tag  cBlock:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
  
     NSArray *urlArr1 =@[@"http://sapi.beibei.com/martshow/search/1-30-dress---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-dress---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-shoes---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-babythings---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-toy---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-woman_dress---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-house---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-food---0-1.html",@"http://sapi.beibei.com/martshow/search/1-30-beauty---0-1.html",@"http://sapi.beibei.com/martshow/last_get/1-30.html",@"http://sapi.beibei.com/martshow/search/1-30-tomorrow---0-1.html"];
     
    [manager GET:urlArr1[tag] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        //
        if (complete)
        {
            complete(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        //NSLog(@"error : %@",error);
    }];
}

//1.3童装公共界面
+(void)onTheCommandChildren:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSString *urlStr =@"http://sapi.beibei.com/resource/ads-iPhone-2147483646-App%20Store-51_52_8-3.9.2-0.html";
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObjectDic) {
        //
        if (complete)
        {
            complete(responseObjectDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
    
    
}

//1.4搜索界面--分类
+(void)searchClassRequest:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlStr = @"http://sapi.beibei.com/item/category-3-0.html";
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObjectDic) {
        if (complete) {
            complete(responseObjectDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}
//1.5搜索界面--品牌
+(void)searchBrandRequest:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager  *manager = [AFHTTPSessionManager manager];
    NSString *urlStr = @"http://sapi.beibei.com/martshow/all_names/1.html";
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObjectDic) {
        //
        if (complete)
        {
            complete(responseObjectDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
         NSLog(@"error:%@",error);
    }];
    
    
}

//圈界面
+(void)onTheRingRequest:(void(^)(NSDictionary *dic))complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   // NSString *str =[NSString stringWithFormat:RINGPAGEDATA,page];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",RINGRECOMMENTDATA,RINGPAGEDATA];
    
    [manager GET:strUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObjectDic) {
        //
        if (complete)
        {
            complete(responseObjectDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
          NSLog(@"error:%@",error);
    }];
}


@end
