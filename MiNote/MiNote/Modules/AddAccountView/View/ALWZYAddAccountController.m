//
//  ALWZYAddAccountController.m
//  MiNote
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYAddAccountController.h"
#import "ALWZYAddaccountViewModel.h"
#import "ALWZYTextField.h"
#import "ALWZYbutton.h"
@interface ALWZYAddAccountController ()
<
ALWZYbuttonDelegate
>
@property (nonatomic, strong) ALWZYTextField           *userTextField;
@property (nonatomic, strong) ALWZYTextField           *paswTextField;
@property (nonatomic, strong) ALWZYTextField           *titleTextField;
@property (nonatomic, strong) ALWZYbutton              *button;
@property (nonatomic, strong) UIView                   *bacView;
@property (nonatomic, strong) ALWZYAddaccountViewModel *viewModel;
@end

@implementation ALWZYAddAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _alw_configSubViews];
    [self _alw_configConstraints];
}

- (void)_alw_configSubViews
{
    self.view.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.000];
    self.bacView                    = [[UIView alloc] init];
    self.userTextField              = [[ALWZYTextField alloc] init];
    self.titleTextField             = [[ALWZYTextField alloc] init];
    self.paswTextField              = [[ALWZYTextField alloc] init];
    self.button                     = [ALWZYbutton buttonWithType:UIButtonTypeSystem];
    self.bacView.backgroundColor         = [UIColor colorWithWhite:0.945 alpha:1.000];
    self.bacView.layer.masksToBounds     = YES;
    self.bacView.layer.cornerRadius      = 5.0f;
    self.bacView.layer.masksToBounds     = NO;
    self.bacView.layer.shadowRadius      = 5.0f;
    self.bacView.layer.shadowOffset      = CGSizeMake(0.0, 5.0f);
    self.bacView.layer.shadowOpacity     = 0.5;
    self.button.backgroundColor     = [UIColor redColor];
    self.button.tintColor           = [UIColor whiteColor];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius  = 40/2;
    self.button.delegate            = self;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.userTextField.title.text   = @"用户名:";
    self.titleTextField.title.text  = @"账户:";
    self.paswTextField.title.text   = @"密码:";
    [self.view       addSubview:self.bacView];
    [self.bacView    addSubview:self.userTextField];
    [self.bacView    addSubview:self.titleTextField];
    [self.bacView    addSubview:self.paswTextField];
    [self.bacView    addSubview:self.button];
}

- (void)_alw_configConstraints
{
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bacView.mas_top).offset(10);
        make.centerX.equalTo(self.bacView.mas_centerX);
        make.right.equalTo(self.bacView.mas_right).offset(-80);
        make.height.equalTo(@(44));
    }];
    
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bacView.mas_centerX);
        make.top.equalTo(self.titleTextField.mas_bottom).offset(10);
        make.right.equalTo(self.bacView.mas_right).offset(-80);
        make.height.equalTo(@(44));
    }];
    
    [self.paswTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bacView.mas_centerX);
        make.top.equalTo(self.userTextField.mas_bottom).offset(10);
        make.right.equalTo(self.bacView.mas_right).offset(-80);
        make.height.equalTo(@(44));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bacView.mas_centerX);
        make.bottom.equalTo(self.bacView.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [self.bacView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(50);
        make.height.equalTo(@(54*5));
    }];
}

#pragma mark ALWZYbutton
- (void)buttonDidClicked:(ALWZYbutton *)sender
{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bacView.mas_centerX);
        make.bottom.equalTo(self.bacView.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    [self.button beginAnimation];
}

- (void)beginAnimation:(ALWZYbutton *)sender
{
#warning HTTPrequest
}

- (void)endAnimation:(ALWZYbutton *)sender
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)_alw_bindViewModel:(ALWZYAddaccountViewModel *)viewModel
{
    
    self.viewModel = viewModel;
}


@end
