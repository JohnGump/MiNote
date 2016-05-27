//
//  ALWZYbutton.h
//  MiNote
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALWZYbutton;


typedef void(^Completion)();
@interface ALWZYbutton : UIButton
- (void)startAnimation;
-(void)setCompletion:(Completion)completion;
-(void)ErrorRevertAnimationCompletion:(Completion)completion;
-(void)ExitAnimationCompletion:(Completion)completion;
@end
