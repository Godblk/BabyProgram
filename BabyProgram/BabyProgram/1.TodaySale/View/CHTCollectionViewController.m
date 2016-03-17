//
//  CHTCollectionViewController.m
//  Demo
//
//  Created by 刘广福 on 16/3/5.
//  Copyright © 2016年 Nelson. All rights reserved.
//

#import "CHTCollectionViewController.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "SDCycleScrollView.h"
#import "TodaySaleRequest.h"
#import "DataModels.h"
#import "UIImageView+WebCache.h"
#import "ScrollSmallCollectionViewCell.h"
#import "Masonry.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"



@interface CHTCollectionViewController ()<SDCycleScrollViewDelegate>
{
    TodaySaleObjcModel      *_todaySaleModel;
}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellSizes2;
@property (nonatomic, strong) NSArray *cellSizes3;
@property (nonatomic, strong) NSArray *cellSizes4;
@property (nonatomic, strong) NSArray *cellSizes5;
@property (nonatomic, strong) NSArray *cellSizes6;
@property (nonatomic, strong) NSArray *cellSizes7;

@property (nonatomic, strong) NSArray *cats;

@end

@implementation CHTCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [TodaySaleRequest onTheNewRequest:^(NSDictionary *dic) {
        
//        //NSLog(@"%@",dic);
        _todaySaleModel = [TodaySaleObjcModel modelObjectWithDictionary:dic];
        
        //确定数据到手,开始刷新
        [self.collectionView reloadData];
    } ];
    
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class]
        forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
               withReuseIdentifier:HEADER_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
               withReuseIdentifier:FOOTER_IDENTIFIER];

   
    
    //注册自定义 ScrollSmallCollectionViewCell
    [self.collectionView registerClass:[ScrollSmallCollectionViewCell class] forCellWithReuseIdentifier:@"ScrollSmallCollectionID"];
    
    //注册自定义labelImgID  3暂时不修改
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID0"];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID1"];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID2"];

    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID4"];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID5"];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"cellID6"];


}

- (NSArray *)cellSizes
{
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(500, 700)],
                       [NSValue valueWithCGSize:CGSizeMake(800, 600)],
                       [NSValue valueWithCGSize:CGSizeMake(800, 600)],
                       [NSValue valueWithCGSize:CGSizeMake(800, 600)],
                       [NSValue valueWithCGSize:CGSizeMake(800, 600)]
                       ];
    }
    return _cellSizes;
}

- (NSArray *)cellSizes2
{
    if (!_cellSizes2) {
        _cellSizes2 = @[
                       [NSValue valueWithCGSize:CGSizeMake(200, 50)],
                       ];
    }
    return _cellSizes2;
}

- (NSArray *)cellSizes3
{
    if (!_cellSizes3) {
        _cellSizes3 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 220)],
                        ];
    }
    return _cellSizes3;
}

- (NSArray *)cellSizes4
{
    if (!_cellSizes4) {
        _cellSizes4 = @[
                        [NSValue valueWithCGSize:CGSizeMake(340, 400)],
                        ];
    }
    return _cellSizes4;
}

- (NSArray *)cellSizes5
{
    if (!_cellSizes5) {
        _cellSizes5 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 170)],
                        ];
    }
    return _cellSizes5;
}
- (NSArray *)cellSizes6
{
    if (!_cellSizes6) {
        _cellSizes6 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 350)],
                        ];
    }
    return _cellSizes6;
}

- (NSArray *)cellSizes7
{
    if (!_cellSizes7) {
        _cellSizes7 = @[
                        [NSValue valueWithCGSize:CGSizeMake(400, 180)],
                        ];
    }
    return _cellSizes7;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

//返回区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}


//动态返回区的高度 -- 区头
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    if (section == 4)
    {
        return 30;
    }

    return 0;
}

//动态返回区的高度 -- 区尾
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section
//{

//    return 20;
//}




