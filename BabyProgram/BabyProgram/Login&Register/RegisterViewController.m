//
//  RegisterViewController.m
//  BabyProgram
//
//  Created by jie on 16/3/2.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "RegisterViewController.h"
#import "Masonry.h"
#import "RDVTabBarController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//新浪微博SDK头文件
#import "WeiboSDK.h"



#define INTERVAL   (CGRectGetWidth(self.view.frame)-80*3)/4
@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    self.view.backgroundColor = [UIColor blueColor];
    
 
    //调用布局方法
    [self layoutRegisterView];

    
    
    
}
-(void)layoutRegisterView
{
    //1.电话输入框
    UITextField *phoneTF = [[UITextField alloc]init];
    phoneTF.borderStyle = UITextBorderStyleRoundedRect;
    phoneTF.placeholder = @"请输入11位手机号";
    phoneTF.font = [UIFont systemFontOfSize:20];
    phoneTF.textAlignment = NSTextAlignmentCenter;
    phoneTF.clearButtonMode = UITextFieldViewModeAlways;
    phoneTF.keyboardType = UIKeyboardTypeNamePhonePad;
    phoneTF.returnKeyType = UIReturnKeyGoogle;
    [phoneTF becomeFirstResponder];
    [self.view addSubview:phoneTF];
    phoneTF.translatesAutoresizingMaskIntoConstraints =NO;
    //电话输入框--约束
    [phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(self.view.mas_top).with.offset(20.f);
        make.right.equalTo(self.view.mas_right).with.offset(-20.f);
        make.height.equalTo(@35);
    }];
    
    //1.电话图片
    UIImageView  *phoneImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_login_telephone"]];
    [self.view addSubview:phoneImg];
    //******* 约束
    phoneImg.translatesAutoresizingMaskIntoConstraints = NO;
    [phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        //配置具体的约束信息
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(self.view.mas_top).with.offset(20.f);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
    
    //*-------------------------------------------*
    
    //2.验证码输入框
    UITextField *messageTF = [[UITextField alloc]init];
    messageTF.borderStyle = UITextBorderStyleRoundedRect;
    messageTF.placeholder = @"请输入6为短信验证码";
    messageTF.font = [UIFont systemFontOfSize:20];
    messageTF.textAlignment = NSTextAlignmentCenter;
    messageTF.clearButtonMode = UITextFieldViewModeAlways;
    messageTF.keyboardType = UIKeyboardTypeNamePhonePad;
    messageTF.returnKeyType = UIReturnKeyGoogle;
    [messageTF becomeFirstResponder];
    [self.view addSubview:messageTF];
    messageTF.translatesAutoresizingMaskIntoConstraints =NO;
    //短信验证码--约束
    [messageTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(phoneTF.mas_bottom).with.offset(20.f);
        make.right.equalTo(self.view.mas_right).with.offset(-20.f);
        make.height.equalTo(@35);
    }];
    //2.验证码图片
    UIImageView  *messageImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_test_email"]];
    [self.view addSubview:messageImg];
    
    //******* 约束
    messageImg.translatesAutoresizingMaskIntoConstraints = NO;
    [messageImg mas_makeConstraints:^(MASConstraintMaker *make) {
        //配置具体的约束信息
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(phoneTF.mas_bottom).with.offset(20.f);
        make.height.equalTo(@35);
        make.width.equalTo(@35);
    }];
    
     //*-------------------------------------------*
    //3.密码输入框
    UITextField *pawTF = [[UITextField alloc]init];
    pawTF.borderStyle = UITextBorderStyleRoundedRect;
    pawTF.placeholder = @"请设置密码(6~16个字符)";
    pawTF.font = [UIFont systemFontOfSize:20];
    pawTF.textAlignment = NSTextAlignmentCenter;
    pawTF.clearButtonMode = UITextFieldViewModeAlways;
    pawTF.keyboardType = UIKeyboardTypeNamePhonePad;
    pawTF.returnKeyType = UIReturnKeyGoogle;
    [pawTF becomeFirstResponder];
    [self.view addSubview:pawTF];
    pawTF.translatesAutoresizingMaskIntoConstraints =NO;
    [pawTF mas_makeConstraints:^(MASConstraintMaker *make) {
        //配置具体的约束信息
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(messageTF.mas_bottom).with.offset(20.f);
        make.right.equalTo(self.view.mas_right).with.offset(-20.f);
        make.height.equalTo(@35);
    }];

    //3.密码图片
    UIImageView  *pawImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no_reminder"]];
    [self.view addSubview:pawImg];
    
    //******* 约束
    pawImg.translatesAutoresizingMaskIntoConstraints = NO;

    [pawImg mas_makeConstraints:^(MASConstraintMaker *make) {
        //配置具体的约束信息
        make.left.equalTo(self.view.mas_left).with.offset(20.f);
        make.top.equalTo(messageTF.mas_bottom).with.offset(20.f);
        make.height.equalTo(@35);
        make.width.equalTo(@35);
    }];

    

    //注册按钮
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
    registerButton.backgroundColor = [UIColor redColor];
    //绑方法
    [registerButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(30.f);
        make.top.equalTo(pawTF.mas_bottom).with.offset(30.f);
        make.right.equalTo(self.view.mas_right).with.offset(-30.f);
        make.height.equalTo(@35);
    }];
    
    
    
    //*-------------------------------*
    UILabel * label = [[UILabel alloc]init];
    label.text = @"-------- 使用合作账号登录 ----------";
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font =  [UIFont systemFontOfSize:18];
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(30.f);
        make.top.equalTo(registerButton.mas_bottom).with.offset(100.f);
        make.right.equalTo(self.view.mas_right).with.offset(-30.f);
        make.height.equalTo(@35);
    }];
    
    
    //* --------------------------------- *
    
    //for 循环创建 微信 QQ  新浪微博
    UIButton *btn = nil;
    NSArray *stringArr = @[@"微 信",@"QQ",@"新浪微博"];
    NSArray *imgArr =@[[UIImage imageNamed:@"ic_share_weixin"],
                       [UIImage imageNamed:@"ic_share_qq"],
                       [UIImage imageNamed:@"ic_share_weibo"]];
 
    for (int i = 0; i <3; i ++)
    {
        //微信按钮 QQ 新浪微博
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = [UIColor cyanColor];
        [button setImage:imgArr[i] forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0,15,20,0);
        [button setTitle:stringArr[i] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
//        button.titleLabel.backgroundColor = [UIColor redColor];
        button.titleEdgeInsets = UIEdgeInsetsMake(50, -50, 0, 0);
        button.tintColor = [UIColor blackColor];
        //记录tag值
        button.tag =i+1;
        button.titleLabel.font =[UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button mas_makeConstraints:^(MASConstraintMaker *make)
        {
            //配置具体的约束信息
            if (i == 0)
            {
                make.left.equalTo(self.view.mas_left).with.offset(INTERVAL);
            }
            else
            {
            
                make.left.equalTo(btn.mas_right).with.offset(INTERVAL);
            }
            
            make.top.equalTo(label.mas_bottom).with.offset(20.f);
            make.height.equalTo(@80);
            make.width.equalTo(@80);
        }];
        
        //记录上次循环的button
        btn = button;
    }
    

   

    
    

}
#pragma mark --微信 QQ 新浪微博点击事件
-(void)buttonClick:(UIButton *)clickBtn
{
    if (clickBtn.tag == 1)
    {
        //微信
        [ShareSDK getUserInfo:SSDKPlatformTypeWechat
               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
         {
             if (state == SSDKResponseStateSuccess)
             {
                 
                 NSLog(@"uid=%@",user.uid);
                 NSLog(@"%@",user.credential);
                 NSLog(@"token=%@",user.credential.token);
                 NSLog(@"nickname=%@",user.nickname);
             }
             
             else
             {
                 NSLog(@"%@",error);
             }
             
         }];
        
        
    }
    else if (clickBtn.tag == 2)
    {
        //qq
        //例如QQ的登录
        [ShareSDK getUserInfo:SSDKPlatformTypeQQ
               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
         {
             if (state == SSDKResponseStateSuccess)
             {
                 
                 NSLog(@"uid=%@",user.uid);
                 NSLog(@"%@",user.credential);
                 NSLog(@"token=%@",user.credential.token);
                 NSLog(@"nickname=%@",user.nickname);
             }
             
             else
             {
                 NSLog(@"%@",error);
             }
             
         }];
    }
    else
    {
        //新浪微博
        [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
         {
             if (state == SSDKResponseStateSuccess)
             {
                 
                 NSLog(@"uid=%@",user.uid);
                 NSLog(@"%@",user.credential);
                 NSLog(@"token=%@",user.credential.token);
                 NSLog(@"nickname=%@",user.nickname);
             }
             else
             {
                 NSLog(@"%@",error);
             }
             
         }];
       
    }
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
