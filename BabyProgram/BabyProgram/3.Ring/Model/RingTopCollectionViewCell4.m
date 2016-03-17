//
//  RingTopCollectionViewCell4.m
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RingTopCollectionViewCell4.h"
#import "UIImageView+WebCache.h"
#define WIDTH   self.contentView.frame.size.width
#define HEIGHT  self.contentView.frame.size.height


@implementation RingTopCollectionViewCell4
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        
        [TodaySaleRequest onTheChildren:0 cBlock:^(NSDictionary *dic) {
            //
            //NSLog(@"children:%@",dic);
            _childrenModel = [CChildrenModel modelObjectWithDictionary:dic];
            
            //因为这里无法刷新,但是又必须保证得到数据后再创建
            
            NSMutableArray *imageArray = [[NSMutableArray alloc]init];
            [_childrenModel.martshows enumerateObjectsUsingBlock:^(CMartshows *  _Nonnull objArr, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [objArr.msItems enumerateObjectsUsingBlock:^(CMsItems *  _Nonnull objItems, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    [imageArray addObject:objItems.img];
                    //NSLog(@"%@",imageArray);
                }];
                
            }];
            
            // 创建scrollview 添加到view上
            _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
            _scrollerView.backgroundColor = [UIColor orangeColor];
            _scrollerView.delegate = self;
            self.contentView.clipsToBounds = YES;
            _scrollerView.clipsToBounds = NO;
            [self.contentView addSubview:_scrollerView];
            
            
            
            for (NSInteger i = 0; i <imageArray.count; i ++)
            {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100 *i, 0, 100, 100)];
                // imageView.image = [UIImage imageNamed:imageArray[i]];
                [imageView sd_setImageWithURL:imageArray[i]];
                [_scrollerView addSubview:imageView];
            }
            _scrollerView.contentSize = CGSizeMake(100 *imageArray.count , 100);
            _scrollerView.pagingEnabled = YES;
            _scrollerView.contentOffset = CGPointMake(100 *6, 0);
            
            
        }];
        
    }
    return self;
}
@end
