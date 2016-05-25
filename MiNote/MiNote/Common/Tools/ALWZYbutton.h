//
//  ALWZYbutton.h
//  MiNote
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALWZYbutton;
@protocol ALWZYbuttonDelegate <NSObject>

- (void)beginAnimation:(ALWZYbutton *)sender;


- (void)endAnimation:(ALWZYbutton *)sender;


@end



@interface ALWZYbutton : UIButton
@property (nonatomic, assign) BOOL isAnimation;
@property (nonatomic, assign) id<ALWZYbuttonDelegate>delegate;
- (void)beginAnimation;
- (void)endAnimation:(BOOL)result;
@end