//返回每个区里面Item的个数  即返回多少行 --动态得到数据
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
         return 1;
    }
    else if (section ==1)
    {
        return _todaySaleModel.iconShortcuts.count;
    }
    else if (section ==2)
    {
        return _todaySaleModel.promotionProShortcuts.count;
    }
    else if (section ==3)
    {
//      return _todaySaleModel.promotionLoopShortcuts.count;
        return 1;
    }
    else if (section == 4)
    {
        return _todaySaleModel.martshowHeaderBanners.count;
    }
    else if (section == 5)
    {
        return _todaySaleModel.martshowHeaderThreeSquares.count;
    }
    else
    {
        return _todaySaleModel.martshowInsertBanners.count;
    }
 
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CHTCollectionViewWaterfallCell *cell =nil;
    
    float num1 = arc4random() % 255;
    float num2 = arc4random() % 255;
    float num3 = arc4random() % 255;
    cell.backgroundColor = [UIColor colorWithRed:num1/255.0 green:num2/255.0 blue:num3/255.0 alpha:1.0];
    
    
    if (indexPath.section == 0)
    {    
        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID0" forIndexPath:indexPath];
         NSMutableArray *imgUrlStrings = [[NSMutableArray alloc]init];
        [_todaySaleModel.martshowInsertBanners enumerateObjectsUsingBlock:^(MartshowInsertBanners *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [imgUrlStrings addObject:obj.img];
            
        }];
        //通过viewWithTag找到SDCycleScrollView
        SDCycleScrollView *cycleScroll =[cell.contentView viewWithTag:30];

        if (!cycleScroll)
        {
            SDCycleScrollView *cycleScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            cycleScroll.tag = 30;
            cycleScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
            cycleScroll.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
            [cell.contentView addSubview:cycleScroll];
        }
       
        // --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycleScroll.imageURLStringsGroup = imgUrlStrings;
            //NSLog(@"%@",imgUrlStrings);
        });

    }
    else if (indexPath.section ==1)
    {

        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID1" forIndexPath:indexPath];
        IconShortcuts *iconModel = _todaySaleModel.iconShortcuts[indexPath.row];
        UIImageView *img = [cell.contentView viewWithTag:10]; 
        if (!img) 
        {
            img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height*3/4.0)];
            img.tag = 10;
            [cell.contentView addSubview:img];
        }
        [img sd_setImageWithURL:[NSURL URLWithString:iconModel.img]];
        
        UILabel *titleLab = [cell.contentView viewWithTag:20];
        if (!titleLab) {
            titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, img.frame.size.height, cell.frame.size.width, cell.frame.size.height-img.frame.size.height)];
            titleLab.font = [UIFont systemFontOfSize:13];
            titleLab.textColor = [UIColor grayColor];
            titleLab.tag = 20;
            [cell.contentView addSubview:titleLab];
        }
        titleLab.text = iconModel.title;
        
    }
    else if (indexPath.section ==2)
    {

        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID2" forIndexPath:indexPath];
        PromotionProShortcuts *pro_shortcutsModel =_todaySaleModel.promotionProShortcuts[indexPath.row];
        //一大四小图片
        NSURL *url = [NSURL URLWithString:pro_shortcutsModel.img];
        ////NSLog( @"%@",url);
        [cell.imageView sd_setImageWithURL:url];
        
    }
    else if (indexPath.section ==3)
    {
         //四小图片滚动视图
        cell.imageView.image =nil;
        ScrollSmallCollectionViewCell *cell3 =
        (ScrollSmallCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ScrollSmallCollectionID" forIndexPath:indexPath];
        return cell3;
        
    }
    else if (indexPath.section ==4)
    {
       //一张图片--新人一元购

        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID4" forIndexPath:indexPath];
        MartshowHeaderBanners *header_banners = _todaySaleModel.martshowHeaderBanners[indexPath.row];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:header_banners.img]];
        
        
    }
    else if (indexPath.section ==5)
    {
        //9宫格图片
        
        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID5" forIndexPath:indexPath];
        MartshowHeaderThreeSquares *three_squaresModel = _todaySaleModel.martshowHeaderThreeSquares[indexPath.row];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:three_squaresModel.img]];
        
    }
    else
    {
        //最后的一张图片
        cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID6" forIndexPath:indexPath];
        MartshowInsertBanners *insert_bannersModel = _todaySaleModel.martshowInsertBanners[indexPath.row];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:insert_bannersModel.img]];
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
        
        //得到数据
        MartshowHeaderBanners *header_bannersModel =
        _todaySaleModel.martshowHeaderBanners[indexPath.row];
        NSLog(@"********%@",header_bannersModel.mainTitle);
        
        if (indexPath.section ==4)
        {
            UILabel *label1 = [reusableView viewWithTag:111];
            if (!label1)
            {
                label1 = [[UILabel alloc]init];
                label1.font = [UIFont systemFontOfSize:14];
                label1.textColor = [UIColor blackColor];
                label1.tag =111;
                [reusableView addSubview:label1];
            }
           label1.text = header_bannersModel.mainTitle;
            //约束
            [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(reusableView.mas_left).with.offset(50.f);
                make.top.equalTo(reusableView.mas_top).with.offset(10.f);
                make.height.equalTo(@10);
                
            }];
            
            UILabel *label2 = [reusableView viewWithTag:222];
            if (!label2)
            {
                label2 =[[UILabel alloc]init];
                label2.font = [UIFont systemFontOfSize:12];
                label2.textColor = [UIColor blackColor];
                label2.tag =222;
                [reusableView addSubview:label2];
                //约束
                [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(reusableView.mas_top).with.offset(10.f);
                    make.left.equalTo(label1.mas_right).with.offset(10.f);
                    make.height.equalTo(@10);
                    
                }];
            }
           
            label2.text = header_bannersModel.mainSubtitle;
            
        } 
//        else
//        {
//            UILabel *label3 = [reusableView viewWithTag:333];
//            if (!label3)
//            {
//                label3 = [[UILabel alloc]init];
//                label3.font = [UIFont systemFontOfSize:14];
//                label3.textColor = [UIColor blackColor];
//                label3.tag =333;
//                [reusableView addSubview:label3];
//            }
//            label3.text = header_bannersModel.title;
//            //约束
//            [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(reusableView.mas_left).with.offset(50.f);
//                make.top.equalTo(reusableView.mas_top).with.offset(10.f);
//                make.height.equalTo(@10);
//                
//            }];
//
//        }
        
        
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
        return [self.cellSizes6[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section ==2)
    {
        return [self.cellSizes[indexPath.item % 5 ] CGSizeValue];
    }
    else if (indexPath.section ==3)
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section ==4)
    {
        return [self.cellSizes5[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section ==5)
    {
        return [self.cellSizes4[indexPath.item % 1] CGSizeValue];
    }
    else
    {
        return [self.cellSizes7[indexPath.item % 1] CGSizeValue];
    }
    
}




//返回每个区里面的列数 - 规定
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section
{
    if (section ==0)
    {
        return 1;
    }
    else if (section ==1)
    {
        return 5;
    }
    else if (section ==2)
    {
        return 3;
    }
    else if (section ==3)
   {
      return 1;
   }
    else if (section ==4)
    {
        return 1;
    }
    else if (section ==5 )
    {
        return 3;
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
    
    ////NSLog(@"选中的Item:%lu",indexPath.row);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//定义每个UICollectionView 的 margin
/*
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
 */


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
