//
//  ALWZYLayer.m
//  MiNote
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYLayer.h"

@implementation ALWZYLayer

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super init]) {
        CGFloat radius = (CGRectGetHeight(frame) / 2) * 0.5;
        self.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetHeight(frame));
        CGPoint center = CGPointMake(CGRectGetHeight(frame) / 2, CGRectGetMidY(self.bounds));
        CGFloat startAngle = 0 - M_PI_2;
        CGFloat endAngle = M_PI * 2 - M_PI_2;
        BOOL clockwise = true;
        self.path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise].CGPath;
        self.fillColor = nil;
        self.strokeColor = [UIColor whiteColor].CGColor;
        self.lineWidth = 1;
        
        self.strokeEnd = 0.4;
        self.hidden = YES;
    }
    return self;
}



- (void)animation
{
    self.hidden = NO;
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = 0;
    rotate.toValue = @(M_PI * 2);
    rotate.duration = 0.4;
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotate.repeatCount = HUGE;
    rotate.fillMode = kCAFillModeForwards;
    rotate.removedOnCompletion = false;
    [self addAnimation:rotate forKey:rotate.keyPath];
    
}


- (void)stopAnimation
{
    self.hidden = true;
    [self removeAllAnimations];
}

- (void)chageAnimation
{
    self.strokeEnd = 0.0;
    [self removeAllAnimations];
    CGPoint pointa = CGPointMake(self.bounds.size.width/12, self.bounds.size.height/4);
    CGPoint pointb = CGPointMake(self.bounds.size.width/4, self.bounds.size.height/2);
    CGPoint pointc = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/4*3);
    CGPoint pointd = CGPointMake(self.bounds.size.width/4*3, self.bounds.size.height/12*3);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:pointd];
    [path addLineToPoint:pointc];
    [path addLineToPoint:pointb];
    [path addLineToPoint:pointa];
    self.lineWidth = 1;
    self.strokeStart = 0;
    self.strokeEnd = 0.7;
    self.path = path.CGPath;
}









@end
