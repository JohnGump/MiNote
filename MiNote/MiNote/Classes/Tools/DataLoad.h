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

+ (void)GETDatablock:(BmobObjectResultBlock)block;

+ (void)UPdateDatawithData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block;


@end
