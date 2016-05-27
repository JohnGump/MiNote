//
//  DataLoad.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>
@interface ALWClient : NSObject

/**
 *  Bmob获取数据
 *
 *  @param block 回调block
 */
+ (void)GETDatablock:(BmobObjectArrayResultBlock)block;

/**
 *  同步上传数据
 *
 *  @param dataArray 要上传的数据
 *  @param block     回调Block
 */
+ (void)UPdateDatawithData:(NSArray *)dataArray block:(BmobBooleanResultBlock)block;


@end
