//
//  SettingViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/8.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "SettingViewController.h"
#import "RDVTabBarController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView             *_settingTable;
    
    NSArray                 *_tableArray;
    
   
}
@end

@implementation SettingViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航栏
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title =@"设置";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *titleArr1 = @[@"个人资料",@"账户与安全",@"收货地址",@"实名认证",@"证件信息"];
     NSArray *titleArr2 = @[@"关于贝贝",@"清理缓存"];
    NSArray *titleArr3 =@[@"关闭消息推送"];
     _tableArray= @[titleArr1,titleArr2,titleArr3];
    
    /*
    NSArray  *imgArr  = @[[UIImage imageNamed:@"ic_tabbar_my@2x.png"],
                        [UIImage imageNamed:@"set_ico_safe@2x.png"],
                        [UIImage imageNamed:@"set_ico_zhengpin@2x.png"],
                        [UIImage imageNamed:@"ic_c2c_guanzhu@2x.png"],
                        [UIImage imageNamed:@"img_login_weixin@2x.png"],
                        [UIImage imageNamed:@"ic_tips_packing@2x.png"],
                        [UIImage imageNamed:@"ic_news_delt@2x.png"],
                        [UIImage imageNamed:@"c2c_ic_chart_label_xh2@2x.png"]];
    */
    
    _settingTable= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-49) style:UITableViewStyleGrouped];
    _settingTable.sectionFooterHeight = 0;
    _settingTable.rowHeight = 60;
    _settingTable.delegate = self;
    _settingTable.dataSource =self;
    
    [self.view addSubview:_settingTable];
    
    //注册cell
    [_settingTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    [self createButton];
    
    
}

#pragma mark --表必须实现的方法
//返回区头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
//返回区的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    cell.textLabel.text = _tableArray[indexPath.section][indexPath.row];
   
    
    return cell;
    
}


-(void)createButton
{
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame)-49-64, CGRectGetWidth(self.view.frame), 50);
    
    loginBtn.backgroundColor = [UIColor redColor];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginBtn setTitle:@"登录贝贝" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    UIImage *backImg = [UIImage imageNamed:@"ic_actbar_back_black@2x.png"];
    
    UIBarButtonItem *information = [[UIBarButtonItem alloc]initWithImage:backImg style:UIBarButtonItemStyleDone target:self action:@selector(backClick) ];
    backImg = [backImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = information;
    
}
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loginClick
{
    //NSLog(@"点击了登录贝贝按钮...");
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
