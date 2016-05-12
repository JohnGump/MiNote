//
//  mainViewModel.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecretModel.h"

@protocol UpdateDelegate <NSObject>

- (void)update;

@end

@interface mainViewModel : NSObject

//@property (nonatomic, assign) UpdateDelegate delegate;

/**
 *  tokenId
 */
@property (nonatomic, strong) NSString *modelId;

/**
 *  viewModel数据数组
 */
@property (nonatomic, strong) NSMutableArray *secrets;

- (void)reloadData;

@end
