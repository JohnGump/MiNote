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
@property (nonatomic, strong)NSString *title;

/**
 *  账号用户名
 */
@property (nonatomic, strong)NSString *userName;

/**
 *  账号密码
 */
@property (nonatomic, strong)NSString *passWord;

@end
