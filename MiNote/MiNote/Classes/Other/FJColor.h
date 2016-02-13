//
//  FJColor.h
//  FJKit
//
//  Created by FreeJohn on 16/1/29.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (ColorWithHex)

+(UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+(UIColor*)colorWithHexString:(NSString *)hexString;
+(UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;

@end

#define FJCOLOR_BLUE_BTN [UIColor colorWithHexString:@"#26ace9"]

@interface FJColor : NSObject

@end
