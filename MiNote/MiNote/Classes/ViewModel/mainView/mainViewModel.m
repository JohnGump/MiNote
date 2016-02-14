//
//  mainViewModel.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "mainViewModel.h"
#import "SecretModel.h"
#import "DataLoad.h"
#import "Core.h"
#import "KEY.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation mainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubscrition];
    }
    return self;
}

- (NSMutableArray *)secrets {
    if (!_secrets) {
        _secrets = [NSMutableArray array];
        SecretModel *aModel = [[SecretModel alloc]init];
        aModel.title = @"微信";
        aModel.userName = @"love";
        aModel.passWord = @"lalalla";
        [_secrets addObject:aModel];
    }
    return _secrets;
}

- (void)reloadData {
    [self initSubscrition];
}


- (void) initSubscrition {
    RACSignal *loadDataSignal = RACObserve(self, modelId);
    [loadDataSignal subscribeNext:^(id x) {
        [DataLoad GETDatablock:^(BmobObject *object, NSError *error) {
            
            NSArray  *array = [object objectForKey:@"miData"];
            NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
            [us setValue:array forKeyPath:SECRETDATA];
            [self.secrets removeAllObjects];
            if (array) {
                for (NSDictionary *dic in array) {
                    SecretModel *aModel = [[SecretModel alloc]init];
                    [aModel setValuesForKeysWithDictionary:dic];
                    [self.secrets addObject:aModel];
                    
                }
            }

            
            
        }];
    }];
    
}

@end
