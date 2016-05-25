//
//  NSData+AES.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/11.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (AES)

- (NSData *)AES256ParmEncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256ParmDecryptWithKey:(NSString *)key;   //解密

@end
