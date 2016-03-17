//
//  RingTopCollectionViewCell1.m
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RingTopCollectionViewCell1.h"

#import "UIImageView+WebCache.h"
#define WIDTH   self.contentView.frame.size.width
#define HEIGHT  self.contentView.frame.size.height

@implementation RingTopCollectionViewCell1
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        // Initialization code
        // 创建scrollview 添加到view上
        _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
        _scrollerView.backgroundColor = [UIColor orangeColor];
        _scrollerView.delegate = self;
        self.contentView.clipsToBounds = YES;
        _scrollerView.clipsToBounds = NO;
        [self.contentView addSubview:_scrollerView];
        
        
        
        for (NSInteger i = 0; i <_imageArray.count; i ++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100 *i, 0, 100, 100)];
            // imageView.image = [UIImage imageNamed:imageArray[i]];
            [imageView sd_setImageWithURL:_imageArray[i]];
            [_scrollerView addSubview:imageView];
        }
        _scrollerView.contentSize = CGSizeMake(100 *_imageArray.count , 100);
        _scrollerView.pagingEnabled = YES;
        _scrollerView.contentOffset = CGPointMake(100 *6, 0);
        
    }

    return self;
}

@end
