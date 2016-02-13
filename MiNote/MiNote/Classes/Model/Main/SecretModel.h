//
//  SecretModel.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/10.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>
@interface SecretModel : MTLModel

@property (nonatomic, strong)UIImage *iconImage;

@property (nonatomic, strong)NSString *title;

@property (nonatomic, strong)NSString *userName;

@property (nonatomic, strong)NSString *passWord;

@end
