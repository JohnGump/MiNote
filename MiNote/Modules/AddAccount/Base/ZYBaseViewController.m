//
//  ZYBaseViewController.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYBaseViewController.h"
#import "ZYBaseViewModel.h"

@interface ZYBaseViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) ZYBaseViewModel *viewModel;
@property (nonatomic, strong, readwrite) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation ZYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    
    if (self.navigationController != nil && self != self.navigationController.viewControllers.firstObject) {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
        [self.view addGestureRecognizer:popRecognizer];
        popRecognizer.delegate = self;
    }
    
}
- (ZYBaseViewController *)initWithViewModel:(id)viewModel
{
    if (self = [super init]) {
        self.viewModel = viewModel;
        
        
        @weakify(self)
        [[self
          rac_signalForSelector:@selector(viewDidLoad)]
         subscribeNext:^(id x) {
             @strongify(self)
             [self bindViewModel:viewModel];
         }];
    }
    return self;
}

- (void)bindViewModel:(id)viewModel
{
    
}


#pragma mark - UIPanGestureRecognizer handlers

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer {
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // Create a interactive transition and pop the view controller
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        // Update the interactive transition's progress
        [self.interactivePopTransition updateInteractiveTransition:progress];
    } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        // Finish or cancel the interactive transition
        if (progress > 0.25) {
            [self.interactivePopTransition finishInteractiveTransition];
        } else {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        
        self.interactivePopTransition = nil;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)recognizer {
    return [recognizer velocityInView:self.view].x > 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
