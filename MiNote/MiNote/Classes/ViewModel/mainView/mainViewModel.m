//
//  mainViewModel.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "mainViewModel.h"
#import "DataLoad.h"
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

- (void) initSubscrition {
    RACSignal *loadDataSignal = RACObserve(self, modelId);
    [loadDataSignal subscribeNext:^(id x) {
        [DataLoad GETDatablock:^(BmobObject *object, NSError *error) {
            NSLog(@"%@",object);
        }];
    }];
    
}

@end
