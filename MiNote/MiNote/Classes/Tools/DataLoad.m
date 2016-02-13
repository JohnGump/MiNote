//
//  DataLoad.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "DataLoad.h"

@implementation DataLoad

+ (void)GETDataWithObjectId:(NSString *)objectid block:(BmobObjectResultBlock)block {
    BmobQuery *query = [BmobQuery queryWithClassName:@"MiNote"];
    [query getObjectInBackgroundWithId:objectid block:^(BmobObject *object, NSError *error) {
        block(object,error);
    }];
}

+ (void)UPdateDataWithObjectId:(NSString *)objectid withData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block{
    BmobObject *object = [BmobObject objectWithoutDatatWithClassName:@"MiNote" objectId:objectid];
    [object setObject:dataArray forKey:@"miData"];
    [object updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        block(isSuccessful,error);
    }];
}


@end
