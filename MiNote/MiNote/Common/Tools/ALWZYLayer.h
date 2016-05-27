//
//  ALWZYLayer.h
//  MiNote
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface ALWZYLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;

- (void)animation;
- (void)stopAnimation;
- (void)chageAnimation;

@end
