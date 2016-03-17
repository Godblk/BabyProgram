//
//  RingTopCollectionViewCell2.m
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RingTopCollectionViewCell2.h"
#import "Masonry.h"

#define INTERVAL   (CGRectGetWidth(self.contentView.frame)-80*3)/4

@implementation RingTopCollectionViewCell2

- (UIButton *)iconBtn2
{
    self.contentView.backgroundColor = [UIColor orangeColor];
    NSArray *iconArr = @[@"ic_brand_love@2x.png",@"ic_my_circle@2x.png",@"ic_my_footprint@2x.png"];
    NSArray *titleArr = @[@"我的收藏",@"我的圈儿",@"我的足迹"];
    
    
    UIButton *btn = nil;
    for (int i = 0; i <3; i ++)
    {
        _iconBtn2= [UIButton buttonWithType:UIButtonTypeCustom];
        //图片
        _iconBtn2.imageEdgeInsets = UIEdgeInsetsMake(10,28,20,0);
        [_iconBtn2 setImage:[UIImage imageNamed:iconArr[i]] forState:UIControlStateNormal];
        
        [_iconBtn2 setTitle:titleArr[i] forState:UIControlStateNormal];
        //文字
        _iconBtn2.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
        _iconBtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
        _iconBtn2.titleLabel.font =[UIFont systemFontOfSize:10];
        
        [self.contentView addSubview:_iconBtn2];
        
        _iconBtn2.translatesAutoresizingMaskIntoConstraints = NO;
        [_iconBtn2 mas_makeConstraints:^(MASConstraintMaker *make)
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
        btn = _iconBtn2;
        
    }

    return _iconBtn2;
    
}

@end
