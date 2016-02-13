//
//  DataLoad.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>
@interface DataLoad : NSObject

+ (void)GETDataWithObjectId:(NSString *)objectid block:(BmobObjectResultBlock)block;

+ (void)UPdateDataWithObjectId:(NSString *)objectid withData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block;


@end
