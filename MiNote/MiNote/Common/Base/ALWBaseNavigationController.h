//
//  ZYBaseNavigationController.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define TOP_VIEW  [[UIApplication sharedApplication]keyWindow].rootViewController.view

@interface ALWBaseNavigationController : UINavigationController
<UIGestureRecognizerDelegate>

@property (nonatomic,assign) BOOL canDragBack;

@end
