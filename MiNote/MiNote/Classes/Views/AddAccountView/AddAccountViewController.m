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
#import "DataLoad.h"
#import "FJColor.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#define cell_id @"AddAccountTableViewCell_id"
@interface AddAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, strong)AddAccountViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (nonatomic, strong)UITextField *titleField;
@property (nonatomic, strong)UITextField *userNameField;
@property (nonatomic, strong)UITextField *passWordField;
@property (nonatomic, strong)AddAccountModel *model;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation AddAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadUI {
    [self.sendBtn setBackgroundColor:FJCOLOR_BLUE_BTN];
    self.sendBtn.layer.cornerRadius = 10;
    [self.sendBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = FJCOLOR_BACKGROUND;
    self.bgView.layer.cornerRadius = 22;
    [self.mainTableView registerNib:[UINib nibWithNibName:@"AddAccountTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cell_id];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    cell.model = self.viewModel.cells[indexPath.row];
    switch (indexPath.row) {
        case 0:
//            RAC(self,model.title) = RACObserve(cell,msgfield.text);
            self.titleField = cell.msgfield;
            break;
        case 1:
//            RAC(self,model.userName) = RACObserve(cell,msgfield.text);
            self.userNameField = cell.msgfield;

        case 2:
//            RAC(self,model.passWord) = RACObserve(cell,msgfield.text);
            self.passWordField = cell.msgfield;

        default:
            break;
    }
    return cell;
}

- (void)bindViewModel {
    self.viewModel = [[AddAccountViewModel alloc]init];
    self.model = [[AddAccountModel alloc]init];
    RAC(self,model.title) = RACObserve(self,titleField.text);
    RAC(self,model.userName) = RACObserve(self,userNameField.text);
    RAC(self,model.passWord) = RACObserve(self,passWordField.text);

}

- (void)submit {
    
    NSMutableArray *array = [NSMutableArray array];
    self.model.title = self.titleField.text;
    self.model.userName = self.userNameField.text;
    self.model.passWord = self.passWordField.text;
//    [array addObject:self.model];
    NSDictionary *dic = @{@"title":self.model.title,@"userName":self.model.userName,@"passWord":self.model.passWord};
    [array addObject:dic];
    
    [DataLoad UPdateDatawithData:array block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        NSLog(@"%d",isSuccessful);
    }];
}
@end
