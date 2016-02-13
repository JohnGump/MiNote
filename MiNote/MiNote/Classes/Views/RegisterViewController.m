//
//  RegisterViewController.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/12.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "RegisterViewController.h"
#import "FJColor.h"
#import "RegisterTableViewCell.h"
#import "SViewModel.h"
#import <SMS_SDK/SMSSDK.h>
#import "Core.h"

#define REGID @"RegisterTableViewCell_id"
@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_sendButton;
}
@property (nonatomic, strong) UITextField *phoneNumberTextField;
@property (nonatomic, strong) UITextField *verifyTextField;
@property (nonatomic, strong) SViewModel *viewModel;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self bindViewModel];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUI {
    self.title = @"登录";
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.mainTableView registerNib:[UINib nibWithNibName:@"RegisterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:REGID];

    self.mainTableView.sectionHeaderHeight = 0;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    self.backGroundView.backgroundColor = [UIColor whiteColor];
    self.backGroundView.layer.cornerRadius = 22;
    UIBarButtonItem *loginBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(commitVerificationCode)];
    self.navigationItem.rightBarButtonItem = loginBtnItem;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REGID];
    cell.cellModel = self.viewModel.cellArray[indexPath.row];
    if (indexPath.row == 0) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.frame = CGRectMake(kMAIN_WEDITH - 150, 15, 90, 30);
        [_sendButton addTarget:self action:@selector(sendVerifty) forControlEvents:UIControlEventTouchUpInside];
        [_sendButton setBackgroundColor:FJCOLOR_BLUE_BTN];
        _sendButton.font = [UIFont systemFontOfSize:13];
        [_sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [cell addSubview:_sendButton];
        self.phoneNumberTextField = cell.phoneTextField;
    } else if (indexPath.row == 1) {
        self.verifyTextField = cell.phoneTextField;
    }
    return cell;
    
}

- (void)bindViewModel {
    self.viewModel = [[SViewModel alloc]init];
}

- (void)commitVerificationCode {
    [SMSSDK commitVerificationCode:self.verifyTextField.text phoneNumber:self.phoneNumberTextField.text zone:@"86" result:^(NSError *error) {
        NSLog(@"%@",error);
        
        
        
        
    }];
}

- (void)sendVerifty {
    _sendButton.backgroundColor = [UIColor grayColor];
    _sendButton.enabled = NO;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumberTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        NSLog(@"发送成功,%@",error);
    }];
}

@end
