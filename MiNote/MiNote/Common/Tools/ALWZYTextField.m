//
//  ALWZYTextField.m
//  MiNote
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWZYTextField.h"

@interface ALWZYTextField()
<UITextFieldDelegate>

@property (nonatomic, assign) BOOL isEditor;


@end


@implementation ALWZYTextField



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isEditor = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        [self monitoring];
    }
    return self;
}


- (void)createView
{
    self.title = [[UILabel alloc] init];
    self.divider = [[UIView alloc] init];
    self.textField = [[UITextField alloc] init];
    
    
    self.title.textColor = [UIColor lightGrayColor];
    self.title.textAlignment = NSTextAlignmentRight;
    self.divider.backgroundColor = [UIColor lightGrayColor];
    self.textField.delegate = self;
    [self addSubview:self.title];
    [self addSubview:self.divider];
    [self addSubview:self.textField];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(60));
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.title.mas_centerY);
        make.left.equalTo(self.title.mas_right).offset(10);
        make.height.equalTo(self);
        make.right.equalTo(self).offset(10);
    }];
     [self layoutIfNeeded];
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(1);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

- (void)monitoring
{
    [RACObserve(self, isEditor) subscribeNext:^(id x) {
       
        self.title.textColor = _isEditor?[UIColor blackColor]:[UIColor lightGrayColor];
        [self.divider mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_bottom).offset(1);
             make.right.equalTo(self);
            if (_isEditor) {
                make.left.equalTo(self).offset(90);
            }else{
                make.left.equalTo(self).offset(0);
            }
            make.height.equalTo(@(1));
        }];
        [self setNeedsUpdateConstraints];
        // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
        [self updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.3 animations:^{
            [self layoutIfNeeded];
        }];
        
    }];
}

- (void)setIsEditor:(BOOL)isEditor
{
    _isEditor = isEditor;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.isEditor = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.isEditor = NO;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
