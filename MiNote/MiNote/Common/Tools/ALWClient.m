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

+ (void)GETDatablock:(BmobObjectResultBlock)block {
    
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *objectid = [us valueForKeyPath:TOKEN];
    
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"MiNote"];
    [query getObjectInBackgroundWithId:objectid block:^(BmobObject *object, NSError *error) {
        block(object,error);
    }];
}

+ (void)UPdateDatawithData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block{
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *objectid = [us valueForKeyPath:TOKEN];
    BmobObject *object = [BmobObject objectWithoutDatatWithClassName:@"MiNote" objectId:objectid];
    [object setObject:dataArray forKey:@"miData"];
    [object updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        block(isSuccessful,error);
    }];
}


@end
