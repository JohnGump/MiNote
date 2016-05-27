//
//  ZYMainViewModel.m
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWMainViewModel.h"
#import "AccountCell.h"
#import "ALWCellDataAdapter.h"
#import "ALWMainViewSecretModel.h"
#import "ALWClient.h"
#import "KEY.h"

@interface ALWMainViewModel()

@property (nonatomic, strong) NSMutableArray *noDataArray;

@end

@implementation ALWMainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        ALWCellDataAdapter *dataAdaper = [ALWCellDataAdapter cellDataAdapterWithCellReuseIdentifier:@"NoDataCell" data:@"您还没有添加可管理的账户,点击右上角添加账户" cellHeight:kMAIN_HEIGHT cellType:0];
        [self.noDataArray addObject:dataAdaper];
    }
    return self;
}





- (void)getDataList
{
    
    [ALWClient GETDatablock:^(NSArray *array, NSError *error) {
        [self.dataSource removeAllObjects];
        if (array) {
            for (BmobObject *obj in array) {
                ALWMainViewSecretModel *aModel = [[ALWMainViewSecretModel alloc]init];
                aModel.account = [obj objectForKey:@"account"];
                aModel.accountName = [obj objectForKey:@"accountName"];
                aModel.accountPassWord = [obj objectForKey:@"accountPassWord"];
                
                ALWCellDataAdapter *dataAdaper = [ALWCellDataAdapter cellDataAdapterWithCellReuseIdentifier:@"AccountCell" data:aModel cellHeight:70 cellType:0];
                [self.dataSource addObject:dataAdaper];
            }
            
            [self.complete sendNext:[NSNumber numberWithBool:YES]];
        }

    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource.count == 0) {
        return self.noDataArray.count;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALWCellDataAdapter *dataAdaper = nil;
    if (self.dataSource.count == 0) {
        dataAdaper = self.noDataArray[indexPath.row];
    }else{
       dataAdaper  = self.dataSource[indexPath.row];
    }
    ALWBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:dataAdaper.cellReuseIdentifier forIndexPath:indexPath];
    cell.dataAdapter = dataAdaper;
    [cell loadContent];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALWCellDataAdapter *dataAdaper = nil;
    if (self.dataSource.count == 0) {
        dataAdaper = self.noDataArray[indexPath.row];
    }else{
        dataAdaper  = self.dataSource[indexPath.row];
    }
    return dataAdaper.cellHeight;
}

- (NSMutableArray *)noDataArray
{
    if (!_noDataArray) {
        _noDataArray = [NSMutableArray array];
    }
    return _noDataArray;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (RACSubject *)complete
{
    if (!_complete) {
        _complete = [RACSubject subject];
    }
    return _complete;
}



@end
