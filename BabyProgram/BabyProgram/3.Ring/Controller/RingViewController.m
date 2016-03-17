//
//  RingViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RingViewController.h"
#import "RingCollectionViewController.h"
#import "XLPlainFlowLayout.h"
#import "TodaySaleRequest.h"
#import "RDataModels.h"

@interface RingViewController ()
{
    RRingModel                      *_ringModel;
    RingCollectionViewController    *_ringCollection;
}
@end

@implementation RingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor =[UIColor orangeColor];
    
    [TodaySaleRequest onTheRingRequest:^(NSDictionary *dic) {
        
       // NSLog(@"---%@ring:",dic);
     _ringModel = [RRingModel modelObjectWithDictionary:dic];
        
         
    }];
    
    
    XLPlainFlowLayout *layout = [XLPlainFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5,5);
   
    // 默认为64.0
    layout.naviHeight = 0;
  
    _ringCollection =[[RingCollectionViewController alloc]initWithCollectionViewLayout:layout];
    //属性传值model
    _ringCollection.RModel =_ringModel;
    [self.view addSubview:_ringCollection.collectionView];
    [self addChildViewController:_ringCollection];
    
    
    
    
    
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
