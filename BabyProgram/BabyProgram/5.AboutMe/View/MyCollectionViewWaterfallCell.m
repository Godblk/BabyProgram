//
//  MyCollectionViewWaterfallCell.m
//  BabyProgram
//
//  Created by jie on 16/3/10.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "MyCollectionViewWaterfallCell.h"


@implementation MyCollectionViewWaterfallCell

- (UIImageView *)iconImg
{
    if (!_iconImg)
    {
        _iconImg = [[UIImageView alloc] init];
        [self addSubview:_iconImg];
    }
    
    [_iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10.f);
        make.left.equalTo(self.mas_left).with.offset(26.f);
        make.width.equalTo(@35);
        make.height.equalTo(@35);
    }];
    
    
    return _iconImg;
}

- (UILabel *)iconLabel
{
    if (!_iconLabel)
    {
        _iconLabel = [[UILabel alloc] init];
        _iconLabel.font = [UIFont systemFontOfSize:10];
        _iconLabel.textColor = [UIColor grayColor];
        [self addSubview:_iconLabel];
    }
    
    [_iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImg.mas_top).with.offset(30.f);
        make.left.equalTo(_iconImg.mas_left).with.offset(-4.f);
        make.width.equalTo(@80);
        make.height.equalTo(@35);
    }];
    
    
    return _iconLabel;
}




@end
