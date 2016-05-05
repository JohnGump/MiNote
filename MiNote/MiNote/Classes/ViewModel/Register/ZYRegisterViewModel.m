//
//  ZYRegisterViewModel.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYRegisterViewModel.h"

@implementation ZYRegisterViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self monitoring];
    }
    return self;
}

- (void)monitoring
{
    [RACObserve(self, Phone) subscribeNext:^(id x) {
        self.isEdit = [self JudgePhoneNumber:(NSString *)x];
    }];
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


@end
