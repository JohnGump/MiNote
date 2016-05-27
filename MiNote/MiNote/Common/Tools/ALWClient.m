//
//  DataLoad.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWClient.h"
#import "KEY.h"
@implementation ALWClient

+ (void)GETDatablock:(BmobObjectArrayResultBlock)block {
    
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *objectid = [us valueForKeyPath:TOKEN];
    
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"MiNote"];
    [query whereKey:@"userName" equalTo:objectid];
    [query selectKeys:@[@"account",@"accountName",@"accountPassWord"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        block(array,error);
    }];
}

+ (void)UPdateDatawithData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block{
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *objectid = [us valueForKeyPath:TOKEN];
    BmobObject *account = [BmobObject objectWithClassName:@"MiNote"];
    NSDictionary *dict = [dataArray firstObject];
    [account setObject:objectid forKey:@"userName"];
    [account setObject:dict[@"title"] forKey:@"account"];
    [account setObject:dict[@"userName"] forKey:@"accountName"];
    [account setObject:dict[@"passWord"] forKey:@"accountPassWord"];
    
    [account saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        block(isSuccessful,error);
    }];
    
}


@end
