
//
//  SearchViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCollectionViewController.h"
#import "TodaySaleRequest.h"
#import "SDataModels.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"

#import "CHTCollectionViewController.h"
#import "BDataModels.h"
#import "UIImageView+WebCache.h"
#import "RDVTabBarController.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"


@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
{
    UISegmentedControl      *_segmentCtr;
    NSArray                 *_titleArray ;
    SSeachModel             *_searchModel;
    UIScrollView            *_bigScrollView ;
    BBrandModel             *_brandModel;
    SearchCollectionViewController *_collection;
    NSArray                 *_ageArr;
    NSArray                 *_letterArray;
} 
 
@end

@implementation SearchViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    //self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
    //请求搜索界面的数据 --分类
    [TodaySaleRequest searchClassRequest:^(NSDictionary *dic) {
       
        //NSLog(@"搜索界面----%@",dic);
         _searchModel= [SSeachModel modelObjectWithDictionary:dic];
        
        SMainCategorys *main_categorysModel = _searchModel.mainCategorys[0];
         
        _collection.SModel = main_categorysModel;
        
         [_collection.collectionView reloadData];
        
    }];
    
    //请求搜索品牌界面的数据 --品牌
    [TodaySaleRequest searchBrandRequest:^(NSDictionary *dic) {
        
        //NSLog(@"品牌界面:%@",dic);
       _brandModel = [BBrandModel modelObjectWithDictionary:dic];
        
        UITableView *tableView = [_bigScrollView viewWithTag:22];
        [tableView reloadData];
        
    }];
    
   _ageArr = [NSArray arrayWithObjects:@"孕期产后",@"0--1岁",@"1--3岁",@"3--6岁",@"6--9岁",@"9岁以上", nil];
    
//* ----------------------------------------------- *
    //创建大的scrollView
    _bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _bigScrollView.backgroundColor = [UIColor cyanColor];
    _bigScrollView.delegate = self;
    _bigScrollView.pagingEnabled = YES;
    _bigScrollView.contentSize = CGSizeMake(3*CGRectGetWidth(_bigScrollView.frame),CGRectGetHeight(_bigScrollView.frame));
    [self.view addSubview:_bigScrollView];
    
       _letterArray= [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    
    _titleArray = @[@"热门分类",@"全球购",@"奶粉纸尿裤",@"童装童鞋",@"食品",@"用品玩具",@"鞋服箱包",@"美妆个护",@"居家百货",@"孕妈专区"];
    _segmentCtr= [[UISegmentedControl alloc]initWithItems:@[@"分类",@"品牌",@"年龄"]];
    _segmentCtr.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30);
    _segmentCtr.tintColor = [UIColor redColor];
    _segmentCtr.backgroundColor = [UIColor grayColor];
    _segmentCtr.selectedSegmentIndex = 0;
    [_segmentCtr addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentCtr];
    
    
    for (NSInteger i = 0; i < 3; i++)
    {
        if (i == 0 )
        {
            //2.*** 创建表
            UITableView *myTable = [[UITableView alloc]initWithFrame:CGRectMake(i, 30, 120, CGRectGetHeight(self.view.frame))];
            myTable.tag =11;
            myTable.rowHeight = 53;
            myTable.delegate = self;
            myTable.dataSource = self;
            [_bigScrollView addSubview:myTable];
            
            [myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID1"];
            
            //3.创建瀑布流
            CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
            layout.headerHeight =30;
            layout.footerHeight = 0;
            layout.minimumColumnSpacing = 5;
            layout.minimumInteritemSpacing = 5;
            _collection = [[SearchCollectionViewController alloc] initWithCollectionViewLayout:layout];
            
            _collection.collectionView.frame = CGRectMake(CGRectGetWidth(myTable.frame), 30, CGRectGetWidth(self.view.frame)-120, CGRectGetHeight(self.view.frame));
            
            [_bigScrollView addSubview:_collection.collectionView];
            [self addChildViewController:_collection];
            
                   }
        else if (i == 1)
        {
            //创建品牌表
            UITableView *brandTable = [[UITableView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(self.view.frame), 30, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
            brandTable.tag = 22;
            brandTable.rowHeight =60;
            brandTable.delegate = self;
            brandTable.dataSource = self;
            [_bigScrollView addSubview:brandTable];

            [brandTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID2"];
        }
        else
        {
            //创建品牌表
            UITableView *ageTable = [[UITableView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(self.view.frame), 30, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
            ageTable.tag = 33;
            ageTable.delegate = self;
            ageTable.dataSource = self;
            [_bigScrollView addSubview:ageTable];
            [ageTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID3"];
        }
        
    }
}
#pragma mark --表的数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 11)
    {
        return _titleArray.count;
    }
    else if (tableView.tag == 22)
    {
        return _letterArray.count;
    }
    else
    {
        return _ageArr.count;
    }
    
}
//区头
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 11)
    {
        return 1;
    }
    else if (tableView.tag ==22)
    {
        return 10;
    }
    else
    {
         return 1;
    }
    
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 22)
    {
        return _letterArray[section];
    }
    else
    {
        return nil;
    }
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =nil;
    
    
    if (tableView.tag ==11)
    {
       cell =[tableView dequeueReusableCellWithIdentifier:@"cellID1"];
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text =_titleArray[indexPath.row];

    }
    else if (tableView.tag ==22)
    {
        cell =[tableView dequeueReusableCellWithIdentifier:@"cellID2"];

        BMsNames *ms_namesModel = _brandModel.msNames[indexPath.row];
        //NSLog(@"%@",ms_namesModel.img);
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:ms_namesModel.img]];
        cell.textLabel.text = ms_namesModel.brand;
    }
    else
    {
        cell =[tableView dequeueReusableCellWithIdentifier:@"cellID3"];

        cell.textLabel.text =_ageArr[indexPath.row];
    }
    
    return cell;
   
}
//小挂件
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView.tag == 22)
    {
        return _letterArray;

    }
    else
    {
        return nil;
    }
}

//选中单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     //UITableView *tableView1 = [_bigScrollView viewWithTag:11];

    SMainCategorys *main_categorysModel = _searchModel.mainCategorys[indexPath.row];
    
    _collection.SModel = main_categorysModel;
    
    [_collection.collectionView reloadData];
    
}

//点击切换
-(void)segmentAction:(UISegmentedControl *)sender
{
    //NSLog(@"segment:%ld",sender.selectedSegmentIndex);
    
    //点击切换
    [_bigScrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex *CGRectGetWidth(_bigScrollView.frame), 0) animated:YES];
    
    
}
#pragma mark - scrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _segmentCtr.selectedSegmentIndex =scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
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
