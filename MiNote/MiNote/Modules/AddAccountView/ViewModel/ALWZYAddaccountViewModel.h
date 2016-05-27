//
//  ALWZYAddaccountViewModel.h
//  MiNote
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWBaseViewModel.h"

@interface ALWZYAddaccountViewModel : ALWBaseViewModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;
- (void)upDateDatawithData:(void(^)(void))success failed:(void(^)(NSString *error))failed;

@end
