//
//  RingCollectionViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/12.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RingCollectionViewController.h"
#import "XLPlainFlowLayout.h"
#import "ReusableView.h"
#import "RingTopCollectionViewCell1.h"
#import "RingTopCollectionViewCell2.h"
#import "RingTopCollectionViewCell3.h"
#import "RingTopCollectionViewCell4.h"
#import "Masonry.h"

@interface RingCollectionViewController ()

@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellSizes2;

@end

@implementation RingCollectionViewController
static NSString *cellID = @"cellID";
static NSString *headerID = @"headerID";
static NSString *footerID = @"footerID";


static NSString * const reuseIdentifier = @"Cell";



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"XLPlainFlowLayoutDemo";
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:headerID];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:footerID];
    //注册自定义cellTopID1
    [self.collectionView registerClass:[RingTopCollectionViewCell1 class] forCellWithReuseIdentifier:@"cellTopID1"];
    //注册自定义cellTopID2
    [self.collectionView registerClass:[RingTopCollectionViewCell2 class] forCellWithReuseIdentifier:@"cellTopID2"];
    //注册自定义cellTopID3
    [self.collectionView registerClass:[RingTopCollectionViewCell3 class] forCellWithReuseIdentifier:@"cellTopID3"];
    //注册自定义cellTopID4
    [self.collectionView registerClass:[RingTopCollectionViewCell4 class] forCellWithReuseIdentifier:@"cellTopID4"];
    

}

- (NSArray *)cellSizes
{
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 200)],
                       ];
    }
    return _cellSizes;
}
- (NSArray *)cellSizes2
{
    if (!_cellSizes2) {
        _cellSizes2 = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 100)],
                       ];
    }
    return _cellSizes2;
}

//区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}
//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 4)
    {
        return 6;
    }
    return 1;
}
#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//定义每个UICollectionView 的大小  返回区的约束
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return [self.cellSizes[indexPath.item % 1] CGSizeValue];
    }
    else
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
    }
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if (indexPath.section == 0)
    {
        //cell.backgroundColor = [UIColor redColor];
        //
        RingTopCollectionViewCell1 *topCell1 = (RingTopCollectionViewCell1 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellTopID1" forIndexPath:indexPath];

        
        [_RModel.streamItems enumerateObjectsUsingBlock:^(RStreamItems *  _Nonnull streamItemsModel, NSUInteger idx, BOOL * _Nonnull stop) {
            
        [topCell1.imageArray addObject:streamItemsModel.streamMoment.userInfo.avatar];
            
        }];
        

        
        return topCell1;
        
    }
    else if (indexPath.section ==1)
    {
        RingTopCollectionViewCell2 *topCell2 = (RingTopCollectionViewCell2 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellTopID2" forIndexPath:indexPath];
        
         [topCell2.iconBtn2 setTitle:@"O(∩_∩)O哈哈~" forState:UIControlStateNormal];
        
        //NSLog(@"iconBtn2%@",NSStringFromCGRect(topCell2.iconBtn2.frame) );
        
        return topCell2;

    }
    else if (indexPath.section == 2)
    {
        RingTopCollectionViewCell3 *topCell3 = (RingTopCollectionViewCell3 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellTopID3" forIndexPath:indexPath];

        [topCell3.iconBtn2 setTitle:@"wesdx" forState:UIControlStateNormal];

        return topCell3;

        
    }
    else if (indexPath.section ==3)
    {

        
        RingTopCollectionViewCell2 *topCell2 = (RingTopCollectionViewCell2 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellTopID2" forIndexPath:indexPath];
        
        [topCell2.iconBtn2 setTitle:@"O(∩_∩)O哈哈~" forState:UIControlStateNormal];
        
        NSLog(@"iconBtn2%@",NSStringFromCGRect(topCell2.iconBtn2.frame) );
        
        return topCell2;

        
    }
    
    else
    {
        cell.backgroundColor = [UIColor yellowColor];
        //        RingBottomCollectionViewCell *bottomCell = (RingBottomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellBottonID" forIndexPath:indexPath];
        //
        //        return bottomCell;
    }
    return cell;
}
//返回区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (kind==UICollectionElementKindSectionFooter) {
        ReusableView *footer = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
        footer.backgroundColor = [UIColor yellowColor];
        footer.text = [NSString stringWithFormat:@"第%ld个分区的footer",indexPath.section];
        return footer;
    }
    
    if (indexPath.section >0) {
        ReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        header.backgroundColor = indexPath.section%2?[[UIColor blackColor] colorWithAlphaComponent:0.5] : [[UIColor blueColor] colorWithAlphaComponent:0.5];
        header.text = [NSString stringWithFormat:@"第%ld个分区的header",indexPath.section];
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 4)
    {
        return CGSizeMake(0, 44);
    }
    return CGSizeZero;
}
/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 {
 if (section==4)
 {
 return CGSizeMake(0, 20);
 
 }
 return CGSizeZero;
 }
 */

-(BOOL)prefersStatusBarHidden
{
    return YES;
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
