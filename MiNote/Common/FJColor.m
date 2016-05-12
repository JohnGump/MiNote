//
//  FJColor.m
//  FJKit
//
//  Created by FreeJohn on 16/1/29.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "FJColor.h"
@implementation UIColor (ColorWithHex)

+(UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor
            colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
            green:((float)((hexValue & 0xFF00) >> 8))/255.0
            blue:((float)(hexValue & 0xFF))/255.0
            alpha:alpha];
}

+(UIColor*)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString andAlpha:1.0f];
}

+(UIColor*)colorWithHexString:(NSString*)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        // invalid hex string
        col = [self blackColor];
    }
    return col;
}
@end
@implementation FJColor

@end
