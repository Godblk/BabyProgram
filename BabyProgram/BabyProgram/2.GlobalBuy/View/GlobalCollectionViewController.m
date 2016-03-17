//
//  GlobalCollectionViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "GlobalCollectionViewController.h"
#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "CHTCollectionViewWaterfallHeader.h"

#import "GlobalCollectionViewController.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface GlobalCollectionViewController ()
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellSizes2;
@property (nonatomic, strong) NSArray *cellSizes3;

@property (nonatomic, strong) NSArray *cats;

@end

@implementation GlobalCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.collectionView.backgroundColor = [UIColor orangeColor];
    
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    
}

- (NSArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 560)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 700)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 700)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 700)],
                       ];
    }
    return _cellSizes;
}

- (NSArray *)cellSizes2 {
    if (!_cellSizes2) {
        _cellSizes2 = @[
                        [NSValue valueWithCGSize:CGSizeMake(300, 200)],
                        ];
    }
    return _cellSizes2;
}



//一张图片的约束
- (NSArray *)cellSizes3 {
    if (!_cellSizes3) {
        _cellSizes3 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 200)],
                        ];
    }
    return _cellSizes3;
}





- (NSArray *)cats {
    if (!_cats) {
        _cats = @[@"cat1.jpg", @"cat2.jpg", @"cat3.jpg", @"cat4.jpg"];
    }
    return _cats;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

//返回区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

//返回每个区里面Item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section ==1)
    {
        return 3;
    }
    else if (section ==2)
    {
        return 8;
    }
    else if (section ==3)
    {
        return 1;
    }
    else if (section == 4)
    {
        return 6;
    }
    else if (section == 5)
    {
        return 1;
    }
    else
    {
        return 5;
    }
    
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CHTCollectionViewWaterfallCell *cell =
    (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                                forIndexPath:indexPath];
    float num1 = arc4random() % 255;
    float num2 = arc4random() % 255;
    float num3 = arc4random() % 255;
    
    cell.backgroundColor = [UIColor colorWithRed:num1/255.0 green:num2/255.0 blue:num3/255.0 alpha:1.0];
    //    cell.imageView.image = [UIImage imageNamed:self.cats[indexPath.item % 5]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HEADER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    }
    else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:FOOTER_IDENTIFIER
                                                                 forIndexPath:indexPath];
    }
    
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//定义每个UICollectionView 的大小  返回区的约束
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        //*
        return [self.cellSizes3[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 1)
    {
        return [self.cellSizes[indexPath.item % 4] CGSizeValue];
    }
    else if (indexPath.section == 2)
    {
        return [self.cellSizes[indexPath.item % 1 ] CGSizeValue];
    }
    else if (indexPath.section == 3)
    {
        return [self.cellSizes3[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 4)
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section ==5)
    {
        return [self.cellSizes3[indexPath.item % 1] CGSizeValue];
    }
    else
    {
        return [self.cellSizes3[indexPath.item % 1] CGSizeValue];
    }
    
}




//返回每个区里面的列数
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section
{
    if (section ==0)
    {
        return 1;
    }
    else if (section ==1)
    {
        return 2;
    }
    else if (section ==2)
    {
        return 4;
    }
    else if (section ==3)
    {
        return 1;
    }
    else if (section ==4)
    {
        return 2;
    }
    else if (section ==5 )
    {
        return 1;
    }
    else
    {
        return 1;
    }
    
    
}
#pragma mark --UICollectionViewDelegate
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    //NSLog(@"选中的Item:%lu",indexPath.row);
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}





/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
