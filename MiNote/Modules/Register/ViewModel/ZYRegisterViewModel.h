//
//  ZYRegisterViewModel.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYRegisterViewModel : NSObject
<
UITextFieldDelegate
>

@property (nonatomic, copy  ) NSString   *Phone;
@property (nonatomic, copy  ) NSString   *verificationCode;
@property (nonatomic, strong) RACSubject *getVerification;
@property (nonatomic, strong) RACSubject *complete;
@property (nonatomic, assign) BOOL       isEdit;

- (void)commitVerificationCode;


@end
