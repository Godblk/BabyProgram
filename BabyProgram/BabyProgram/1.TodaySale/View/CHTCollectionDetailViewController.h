//
//  CHTCollectionDetailViewController.h
//  BabyProgram
//
//  Created by jie on 16/3/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"
#import "CDataModels.h"

@interface CHTCollectionDetailViewController : UICollectionViewController<CHTCollectionViewDelegateWaterfallLayout>

//@property(nonatomic,retain)CChildrenModel *model; 
//接收TodaySaleVC界面传过来的model
@property(nonatomic,retain)CChildrenModel *cModel;
@property(nonatomic,copy)NSString *imgUrl;
//@property(nonatomic,copy)NSString *fourImgUrl;
@property(nonatomic,strong)NSMutableArray *urlArr;
@end
