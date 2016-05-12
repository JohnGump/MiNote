//
//  SecretModel.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/10.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "SecretModel.h"

@implementation SecretModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.iconImage = [UIImage imageNamed:@"icon"];
    }
    return self;
}

@end
