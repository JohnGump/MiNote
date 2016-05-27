//
//  ALWZYAddAccountController.h
//  MiNote
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWBaseViewController.h"
typedef void(^addResult)();
@interface ALWZYAddAccountController : ALWBaseViewController
@property (nonatomic, copy) addResult addComplete;
@end
