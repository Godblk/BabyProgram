//
//  CHTCollectionDetailViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "CHTCollectionDetailViewController.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "TodaySaleRequest.h"
#import "ChildrenImgCollectionViewCell.h"

#import "UIImageView+WebCache.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface CHTCollectionDetailViewController ()
{
   // CChildrenModel          *_childrenModel;
}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellSizes2;
@property (nonatomic, strong) NSArray *cellSizes3;

@property (nonatomic, strong) NSArray *cats;

@end

@implementation CHTCollectionDetailViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
   
    _urlArr =[[NSMutableArray alloc]init];
    
    //在TodaySaleViewController里面得到数据  传入这个界面
    
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getUrl:) name:@"getUrl" object:nil];
    
    
    [TodaySaleRequest onTheCommandChildren:^(NSDictionary *dic) {
        //NSLog(@"comDic:%@",dic);
        
        NSDictionary *bannersDic = [dic objectForKey:@"martshow_cat_banners"];
        NSArray *dressArr = [bannersDic objectForKey:@"dress--"];
        NSDictionary *dressDic = [dressArr objectAtIndex:0];
        NSString *img = [dressDic objectForKey:@"img"];
    //1区图片URL
        _imgUrl = img;
        
    //2区图片URL
        NSDictionary *shortcutsDic = [dic  objectForKey:@"martshow_cat_shortcuts"];
        NSMutableArray *dressArr2 = [shortcutsDic objectForKey:@"dress--"];
        
        [_urlArr setArray:dressArr2];

        [self.collectionView reloadData];

        
    }];
    
    

    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    
    
    //注册自定义cell
    [self.collectionView registerClass:[ChildrenImgCollectionViewCell class] forCellWithReuseIdentifier:@"childrenImgID"];
     
    
}

#pragma mark --得到网络url的地址
/*
-(void)getUrl:(NSNotification *)noti
{
    _model = [noti.userInfo objectForKey:@"Model"];
    
       //NSLog(@"%@",_model.martshows);
    
    [self.collectionView reloadData];
    
}
*/

- (NSArray *)cellSizes
{
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 180)],
                      ];
    }
    return _cellSizes;
}

- (NSArray *)cellSizes2
{
    if (!_cellSizes2) {
        _cellSizes2 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 220)],
                        ];
    }
    return _cellSizes2;
}
- (NSArray *)cellSizes3
{
    if (!_cellSizes3) {
        _cellSizes3 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 70)],
                        ];
    }
    return _cellSizes3;
}


- (NSArray *)cats
{
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
    return 3;
}

//动态返回区的高度 -- 区头
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

/*
//动态返回区的高度 -- 区尾
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
{
    if (section ==2)
    {
        return 20.0f;
    }
    else
    {

    }

    return 0;
}
*/

//返回每个区里面Item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section ==1)
    {
    //CMartshows *martModel = _childrenModel.martshows[section];
        return 4;
    }
    else
    {
       return _cModel.martshows.count;
    }
    
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CHTCollectionViewWaterfallCell *cell =
    (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                                forIndexPath:indexPath];
//    float num1 = arc4random() % 255;
//    float num2 = arc4random() % 255;
//    float num3 = arc4random() % 255;
    
   // cell.backgroundColor = [UIColor colorWithRed:num1/255.0 green:num2/255.0 blue:num3/255.0 alpha:1.0];

    
    if (indexPath.section == 0)
    {
        cell.imageView.image = nil;
       
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_imgUrl]];
    }
    else if (indexPath.section ==1)
    {
        cell.imageView.image = nil;

        NSString *fourImg =nil;
        if (_urlArr.count > 0)
        {
            NSDictionary *dressDic2 = [_urlArr objectAtIndex:indexPath.item];
           fourImg = [dressDic2 objectForKey:@"img"];
        }
       
        
      [cell.imageView sd_setImageWithURL:[NSURL URLWithString:fourImg]];

        
    }
    else
    {
        ChildrenImgCollectionViewCell *childrenCell = (ChildrenImgCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"childrenImgID" forIndexPath:indexPath];
        /*
        //main_img 图片路径
        cell.imageView.image = nil;
        //cell.mesLabel.text =nil;
        CMartshows *martshows3 =_cModel.martshows[indexPath.row];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:martshows3.mainImg]];
         */
        
        CMartshows *martshows3 =_cModel.martshows[indexPath.row];
        [childrenCell.goodsImg sd_setImageWithURL:[NSURL URLWithString:martshows3.mainImg]];
        childrenCell.goodsLabel.text = martshows3.promotion;
        childrenCell.goodsDetailLabel.text = martshows3.title;
        //childrenCell.goodsLabel.text =@"2.3折起";
        //childrenCell.goodsDetailLabel.text =@"戴维贝拉品牌童装专场";
        return childrenCell;
    }
    
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
        return [self.cellSizes3[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 1)
    {
        return [self.cellSizes[indexPath.item % 1] CGSizeValue];
    }
    else
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
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
    else
    {
        return 1;
    }
    
    
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"选中的Item:%lu",indexPath.row);
}

//定义每个UICollectionView 的 margin
/*
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
 */


//返回这个UICollectionView是否可以被选择
/*
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
*/
// * ------------------------------------- *



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
