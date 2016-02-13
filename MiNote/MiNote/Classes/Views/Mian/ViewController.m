//
//  ViewController.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/5.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ViewController.h"
#import "KEY.h"
#import "MainTableViewCell.h"
#import "FJColor.h"
#import "mainViewModel.h"
#import "AddAccountViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RegisterViewController.h"
#define MAINCELLID @"MainTableViewCell_id"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (nonatomic, strong)NSString *objectId;
@property (nonatomic, strong)mainViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
}

- (void)viewDidAppear:(BOOL)animated {
        [self showView];

}

- (void)loadUI {
    self.bgView.layer.cornerRadius = 22;
    [self.view setBackgroundColor:FJCOLOR_BACKGROUND];
    UIBarButtonItem *addbtnItem = [[UIBarButtonItem alloc]initWithTitle:@"添 加" style:UIBarButtonItemStyleDone target:self action:@selector(addAccount)];
    self.navigationItem.rightBarButtonItem = addbtnItem;
}


- (void)showView {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    _objectId = [us valueForKeyPath:TOKEN];
    if (!_objectId) {
        RegisterViewController *aReg = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:[NSBundle mainBundle]];
        UINavigationController *aTemp = [[UINavigationController alloc]initWithRootViewController:aReg];
        [self presentViewController:aTemp animated:YES completion:nil];
        return;
    }
}

- (void)bindViewModel {
    self.viewModel = [[mainViewModel alloc]init];
    RAC(self.viewModel,modelId) = RACObserve(self, objectId);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.secrets.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MAINCELLID];
    cell.model = self.viewModel.secrets[indexPath.row];
    return cell;
}


- (void)addAccount {
    AddAccountViewController *addVc = [[AddAccountViewController alloc]init];
    [self.navigationController pushViewController:addVc animated:YES];
    
}


@end
