//
//  AccountCell.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "AccountCell.h"
#import "CellDataAdapter.h"
#import "SecretModel.h"
@interface AccountCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *password;

@end



@implementation AccountCell


- (void)setupCell
{
    self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)loadContent
{
    //添加数据
    if (self.dataAdapter.data) {
        SecretModel *model = self.dataAdapter.data;
        self.titleLabel.text = model.userName;
        self.headImage.image = model.iconImage;
        self.password.text = model.passWord;
    }
    
}


- (void)buildSubview
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    self.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
    
    self.headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_lock"]];;
    
    self.password = [[UILabel alloc] init];
    self.password.font = [UIFont systemFontOfSize:8.0f];
    self.password.textColor = [UIColor grayColor];
    
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.headImage];
    [self addSubview:self.password];
    
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.width.equalTo(@(50));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.headImage.mas_centerY);
        make.left.equalTo(self.headImage.mas_right).offset(10);
        make.right.equalTo(self).offset(10);
        make.height.equalTo(@(25));
        
    }];
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.headImage.mas_centerY);
        make.left.equalTo(self.headImage.mas_right).offset(10);
        make.right.equalTo(self).offset(10);
        make.height.equalTo(@(10));
    }];

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titleLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.titleLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

@end
