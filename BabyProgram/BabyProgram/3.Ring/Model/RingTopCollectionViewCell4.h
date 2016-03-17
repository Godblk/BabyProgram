//
//  RingTopCollectionViewCell4.h
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "TodaySaleRequest.h"
#import "CDataModels.h"


@interface RingTopCollectionViewCell4 : UICollectionViewCell<UIScrollViewDelegate>
{
    CChildrenModel          *_childrenModel;
}
@property (nonatomic, strong) UIScrollView *scrollerView;
@end
