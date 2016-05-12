//
//  ZYRegisterViewController.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYRegisterViewController.h"
#import "ZYRegisterViewModel.h"
@interface ZYRegisterViewController ()

<
UITextFieldDelegate
>

@property (nonatomic, strong) ZYRegisterViewModel *viewModel;
@property (nonatomic, strong) UITextField *account;
@property (nonatomic, strong) UIImageView *accountImage;
@property (nonatomic, strong) UIView *dividerOne;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, strong) UIImageView *passWordImage;
@property (nonatomic, strong) UIView *dividerTwo;
@property (nonatomic, strong) UIButton *verificationCode;
@end

@implementation ZYRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    [self createView];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(complete:)];
    self.navigationItem.rightBarButtonItem = right;
    
    
}

- (void)complete:(UIBarButtonItem *)sender
{
    
    
}



- (void)createView
{
    self.accountImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_phone"]];
    self.passWordImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_lock"]];
    
    self.account = [[UITextField alloc] init];
    self.account.font = [UIFont systemFontOfSize:15.0f];
    self.account.delegate = self.viewModel;
    self.account.tag = 101;
    self.account.returnKeyType = UIReturnKeyNext;
    self.account.backgroundColor = [UIColor whiteColor];
    self.account.placeholder = @"手机号";
    
    self.dividerOne = [[UIView alloc] init];
    self.dividerOne.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    
    
    self.passWord = [[UITextField alloc] init];
    self.passWord.font = [UIFont systemFontOfSize:15.0f];
    self.passWord.delegate = self.viewModel;
    self.passWord.tag = 102;
    self.passWord.backgroundColor = [UIColor whiteColor];
    self.passWord.placeholder = @"验证码";
    
    self.verificationCode = [UIButton buttonWithType:UIButtonTypeSystem];
    self.verificationCode.enabled = NO;
    self.verificationCode.tintColor = [UIColor whiteColor];
    
    self.dividerTwo = [[UIView alloc] init];
    self.dividerTwo.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    
    
    
    [self.view addSubview:self.accountImage];
    [self.view addSubview:self.passWordImage];
    [self.view addSubview:self.dividerOne];
    [self.view addSubview:self.dividerTwo];
    [self.view addSubview:self.account];
    [self.view addSubview:self.passWord];
    [self.view addSubview:self.verificationCode];
    
    
    [self.accountImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(self.view).offset(30);
        make.height.equalTo(@(20));
        make.width.equalTo(@(20));
    }];
    
    [self.account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountImage.mas_right).offset(5);
        make.right.equalTo(self.verificationCode.mas_left).offset(-5);
        make.height.equalTo(@(20));
        make.top.equalTo(self.view).offset(30);
        
    }];
    
    [self.verificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-5);
        make.top.equalTo(self.view).offset(20);
        make.height.equalTo(@(40));
        make.width.equalTo(@(100));
    }];
    
    [self.dividerOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountImage.mas_bottom).offset(10);
        make.left.equalTo(self.accountImage.mas_left);
        make.right.equalTo(self.account.mas_right);
        make.height.equalTo(@(1));
        
    }];
    
    [self.passWordImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(self.dividerOne).offset(20);
        make.height.equalTo(@(20));
        make.width.equalTo(@(20));
    }];
    
    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passWordImage.mas_right).offset(5);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.dividerOne.mas_bottom).offset(20);
        make.height.equalTo(@(20));
    }];
    
    [self.dividerTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWordImage.mas_bottom).offset(20);
        make.right.equalTo(self.passWord.mas_right);
        make.left.equalTo(self.passWordImage.mas_left);
        make.height.equalTo(@(1));
    }];
    
    
    
    
}



- (void)bindViewModel:(ZYRegisterViewModel *)viewModel
{
    [super bindViewModel:viewModel];
    self.viewModel = viewModel;
    RAC(self.viewModel,Phone) = self.account.rac_textSignal;
    RAC(self.viewModel,verificationCode) = self.passWord.rac_textSignal;
    
    [RACObserve(self.verificationCode, enabled) subscribeNext:^(id x) {
        BOOL enabled = [x boolValue];
        if (enabled) {
            self.verificationCode.backgroundColor = [UIColor colorWithRed:0.182 green:0.794 blue:0.988 alpha:1.000];
            [self.verificationCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        }else{
            self.verificationCode.backgroundColor = [UIColor lightGrayColor];
            [self.verificationCode setTitle:@"输入手机号" forState:UIControlStateNormal];
        }
    }];
    
    RAC(self.verificationCode,enabled) = RACObserve(self.viewModel, isEdit);
    
    RAC(self.viewModel,getVerification) = [self.verificationCode rac_signalForControlEvents:UIControlEventTouchUpInside];
    [self.viewModel.complete subscribeNext:^(id x) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
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
