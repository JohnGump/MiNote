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
    [self.button setBackgroundColor:[UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1]];
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
        make.size.mas_equalTo(CGSizeMake(kMAIN_WEDITH/3, 40));
    }];
    
    [self.bacView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(50);
        make.height.equalTo(@(54*5));
    }];
}



- (void)buttonDidClicked:(ALWZYbutton *)sender
{
    [self.viewModel upDateDatawithData:^{
        [sender ExitAnimationCompletion:^{
            self.addComplete();
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
    } failed:^(NSString *error) {
        [self.button setTitle:error forState:UIControlStateNormal];
        [sender ErrorRevertAnimationCompletion:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [sender setTitle:@"确定" forState:UIControlStateNormal];
            });
        }];
    }];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)_alw_bindViewModel:(ALWZYAddaccountViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    RAC(self.viewModel,title) = [self.titleTextField.textField rac_textSignal];
    RAC(self.viewModel,userName) = [self.userTextField.textField rac_textSignal];
    RAC(self.viewModel,passWord) = [self.paswTextField.textField rac_textSignal];
    
    
    
}


@end
