//
//  ALWPopOverView.h
//  ALWPopOverView
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTriangleHeight 8.0
#define kTriangleWidth 10.0
#define kPopOverLayerCornerRadius 5.0

typedef NS_ENUM(NSInteger,ALWAlingStyle) {
    ALWAlingStyle_Center,
    ALWAlingStyle_left,
    ALWAlingStyle_Right
};


@class ALWPopOverView;
@protocol ALWPopOverViewDelegate <NSObject>

- (void)popPverViewDidShow:(ALWPopOverView *)view;
- (void)popOverViewDidDismiss:(ALWPopOverView *)view;
- (void)popOverView:(ALWPopOverView *)view didClickedMenuIndex:(NSInteger)index;


@end



@interface ALWPopOverView : UIView
@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIColor *containerBackgroudColor;
@property (nonatomic, assign) id<ALWPopOverViewDelegate>delegate;

+ (instancetype)popOverView;
- (instancetype)initWithBounds:(CGRect)bounds titleMenus:(NSArray *)titles;
- (void)showFrom:(UIView *)from alignStyle:(ALWAlingStyle)style;
- (void)dismiss;






@end
