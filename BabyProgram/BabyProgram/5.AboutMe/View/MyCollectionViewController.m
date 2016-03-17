//
//  MyCollectionViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "MyCollectionViewController.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"

#import "MyCollectionViewWaterfallCell.h"
#import "HeaderCollectionViewWaterfallCell.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"


@interface MyCollectionViewController ()
{
    NSArray                 *_iconArr1;
    NSArray                 *_iconArr2;
    NSArray                 *_iconArr3;
    NSArray                 *_iconArr4;
    
    NSArray                 *_iconTitleArr1;
    NSArray                 *_iconTitleArr2;
    NSArray                 *_iconTitleArr3;
    NSArray                 *_iconTitleArr4;

}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellSizes2;

@property (nonatomic, strong) NSArray *cats;

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CHTCollectionViewWaterfallCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
    [self.collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
   
    
    
    _iconArr1= [[NSArray alloc]initWithObjects:@"ic_my_daifukuan@2x.png",@"ic_my_daishouhuo@2x.png",@"ic_my_daipingjia@2x.png",@"ic_my_tuihuo@2x.png", nil];
    _iconArr2 =[[NSArray alloc]initWithObjects:@"ic_p_qianbao_ticket@2x.png",@"ic_qianbao_packet@2x.png",@"ic_p_qianbao_shell@2x.png",@"ic_p_qianbao_yu-e@2x.png", nil];
    _iconArr3 = [[NSArray alloc]initWithObjects:@"ic_friends-discount@2x.png",@"ic_Sign@2x.png",@"ic_friends-discount@2x.png",@"ic_Sign@2x.png", nil];
    _iconArr4 =[[NSArray alloc]initWithObjects:@"ic_cehua_fengqiang@2x.png",@"ic_cehua_shangxin@2x.png",@"ic_cehua_yugao@2x.png",@"ic_cehua_shangxin@2x.png",@"ic_friends-discount@2x.png",@"ic_Sign@2x.png",@"ic_friends-discount@2x.png",@"ic_Sign@2x.png", nil];
    
    
    _iconTitleArr1 =[[NSArray alloc]initWithObjects:@"待付款",@"待收货",@"待评价",@"我的售后", nil];
    _iconTitleArr2 =[[NSArray alloc]initWithObjects:@"现金券",@"品牌红包",@"贝壳",@"余额", nil];
    _iconTitleArr3 =[[NSArray alloc]initWithObjects:@"我的小店",@"签到领钱",@"好友优惠",@"闲置转让", nil];
    _iconTitleArr4 =[[NSArray alloc]initWithObjects:@"晒图赢奖励",@"买家秀",@"进圈摇拍立得",@"客服中心",@"今天穿什么",@"抽免单",@"分享赚钱",@"点评送早教机", nil];

    
    
    
    
    //注册自定义cell
    [self.collectionView registerClass:[MyCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"iconCellID"];
    
    //注册自定义cell
    [self.collectionView registerClass:[HeaderCollectionViewWaterfallCell class] forCellWithReuseIdentifier:@"headerCellID"];
    
    
    

}

//一张图片的约束
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
                        [NSValue valueWithCGSize:CGSizeMake(300, 300)],
                        ];
    }
    return _cellSizes2;
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
    return 5;
}
//动态返回区的高度 -- 区头
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    return 20;
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
        return 4;
    }
    else if (section ==2)
    {
        return 4;
    }
    else if (section ==3)
    {
        return 4;
    }
    else
    {
        return 8;
    }
    
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     MyCollectionViewWaterfallCell *cell = (MyCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"iconCellID" forIndexPath:indexPath];

    if (indexPath.section == 0)
    {
    HeaderCollectionViewWaterfallCell *headerCell =
        (HeaderCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"headerCellID" forIndexPath:indexPath];

    [headerCell.loginArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
        obj.tag = idx +10;
        }];

    [headerCell.iconArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [obj addTarget:self action:@selector(iconAction:) forControlEvents:UIControlEventTouchUpInside];
            
            obj.tag = idx+100;
            NSLog(@"idx---%lu",idx);
            
        }];
        
    return headerCell;

        
        
    }
   else if (indexPath.section == 1)
    {
       
        
        cell.iconImg.image = [UIImage imageNamed:_iconArr1[indexPath.row]];
        cell.iconLabel.text =_iconTitleArr1[indexPath.row];
        
    }
    else if (indexPath.section == 2)
    {
        cell.iconImg.image = [UIImage imageNamed:_iconArr2[indexPath.row]];
        cell.iconLabel.text =_iconTitleArr2[indexPath.row];
    }
    else if (indexPath.section == 3)
    {
        cell.iconImg.image = [UIImage imageNamed:_iconArr3[indexPath.row]];
        cell.iconLabel.text =_iconTitleArr3[indexPath.row];
    }

    else
    {
        cell.iconImg.image = [UIImage imageNamed:_iconArr4[indexPath.row]];
        cell.iconLabel.text =_iconTitleArr4[indexPath.row];
    }
        
    
    return cell;
}

