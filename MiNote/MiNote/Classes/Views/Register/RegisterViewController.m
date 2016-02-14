//
//  RegisterViewController.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/12.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "RegisterViewController.h"
#import "FJColor.h"
#import <BmobSDK/Bmob.h>
#import "RegisterTableViewCell.h"
#import "SViewModel.h"
#import "KEY.h"
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
    UIBarButtonItem *loginBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(commitVerificationCode)];
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
    [self login];
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

- (void)login {
    __weak typeof(self) weakSelf = self;
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MiNote"];
    //查找GameScore表里面id为0c6db13c的数据
    [bquery whereKey:@"userName" equalTo:self.phoneNumberTextField.text];
    [bquery selectKeys:@[@"objectId"]];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (array.count == 0) {
            BmobObject *gameScore = [BmobObject objectWithClassName:@"MiNote"];
            [gameScore setObject:self.phoneNumberTextField.text forKey:@"userName"];
            [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                NSLog(@"%d%@",isSuccessful,error);
                //进行操作
                [self login];
            }];
        } else {
            BmobObject *receive = array[0];
            NSLog(@"%@",receive.objectId);
            [self saveToken:receive.objectId];
        }
    }];
}

- (void)saveToken:(NSString *)token {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    [us setValue:token forKeyPath:TOKEN];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
