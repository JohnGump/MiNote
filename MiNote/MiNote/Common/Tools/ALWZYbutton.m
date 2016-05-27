//
//  ALWZYbutton.m
//  MiNote
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYbutton.h"
#import "ALWZYLayer.h"

@interface ALWZYbutton()
@property (nonatomic, strong) ALWZYLayer *shapeLayer;

@property (nonatomic,assign) CFTimeInterval shrinkDuration;

@property (nonatomic,retain) CAMediaTimingFunction *shrinkCurve;

@property (nonatomic,retain) CAMediaTimingFunction *expandCurve;

@property (nonatomic, strong) Completion block;

@property (nonatomic,retain) UIColor *color;

@end



@implementation ALWZYbutton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _shrinkCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _expandCurve = [CAMediaTimingFunction functionWithControlPoints:0.95 :0.02 :1 :0.05];
        self.shrinkDuration = 0.1;
        [self setup];
        
    }
    return self;
}

- (void)setup
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 40/2;
    [self addTarget:self action:@selector(_alw_scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(_alw_scaleAnmiation) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(_alw_scaleToDefault) forControlEvents:UIControlEventTouchDragExit];
    
}

- (void)setCompletion:(Completion)completion
{
    _block = completion;
}


- (void)_alw_scaleToSmall
{
    typeof(self) __weak weak = self;
    self.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
        weak.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)_alw_scaleAnmiation
{
    typeof(self) __weak weak = self;
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
        weak.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
    [self startAnimation];
    
}

- (void)_alw_scaleToDefault
{
    typeof(self) __weak weak = self;
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
        weak.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)startAnimation
{
    [self performSelector:@selector(_alw_Revert) withObject:nil afterDelay:0.f];
    [self.layer addSublayer:self.shapeLayer];
    CABasicAnimation *shrinkAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    shrinkAnim.fromValue = @(CGRectGetWidth(self.bounds));
    shrinkAnim.toValue = @(CGRectGetHeight(self.bounds));
    shrinkAnim.duration = _shrinkDuration;
    shrinkAnim.timingFunction = _shrinkCurve;
    shrinkAnim.fillMode = kCAFillModeForwards;
    shrinkAnim.removedOnCompletion = false;
    [self.layer addAnimation:shrinkAnim forKey:shrinkAnim.keyPath];
    [self.shapeLayer animation];
    [self setUserInteractionEnabled:false];
    
}

- (void)ExitAnimationCompletion:(Completion)completion
{
    _block = completion;
    [self.shapeLayer chageAnimation];
    
    dispatch_time_t dismiss = dispatch_time(DISPATCH_TIME_NOW, (int64_t) 1*NSEC_PER_SEC);
    dispatch_after(dismiss, dispatch_get_main_queue(), ^{
        [self setUserInteractionEnabled:true];
        if (_block) {
            _block();
        }
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(_alw_DidStopAnimation) userInfo:nil repeats:nil];
    });
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    CABasicAnimation *cab = (CABasicAnimation *)anim;
    if ([cab.keyPath isEqualToString:@"transform.scale"]|| [cab.keyPath isEqualToString:@"position"] ) {
        [self setUserInteractionEnabled:true];
        if (_block) {
            _block();
        }
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(_alw_DidStopAnimation) userInfo:nil repeats:nil];
    }
}
-(void)_alw_DidStopAnimation{
    
    [self.layer removeAllAnimations];
}


- (void)ErrorRevertAnimationCompletion:(Completion)completion
{
    _block = completion;
    CABasicAnimation *shrinkAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    shrinkAnim.fromValue = @(CGRectGetHeight(self.bounds));
    shrinkAnim.toValue = @(CGRectGetWidth(self.bounds));
    shrinkAnim.duration = _shrinkDuration;
    shrinkAnim.timingFunction = _shrinkCurve;
    shrinkAnim.fillMode = kCAFillModeForwards;
    shrinkAnim.removedOnCompletion = false;
    _color = self.backgroundColor;
    
    CABasicAnimation *backgroundColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backgroundColor.toValue  = (__bridge id)[UIColor redColor].CGColor;
    backgroundColor.duration = 0.1f;
    backgroundColor.timingFunction = _shrinkCurve;
    backgroundColor.fillMode = kCAFillModeForwards;
    backgroundColor.removedOnCompletion = false;
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint point = self.layer.position;
    keyFrame.values = @[[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],
                        
                        [NSValue valueWithCGPoint:point]];
    keyFrame.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyFrame.duration = 0.5f;
    keyFrame.delegate = self;
    self.layer.position = point;
    
    [self.layer addAnimation:backgroundColor forKey:backgroundColor.keyPath];
    [self.layer addAnimation:keyFrame forKey:keyFrame.keyPath];
    [self.layer addAnimation:shrinkAnim forKey:shrinkAnim.keyPath];
    [self.shapeLayer stopAnimation];
    [self setUserInteractionEnabled:true];

}

- (ALWZYLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [[ALWZYLayer alloc] initWithFrame:self.bounds];
    }
    return _shapeLayer;
}



- (void)_alw_Revert
{
    CABasicAnimation *backgroundColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backgroundColor.toValue  = (__bridge id)self.backgroundColor.CGColor;
    backgroundColor.duration = 0.1f;
    backgroundColor.timingFunction = _shrinkCurve;
    backgroundColor.fillMode = kCAFillModeForwards;
    backgroundColor.removedOnCompletion = false;
    [self.layer addAnimation:backgroundColor forKey:@"backgroundColors"];
}


@end
