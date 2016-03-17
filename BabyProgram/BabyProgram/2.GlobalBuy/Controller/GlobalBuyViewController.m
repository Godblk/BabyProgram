//
//  GlobalBuyViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "GlobalBuyViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "GlobalCollectionViewController.h"

@interface GlobalBuyViewController ()

@end

@implementation GlobalBuyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    CHTCollectionViewWaterfallLayout *globalLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
    
    //    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    globalLayout.headerHeight =30;
    globalLayout.footerHeight = 10;
    globalLayout.minimumColumnSpacing = 5;
    globalLayout.minimumInteritemSpacing = 5;
    GlobalCollectionViewController *globalCollection = [[GlobalCollectionViewController alloc] initWithCollectionViewLayout:globalLayout];
    [self.view addSubview:globalCollection.collectionView];
    [self addChildViewController:globalCollection];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
