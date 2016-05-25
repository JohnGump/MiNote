//
//  Core.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#ifndef Core_h
#define Core_h

#define kMAIN_WEDITH [UIScreen mainScreen].bounds.size.width

#define kMAIN_HEIGHT [UIScreen mainScreen].bounds.size.height

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)


#endif /* Core_h */
