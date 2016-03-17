//
//  RingTopCollectionViewCell1.h
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDCycleScrollView.h"
#import "CDataModels.h"

@interface RingTopCollectionViewCell1 : UICollectionViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic,strong)NSMutableArray *imageArray;

@end
