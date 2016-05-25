//
//  ZYBaseViewController.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALWBaseViewController : UIViewController <ALWZYReactiveView>

@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;

- (ALWBaseViewController *)initWithViewModel:(id)viewModel;

@end
