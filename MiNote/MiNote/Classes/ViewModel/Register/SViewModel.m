//
//  SViewModel.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/12.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "SViewModel.h"
#import "RegisterModel.h"
@implementation SViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellArray = [NSMutableArray array];
        RegisterModel *aModel = [[RegisterModel alloc]init];
        aModel.iconImage = [UIImage imageNamed:@"icon_phone"];
        RegisterModel *bModel = [[RegisterModel alloc]init];
        bModel.iconImage = [UIImage imageNamed:@"icon_lock"];
        [self.cellArray addObject:aModel];
        [self.cellArray addObject:bModel];
    }
    return self;
}

@end
