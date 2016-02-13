//
//  ViewController.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/5.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ViewController.h"
#import "KEY.h"
#import "RegisterViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
//    UIButton *aBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    aBtn.frame = CGRectMake(100, 100, 100, 100);
//    aBtn.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:aBtn];
//    [aBtn addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
        [self showView];

}
- (void)showView {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *token = [us valueForKeyPath:TOKEN];
    if (!token) {
        RegisterViewController *aReg = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:[NSBundle mainBundle]];
        UINavigationController *aTemp = [[UINavigationController alloc]initWithRootViewController:aReg];
        [self presentViewController:aTemp animated:YES completion:nil];
        return;
    }
}
@end
