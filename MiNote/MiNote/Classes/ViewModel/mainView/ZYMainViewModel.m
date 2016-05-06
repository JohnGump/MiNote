//
//  ZYMainViewModel.m
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYMainViewModel.h"
#import "AccountCell.h"
#import "CellDataAdapter.h"
#import "SecretModel.h"
@implementation ZYMainViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellDataAdapter *dataAdaper = self.dataSource[indexPath.row];
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell"];
    cell.dataAdapter = dataAdaper;
    [cell loadContent];
    return cell;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}



@end
