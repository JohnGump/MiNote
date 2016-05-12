//
//  AddAccountViewModel.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "AddAccountViewModel.h"
#import "AddAccountModel.h"
@implementation AddAccountViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData {
    
    self.cells = [NSMutableArray array];
    
    AddAccountModel *aModel = [[AddAccountModel alloc]init];
    AddAccountModel *cModel = [[AddAccountModel alloc]init];
    AddAccountModel *bModel = [[AddAccountModel alloc]init];
    
    aModel.title = @"名  称";
    bModel.title = @"用户名";
    cModel.title = @"密  码";
    
    [self.cells addObject:aModel];
    [self.cells addObject:bModel];
    [self.cells addObject:cModel];

}

@end
