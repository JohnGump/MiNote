//
//  ZYBaseViewController.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYBaseViewController : UIViewController <ZYReactiveView>
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;

- (ZYBaseViewController *)initWithViewModel:(id)viewModel;

@end
