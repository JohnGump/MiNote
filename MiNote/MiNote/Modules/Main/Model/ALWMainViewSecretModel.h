//
//  SecretModel.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/10.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>
@interface ALWMainViewSecretModel : NSObject

/**
 *  图标
 */
@property (nonatomic, strong)UIImage *iconImage;

/**
 *  账号名称
 */
@property (nonatomic, strong)NSString *account;

/**
 *  账号用户名
 */
@property (nonatomic, strong)NSString *accountName;

/**
 *  账号密码
 */
@property (nonatomic, strong)NSString *accountPassWord;

@end
