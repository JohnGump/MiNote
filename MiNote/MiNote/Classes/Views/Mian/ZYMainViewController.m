//
//  ZYMainViewController.m
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYMainViewController.h"
#import "ZYMainViewModel.h"
#import "AccountCell.h"
@interface ZYMainViewController ()
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) ZYMainViewModel *viewModel;
@end

@implementation ZYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createVeiw];
    
    UIImage *leftImage = [UIImage imageNamed:@"刷新"];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *rightimage = [UIImage imageNamed:@"十字"];
    rightimage = [rightimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(Upload:)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:rightimage style:UIBarButtonItemStylePlain target:self action:@selector(addAccount:)];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
}

- (void)addAccount:(UIBarButtonItem *)sender
{
    
}

- (void)Upload:(UIBarButtonItem *)sender
{
    [self.tableview reloadData];
}



- (void)createVeiw
{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    [self.tableview registerClass:[AccountCell class] forCellReuseIdentifier:@"AccountCell"];
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.right.bottom.equalTo(self.view);
    }];
}
- (void)bindViewModel:(ZYMainViewModel *)viewModel
{
    self.viewModel = viewModel;
    self.tableview.dataSource = self.viewModel;
    self.tableview.delegate = self.viewModel;
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
