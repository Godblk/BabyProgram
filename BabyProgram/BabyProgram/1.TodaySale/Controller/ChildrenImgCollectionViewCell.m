//
//  ChildrenImgCollectionViewCell.m
//  BabyProgram
//
//  Created by jie on 16/3/13.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "ChildrenImgCollectionViewCell.h"
#import "Masonry.h"

@implementation ChildrenImgCollectionViewCell
- (UIImageView *)goodsImg
{
    if (!_goodsImg)
    {
        _goodsImg = [[UIImageView alloc] init];
        [self addSubview:_goodsImg];
    }
    
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(5.f);
        make.left.equalTo(self.contentView.mas_left).with.offset(5.f);
        make.right.equalTo(self.contentView.mas_right).with.offset(-5.f);
        make.height.equalTo(@180);
    }];
    
    
    return _goodsImg;
}

- (UILabel *)goodsLabel
{
    if (!_goodsLabel)
    {
        _goodsLabel = [[UILabel alloc] init];
        _goodsLabel.font = [UIFont systemFontOfSize:18];
        _goodsLabel.textColor = [UIColor redColor];
        [self addSubview:_goodsLabel];
    }
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsImg.mas_bottom).with.offset(1.f);
        make.left.equalTo(self.contentView.mas_left).with.offset(5.f);
        make.width.equalTo(@(70));
        make.height.equalTo(@30);
    }];
    
    return _goodsLabel;
}

- (UILabel *)goodsDetailLabel
{
    if (!_goodsDetailLabel)
    {
        _goodsDetailLabel = [[UILabel alloc] init];
        _goodsDetailLabel.font = [UIFont systemFontOfSize:16];
        _goodsDetailLabel.textColor = [UIColor grayColor];
        [self addSubview:_goodsDetailLabel];
    }
    
    [_goodsDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsLabel.mas_top).with.offset(1.f);
        make.left.equalTo(_goodsLabel.mas_right).with.offset(5.f);
        make.width.equalTo(@(200));
        make.height.equalTo(@30);
    }];
    
    return _goodsDetailLabel;
}
@end
