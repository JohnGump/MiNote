//
//  ZYMainViewController.m
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWMainViewController.h"
#import "ALWMainViewModel.h"
#import "ALWBasicCell.h"
#import "NoDataCell.h"
#import "AccountCell.h"
#import "KEY.h"
#import "ALWRegisterViewController.h"
#import "ALWRegisterViewModel.h"
#import "ALWBaseNavigationController.h"
#import "ALWZYAddAccountController.h"
#import "ALWZYAddaccountViewModel.h"
#import "ALWPopOverView.h"
@interface ALWMainViewController ()
<
ALWPopOverViewDelegate
>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) ALWMainViewModel *viewModel;
@property (nonatomic, strong)NSString *objectId;
@end

@implementation ALWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _alw_configSubViews];
    [self _alw_configNavigationBar];
}

- (void)_alw_configSubViews
{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    [self.tableview registerClass:[ALWBasicCell class] forCellReuseIdentifier:@"ZYBasicCell"];
    [self.tableview registerClass:[AccountCell class] forCellReuseIdentifier:@"AccountCell"];
    [self.tableview registerClass:[NoDataCell class] forCellReuseIdentifier:@"NoDataCell"];
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.right.bottom.equalTo(self.view);
    }];
}

- (void)_alw_configNavigationBar
{
    UIImage *leftImage = [UIImage imageNamed:@"tool_icon_refresh"];
//    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *rightimage = [UIImage imageNamed:@"home_add"];
//    rightimage = [rightimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(_alw_refreshData)];
//    UIBarButtonItem *addAccountButtonItem = [[UIBarButtonItem alloc] initWithImage:rightimage style:UIBarButtonItemStylePlain target:self action:@selector(_alw_addAccount)];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setImage:rightimage forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(_alw_addAccount:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = refreshButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    //    self.navigationItem.rightBarButtonItem = addAccountButtonItem;
}

- (void)_alw_addAccount:(UIButton *)sender
{
    NSArray *array = @[@"添加账号",@"设置账号"];
    ALWPopOverView *popOverView = [[ALWPopOverView alloc] initWithBounds:CGRectMake(0, 0, kMAIN_WEDITH/4,array.count*44) titleMenus:array];
    popOverView.containerBackgroudColor = [UIColor blackColor];
    popOverView.delegate = self;
    [popOverView showFrom:sender alignStyle:ALWAlingStyle_Right];
}

#pragma mark -ALWPopOverVeiwDelegate

- (void)popPverViewDidShow:(ALWPopOverView *)view
{
    
}

- (void)popOverViewDidDismiss:(ALWPopOverView *)view
{
    
}

- (void)popOverView:(ALWPopOverView *)view didClickedMenuIndex:(NSInteger)index
{
    [view dismiss];
    if (index == 0) {
        ALWZYAddAccountController *viewController = [[ALWZYAddAccountController alloc] initWithViewModel:[[ALWZYAddaccountViewModel alloc] init]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)_alw_refreshData
{
    [self.tableview reloadData];
}

- (void)_alw_bindViewModel:(ALWMainViewModel *)viewModel
{
    self.viewModel = viewModel;
    self.tableview.dataSource = self.viewModel;
    self.tableview.delegate = self.viewModel;
    RAC(self.viewModel,objectId) = RACObserve(self, objectId);
   NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    self.objectId = [us valueForKey:TOKEN];
    if (!self.objectId) {
        UINavigationController *navigation = ({
            ALWRegisterViewController *viewController = [[ALWRegisterViewController alloc] initWithViewModel:[[ALWRegisterViewModel alloc] init]];
            [[ALWBaseNavigationController alloc] initWithRootViewController:viewController];
        });
        [self presentViewController:navigation animated:YES completion:nil];
    }
}

@end
