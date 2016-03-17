//
//  ScrollSmallCollectionViewCell.h
//  BabyProgram
//
//  Created by jie on 16/3/7.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "TodaySaleRequest.h"
#import "CDataModels.h"

@interface ScrollSmallCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>

{
    CChildrenModel          *_childrenModel;
}
@property (nonatomic, strong) UIScrollView *scrollerView;
@end
