//
//  ALWZYAddaccountViewModel.m
//  MiNote
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYAddaccountViewModel.h"
#import "ALWGenericFunction.h"
#import "ALWClient.h"
@implementation ALWZYAddaccountViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)upDateDatawithData:(void(^)(void))success failed:(void(^)(NSString *error))failed
{
    if ([ALWGenericFunction isNill:self.title] == NO ||
        [ALWGenericFunction isNill:self.userName] == NO ||
        [ALWGenericFunction isNill:self.passWord] == NO) {
        failed(@"有空值");
        
    }else{
        
        NSDictionary *dic = @{@"title":self.title,@"userName":self.userName,@"passWord":self.passWord};
        
        [ALWClient UPdateDatawithData:@[dic] block:^(BOOL isSuccessful, NSError *error) {
            if (isSuccessful) {
                success();
            }else{
                failed(error.localizedDescription);
            }
        }];
        
    }
    
    
}


@end
