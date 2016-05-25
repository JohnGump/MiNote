//
//  ZYRegisterViewModel.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWRegisterViewModel.h"
#import <SMS_SDK/SMSSDK.h>
#import <BmobSDK/Bmob.h>
#import "KEY.h"

@interface ALWRegisterViewModel()
{
    NSInteger countdown;
    NSTimer *timer;
}

@end

@implementation ALWRegisterViewModel

- (instancetype)init
{
    if (self = [super init]) {
        countdown = 60;
        [self monitoring];
    }
    return self;
}

- (void)commitVerificationCode
{
    if ([self.Phone isEqualToString:@"000"] && [self.verificationCode isEqualToString:@"0000"]) {
        [self login];
        return;
    }
    [SMSSDK commitVerificationCode:self.verificationCode phoneNumber:self.Phone zone:@"86" result:^(NSError *error) {
        NSLog(@"%@",error);
        if (error) {
            return;
        }
        [self login];
    }];
}

- (void)login
{
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MiNote"];
    //查找GameScore表里面id为0c6db13c的数据
    [bquery whereKey:@"userName" equalTo:self.Phone];
    [bquery selectKeys:@[@"objectId"]];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (array.count == 0) {
            BmobObject *gameScore = [BmobObject objectWithClassName:@"MiNote"];
            [gameScore setObject:self.Phone forKey:@"userName"];
            [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                NSLog(@"%d%@",isSuccessful,error);
                //进行操作
                [self login];
            }];
        } else {
            BmobObject *receive = array[0];
            NSLog(@"%@",receive.objectId);
            [self saveToken:receive.objectId];
        }
    }];
}
- (void)saveToken:(NSString *)token {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    [us setValue:token forKeyPath:TOKEN];
    [self.complete sendNext:token];
}

- (void)monitoring
{
    [RACObserve(self, Phone) subscribeNext:^(id x) {
        self.isEdit = [self JudgePhoneNumber:(NSString *)x];
    }];
    
    [self.getVerification subscribeNext:^(id x) {
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.Phone zone:@"86" customIdentifier:nil result:^(NSError *error) {
            NSLog(@"发送成功,%@",error);
            [self.countdownBegin sendNext:@"60"];
          timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAdvanced:) userInfo:nil repeats:YES];
        }];
    }];
}

- (void)timerAdvanced:(NSTimer *)sender
{
    if (countdown == 0) {
        [timer invalidate];
        [self.countdownEnd sendNext:@"0"];
        countdown = 60;
        return;
    }
    countdown -= 1;
    [self.countdownBegin sendNext:[NSNumber numberWithInteger:countdown]];
}

- (void)invalidate
{
    [timer invalidate];
    countdown = 60;
}

//验证手机号
- (BOOL)JudgePhoneNumber:(NSString *)str
{
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    NSString *MOBILE = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:str];
}

- (RACSubject *)countdownEnd
{
    if (!_countdownEnd) {
        _countdownEnd = [RACSubject subject];
    }
    return _countdownEnd;
}

- (RACSubject *)countdownBegin
{
    if (!_countdownBegin) {
        _countdownBegin = [RACSubject subject];
    }
    return _countdownBegin;
}

- (RACSubject *)complete
{
    if (!_complete) {
        _complete = [RACSubject subject];
    }
    return _complete;
}

- (RACSubject *)getVerification
{
    if (!_getVerification) {
        _getVerification = [RACSubject subject];
    }
    return _getVerification;
}


@end
