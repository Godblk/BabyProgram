//
//  SearchCollectionViewController.h
//  BabyProgram
//
//  Created by jie on 16/3/10.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"
#import "SDataModels.h"
#import "SearchViewController.h"
@interface SearchCollectionViewController : UICollectionViewController<CHTCollectionViewDelegateWaterfallLayout>

@property(nonatomic,strong)SMainCategorys *SModel;

@end
