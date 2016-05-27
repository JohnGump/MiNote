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
                
                ALWCellDataAdapter *dataAdaper = [ALWCellDataAdapter cellDataAdapterWithCellReuseIdentifier:@"AccountCell" data:aModel cellHeight:120 cellType:0];
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
//将要显示cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.contentView.alpha = 0.3;
    cell.contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.5 delay:0.3 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:1 animations:^{
        cell.contentView.alpha = 1;
        cell.contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
//        cell.contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
}

//- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    ALWBasicCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//    scaleAnimation.duration           = 0.1f;
//    scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
//    [cell.contentView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    ALWBasicCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//    scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
//    scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
//    scaleAnimation.springBounciness    = 20.f;
//    [cell.contentView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//}



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
