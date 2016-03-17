//
//  SearchViewController.h
//  BabyProgram
//
//  Created by jie on 16/3/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

@interface SearchViewController : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end
