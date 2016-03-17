//
//  HeaderCollectionViewWaterfallCell.h
//  BabyProgram
//
//  Created by jie on 16/3/10.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface HeaderCollectionViewWaterfallCell : UICollectionViewCell

//@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic,retain)UIButton *loginRegBtn;
@property (nonatomic,retain)UIButton *iconBtn;

@property (nonatomic,retain)NSMutableArray *loginArray;
@property (nonatomic,retain)NSMutableArray *iconArray;


@end
 