//
//  HeaderCollectionViewWaterfallCell.m
//  BabyProgram
//
//  Created by jie on 16/3/10.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "HeaderCollectionViewWaterfallCell.h"

#define INTERVAL   (CGRectGetWidth(self.contentView.frame)-80*3)/4


@implementation HeaderCollectionViewWaterfallCell

-(NSMutableArray *)iconArray
{
    
    if (!_iconArray)
    {
        _iconArray = [[NSMutableArray alloc]init];
        
        self.contentView.backgroundColor = [UIColor orangeColor];
        
        NSArray *iconArr = @[@"ic_brand_love@2x.png",@"ic_my_circle@2x.png",@"ic_my_footprint@2x.png"];
        
        NSArray *titleArr = @[@"我的收藏",@"我的圈儿",@"我的足迹"];
        
        UIButton *btn = nil;
        for (int i = 0; i <3; i ++)
        {
            
            _iconBtn= [UIButton buttonWithType:UIButtonTypeCustom];
            
            
            _iconBtn.imageView.image = nil;
            _iconBtn.titleLabel.text = nil;
            
            //图片
            _iconBtn.imageEdgeInsets = UIEdgeInsetsMake(10,28,20,0);
            
            [_iconBtn setImage:[UIImage imageNamed:iconArr[i]] forState:UIControlStateNormal];
            
            [_iconBtn setTitle:titleArr[i] forState:UIControlStateNormal];
            //文字
            _iconBtn.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
            _iconBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            _iconBtn.titleLabel.font =[UIFont systemFontOfSize:10];
            
            [self.contentView addSubview:_iconBtn];
            
            _iconBtn.translatesAutoresizingMaskIntoConstraints = NO;
            
            [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 //配置具体的约束信息
                 if (i == 0)
                 {
                     make.left.equalTo(self.contentView.mas_left).with.offset(INTERVAL);
                 }
                 else
                 {
                     
                     make.left.equalTo(btn.mas_right).with.offset(INTERVAL);
                 }
                 
                 make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-20.f);
                 make.height.equalTo(@80);
                 make.width.equalTo(@80);
             }];
            
            //记录上次循环的button
            btn = _iconBtn;
            
            [_iconArray addObject:_iconBtn];
        }
 
    }
    
    return _iconArray;
    
}

-(NSMutableArray *)loginArray
{
    if (!_loginArray)
    {
        _loginArray = [[NSMutableArray alloc]init];
        
        NSArray *loginArr = @[@"立即登录",@"新人注册"];
        NSArray *colorArr =@[[UIColor whiteColor],[UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:23.0/255.0 alpha:1.0]];
        
        
        UIButton *loginBtn =nil;
        for (int i = 0 ; i < 2 ; i++)
        {
            _loginRegBtn =[UIButton buttonWithType:UIButtonTypeCustom];
            
            [_loginRegBtn setTitle:loginArr[i] forState:UIControlStateNormal];
            _loginRegBtn.layer.cornerRadius =10;
            _loginRegBtn.layer.masksToBounds =YES;
            _loginRegBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [_loginRegBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _loginRegBtn.backgroundColor = colorArr[i];
            
            _loginRegBtn.tag =i+1;
            
            [self.contentView addSubview:_loginRegBtn];
            
            [_loginRegBtn mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 if (i == 0)
                 {
                     make.left.equalTo(self.contentView.mas_left).with.offset(100);
                 }
                 else
                 {
                     make.left.equalTo(loginBtn.mas_right).with.offset(20);
                 }
                 make.top.equalTo(self.contentView.mas_top).with.offset(20.f);
                 make.height.equalTo(@40);
                 make.width.equalTo(@80);
                 
             }];
            //记录上次循环的button
            loginBtn = _loginRegBtn;
        [_loginArray addObject:_loginRegBtn];
            
        } 
    }
       return _loginArray;

}




@end
