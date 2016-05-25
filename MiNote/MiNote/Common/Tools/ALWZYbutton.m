//
//  ALWZYbutton.m
//  MiNote
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYbutton.h"

@interface ALWZYbutton()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end



@implementation ALWZYbutton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isAnimation = NO;
    }
    return self;
}



- (void)beginAnimation
{
    [self setTitle:@"" forState:UIControlStateNormal];

    CGSize size           = self.bounds.size;
    CGFloat radius        = size.width/4.f - 2/2.f;
    CGFloat startAngle    = 0;
    CGFloat endAngle      = 0;
    startAngle            = -RADIAN(180 - 90);
    endAngle              = RADIAN(180 + 90);

    UIBezierPath *path     = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height/2.f, size.width/2.f)
                                                         radius:radius
                                                     startAngle:startAngle
                                                       endAngle:endAngle
                                                      clockwise:YES];
    self.shapeLayer.path        = path.CGPath;
    self.shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.shapeLayer.fillColor   = [[UIColor clearColor] CGColor];
    self.shapeLayer.lineWidth   = 2;
    self.shapeLayer.strokeEnd   = 0.95f;
    self.shapeLayer.frame = self.frame;
    [self.layer addSublayer:self.shapeLayer];
    [self setNeedsDisplay];
    
    [self.delegate beginAnimation:self];
}


- (void)endAnimation:(BOOL)result
{
    [self.delegate endAnimation:self];
}

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}


@end
