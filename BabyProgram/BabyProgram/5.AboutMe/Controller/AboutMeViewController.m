//
//  AboutMeViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "AboutMeViewController.h"

#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"

#import "LoginViewController.h"
#import "SettingViewController.h"
#import "MyCollectionViewController.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"


@interface AboutMeViewController ()
{

    NSArray                 *_iconArr;
    NSArray                 *_iconArr2;
    NSArray                 *_iconArr3;
    NSArray                 *_iconArr4;
    
    NSArray                 *_iconTitleArr1;
    NSArray                 *_iconTitleArr2;
    NSArray                 *_iconTitleArr3;
    NSArray                 *_iconTitleArr4;
    
}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;
@end

@implementation AboutMeViewController

//-(void)viewWillAppear:(BOOL)animated
//{
//    [];
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    //调用导航栏布局视图
    [self layoutAboutMeController];
    
       
    

    self.view.backgroundColor = [UIColor cyanColor];
    CHTCollectionViewWaterfallLayout *myLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
    //区头
    myLayout.headerHeight =30;
    //区尾
    myLayout.footerHeight = 0;
    myLayout.minimumColumnSpacing = 10;
    myLayout.minimumInteritemSpacing = 10;
    MyCollectionViewController *myCollection = [[MyCollectionViewController alloc] initWithCollectionViewLayout:myLayout];
    [self.view addSubview:myCollection.collectionView];
    [self addChildViewController:myCollection];
  

  
    
    
}







//调用导航栏视图
-(void)layoutAboutMeController
{
    UIBarButtonItem *information = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_c2c_actbar_message@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(clickInformation)];
    information.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = information;
    
    UIBarButtonItem *setBtn= [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_actbar_setting@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(clickSetUp)];
     setBtn.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = setBtn;
   
}

-(void)clickInformation
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:loginVC animated:YES];
    
    
}
-(void)clickSetUp
{
    SettingViewController *setVC = [[SettingViewController alloc]init];
    
    [self.navigationController pushViewController:setVC animated:YES];
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
