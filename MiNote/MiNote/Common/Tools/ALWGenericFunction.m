//
//  ALWGenericFunction.m
//  MiNote
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWGenericFunction.h"

@implementation ALWGenericFunction
+ (BOOL)isNill:(NSString *)str
{
    if ([str isEqualToString:@""] || str == nil) {
        return NO;
    }else{
        return YES;
    }
}
@end
