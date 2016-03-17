//
//  TodaySaleViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "TodaySaleViewController.h"
#import "RegisterViewController.h"
#import "RDVTabBarController.h"
#import "SearchViewController.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "TodaySaleRequest.h"
#import "CChildrenModel.h"

#import "CHTCollectionViewController.h"
#import "CHTCollectionDetailViewController.h"

#define SCROVIEW_WIDTH self.view.frame.size.width
#define BEIBEIWIDTH self.view.frame.size.width
#define BEIBEIHEIGHT self.view.frame.size.height

@interface TodaySaleViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIImageView             *_lineView;
    
    UIScrollView            *_bigScrollV;
    
    UISegmentedControl      *_segmentCtr;
    
    CChildrenModel          *_childrenModel;
    
    CHTCollectionDetailViewController *_detailCollection;
}
@end

@implementation TodaySaleViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    //中间贝贝图片
    UIImageView *babyImg = [[UIImageView alloc]initWithFrame:CGRectMake(BEIBEIWIDTH/2-30, 26, 54, 30)];
    babyImg.image = [UIImage imageNamed:@"beibei_logo@3x.png"];
    [self.navigationController.view  addSubview:babyImg];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //调用导航控制器视图布局方法
    [self layoutTodaySaleControllerView];
    
//  2.*** UIScrollView  滚动视图
    NSArray *titleArray = @[@"上新",@"童装",@"童鞋",@"用品",@"玩具",@"女装",@"居家",@"食品",@"美妆",@"最后疯抢",@"下期预告"];
    
    UIScrollView *smallScrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    smallScrollV.delegate =self;
    smallScrollV.pagingEnabled = YES;
    smallScrollV.showsHorizontalScrollIndicator = NO;
    smallScrollV.contentSize =CGSizeMake(2*CGRectGetWidth(smallScrollV.frame), CGRectGetHeight(smallScrollV.frame));
    [self.view addSubview:smallScrollV];
    
