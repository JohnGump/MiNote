//
//  AddAccountViewController.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "AddAccountViewController.h"
#import "AddAccountTableViewCell.h"
#import "AddAccountViewModel.h"
#define cell_id @"AddAccountTableViewCell_id"
@interface AddAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, strong)AddAccountViewModel *viewModel;
@property (nonatomic, strong)UITextField *titleField;
@property (nonatomic, strong)UITextField *userNameField;
@property (nonatomic, strong)UITextField *passWordField;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation AddAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUI {
    self.bgView.layer.cornerRadius = 22;
    [self.mainTableView registerNib:[UINib nibWithNibName:@"AddAccountTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cell_id];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cells.count;
}

- (void)bindViewModel {
    self.viewModel = [[AddAccountViewModel alloc]init];
    
}

@end