-(void)cellButtonClick:(UIButton *)sender
{
    NSLog(@"-----%ld",sender.tag);
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
        
        if (indexPath.section ==1)
         {
             UILabel *label1 = [reusableView viewWithTag:11];
             if (!label1)
             {
                 label1 = [[UILabel alloc]init];
                 label1.font = [UIFont systemFontOfSize:16];
                 label1.textColor = [UIColor grayColor];
                 label1.tag =11;
                 [reusableView addSubview:label1];
             }
             label1.text =@"我的订单";
             //约束
             [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.left.equalTo(reusableView.mas_left).with.offset(20.f);
                 make.top.equalTo(reusableView.mas_top).with.offset(5.f);
                 make.height.equalTo(@10);
                 
             }];
         }
        else if (indexPath.section ==2)
        {
            UILabel *label2 = [reusableView viewWithTag:22];
            if (!label2)
            {
                label2 = [[UILabel alloc]init];
                label2.font = [UIFont systemFontOfSize:16];
                label2.textColor = [UIColor grayColor];
                label2.tag =22;
                [reusableView addSubview:label2];
            }
            label2.text =@"我的钱包";
            //约束
            [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(reusableView.mas_left).with.offset(20.f);
                make.top.equalTo(reusableView.mas_top).with.offset(5.f);
                make.height.equalTo(@10);
                
            }];

        }
        else if (indexPath.section ==3)
        {
            UILabel *label3 = [reusableView viewWithTag:22];
            if (!label3)
            {
                label3 = [[UILabel alloc]init];
                label3.font = [UIFont systemFontOfSize:16];
                label3.textColor = [UIColor grayColor];
                label3.tag =22;
                [reusableView addSubview:label3];
            }
            label3.text =@"贝妈来赚钱";
            //约束
            [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(reusableView.mas_left).with.offset(20.f);
                make.top.equalTo(reusableView.mas_top).with.offset(5.f);
                make.height.equalTo(@10);
                
            }];
        }
        else if (indexPath.section == 4)
        {
            UILabel *label4 = [reusableView viewWithTag:22];
            if (!label4)
            {
                label4 = [[UILabel alloc]init];
                label4.font = [UIFont systemFontOfSize:16];
                label4.textColor = [UIColor grayColor];
                label4.tag =22;
                [reusableView addSubview:label4];
            }
            label4.text =@"贝妈百宝箱";
            //约束
            [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(reusableView.mas_left).with.offset(20.f);
                make.top.equalTo(reusableView.mas_top).with.offset(5.f);
                make.height.equalTo(@10);
                
            }];
        }
        else
        {
            //
        }
        
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
        return [self.cellSizes[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 1)
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 2)
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];
    }
    else if (indexPath.section == 3)
    {
        return [self.cellSizes2[indexPath.item % 1] CGSizeValue];    }
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
        return 4;
    }
    else if (section ==2)
    {
        return 4;
    }
    else if (section ==3)
    {
        return 4;
    }
    else
    {
        return 4;
    }
    
    
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"选中的Item行 - 区%lu %lu",indexPath.row,indexPath.section);
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//登录注册点击方法
-(void)loginAction:(UIButton *)sender
{
    NSLog(@"-------%lu",sender.tag);
    if (sender.tag == 10)
    {
        NSLog(@"登录按钮");
    }
    else
    {
        NSLog(@"注册按钮");
    }
   
}
//注册方法
-(void)iconAction:(UIButton *)sender
{

    if (sender.tag == 100)
    {
        NSLog(@"我的收藏");
    }
    else if (sender.tag == 101)
    {
        NSLog(@"我的圈儿");
    }
    else
    {
        NSLog(@"我的足迹");
    }
    
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