//  3.segment按钮
    _segmentCtr= [[UISegmentedControl alloc]initWithItems:titleArray];
    _segmentCtr.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)*2, 30);
    _segmentCtr.selectedSegmentIndex = 0;
    [_segmentCtr addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    _segmentCtr.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    //选中颜色
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                             NSForegroundColorAttributeName: [UIColor redColor]};
    [_segmentCtr setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    //正常颜色
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                               NSForegroundColorAttributeName: [UIColor blackColor]};
    [_segmentCtr setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [smallScrollV addSubview:_segmentCtr];
    
    
//   4.******创建下面的红色指示条
    //从数组得到一个要实现的标题字符串
    NSString *str = [titleArray objectAtIndex:0];
    //根据字符串的长度 和字体大小,确定需要的宽度
    CGSize size  = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //创建红色滑动指示条
   _lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rate_line@2x.png"]];
    //设置大小
    _lineView.bounds = CGRectMake(0, 0, size.width, 3);
    _lineView.center =CGPointMake(30, 30);
    _lineView.backgroundColor = [UIColor redColor];
    [smallScrollV addSubview:_lineView];
    
//  * --------------------------------------------- *
    
//  5.****** 大的滚动视图
    
    _bigScrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 32, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-75-50)];
    _bigScrollV.delegate =self;
    _bigScrollV.pagingEnabled = YES;
    _bigScrollV.showsHorizontalScrollIndicator = NO;
    _bigScrollV.contentSize =CGSizeMake(11*CGRectGetWidth(_bigScrollV.frame), CGRectGetHeight(_bigScrollV.frame));
    _bigScrollV.backgroundColor =[UIColor redColor];
    [self.view addSubview:_bigScrollV];

    //6.调用主视图collection
    [self createMainCollectionView];
    //7.调用童装视图
    [self createDetailCollectionView];
    
    
}
#pragma mark --创建主视图collectionView
-(void)createMainCollectionView
{
    //6.*** 主页瀑布流
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.headerHeight =30;
    layout.footerHeight = 10;
    layout.footerHeight =0;
    layout.headerHeight =0;
    layout.minimumColumnSpacing = 0;
    layout.minimumInteritemSpacing = 2;
    
    CHTCollectionViewController *collection = [[CHTCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [_bigScrollV addSubview:collection.collectionView];
    [self addChildViewController:collection];

}
//创建10个collectionView
-(void)createDetailCollectionView
{
    for (int i = 0; i < 10; i++)
    { 
        //详情页面瀑布流
        CHTCollectionViewWaterfallLayout *detailLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        detailLayout.headerHeight =0;
        detailLayout.footerHeight = 0;
        detailLayout.minimumColumnSpacing = 0;
        detailLayout.minimumInteritemSpacing = 0;
        
        _detailCollection = [[CHTCollectionDetailViewController alloc]initWithCollectionViewLayout:detailLayout];

        //将collectionView添加到_bigScrollV上
        _detailCollection.collectionView.frame = CGRectMake(CGRectGetWidth(self.view.frame)*(i+1), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));

        
        _detailCollection.cModel = _childrenModel;
        [_detailCollection.collectionView reloadData];
        
        [_bigScrollV addSubview:_detailCollection.collectionView];
        [self addChildViewController:_detailCollection];

    }
}

//代理
#pragma mark -- 点击切换
-(void)segmentAction:(UISegmentedControl*)sender
{
    //NSLog(@"segment :%lu",sender.selectedSegmentIndex);
    
    //请求童装之后的界面
    [TodaySaleRequest onTheChildren:sender.selectedSegmentIndex  cBlock:^(NSDictionary *dic) {
        ////NSLog(@"dic:%@",dic);
        //这个页面得到数据
        
        _childrenModel = [CChildrenModel modelObjectWithDictionary:dic];

        //[[NSNotificationCenter defaultCenter] postNotificationName:@"getUrl" object:self userInfo:@{@"Model":_childrenModel}];
         
    }];
  /*
    [TodaySaleRequest onTheCommandChildren:^(NSDictionary *dic) {
        //NSLog(@"comDic:%@",dic);
        
        NSDictionary *bannersDic = [dic objectForKey:@"martshow_cat_banners"];
        NSArray *dressArr = [bannersDic objectForKey:@"dress--"];
        NSDictionary *dressDic = [dressArr objectAtIndex:0];
        NSString *img = [dressDic objectForKey:@"img"];
        
        _detailCollection.imgUrl = img;
        
        //        _imgUrl = img;
        [_detailCollection.collectionView reloadData];
        NSLog(@"imgUrl:%@",img);
        
    }];
*/
    
    
    float width =  (CGRectGetWidth(self.view.frame)*2)/11;
    //点击的时候红色调就会根据文字长短自动计算出自身长短
    [UIView animateWithDuration:0.1 animations:^{
        //动画效果
    _lineView.center = CGPointMake(width/2*((sender.selectedSegmentIndex *2)+1), _lineView.center.y);

    }];
    
    //点击切换
    [_bigScrollV setContentOffset:CGPointMake(sender.selectedSegmentIndex*CGRectGetWidth(_bigScrollV.frame), 0) animated:YES];
    
}
#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _segmentCtr.selectedSegmentIndex = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    
    
    [UIView animateWithDuration:0.1 animations:^{
        //动画效果
        float segWidth =(CGRectGetWidth(self.view.frame)*2)/11;
        _lineView.center = CGPointMake(segWidth * _segmentCtr.selectedSegmentIndex +(CGRectGetWidth(self.view.frame)*2)/11/2, _lineView.center.y);

    }];

    [self createDetailCollectionView];
}



//布局导航控制器视图
-(void)layoutTodaySaleControllerView
{
    //左侧信息按钮
    UIBarButtonItem *infoBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_c2c_actbar_message"] style:UIBarButtonItemStyleDone target:self action:@selector(infoClick)];
    infoBtn.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem =infoBtn;
//    //NSLog(@"%d",CGRectGetWidth(infoBtn.width));
    
    //右侧搜索按钮
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_default_search"] style:UIBarButtonItemStyleDone target:self action:@selector(searchClick)];
    searchBtn.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem =searchBtn;
    
}


#pragma mark --信息按钮
-(void)infoClick
{
     RegisterViewController *registerVC =[RegisterViewController alloc];
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
#pragma mark --搜索按钮
-(void)searchClick
{
    SearchViewController *searchVC =[[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
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
