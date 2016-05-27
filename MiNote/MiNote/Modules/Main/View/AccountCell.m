//
//  AccountCell.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "AccountCell.h"
#import "ALWCellDataAdapter.h"

#import "ALWMainViewSecretModel.h"
@interface AccountCell()
@property (nonatomic, strong) UIView *bcgdView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *password;

@end

@implementation AccountCell

- (void)setupCell
{
    self.accessoryType  = UITableViewCellAccessoryNone;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)loadContent
{
    //添加数据
    if (self.dataAdapter.data) {
        ALWMainViewSecretModel *model = self.dataAdapter.data;
        self.titleLabel.text = model.accountName;
        self.headImage.image = model.iconImage;
        self.password.text = model.accountPassWord;
    }
}

- (void)buildSubview
{
    
    self.bcgdView                     = [[UIView alloc] init];
    self.bcgdView.backgroundColor     = [UIColor colorWithWhite:0.902 alpha:1.000];
    self.bcgdView.layer.masksToBounds = YES;
    self.bcgdView.layer.cornerRadius  = 5.0f;
    self.bcgdView.layer.masksToBounds = NO;
    self.bcgdView.layer.shadowOffset  = CGSizeMake(0.0, 5.0);
    self.bcgdView.layer.shadowOpacity = 5.0f;
    self.bcgdView.layer.shadowRadius  = 0.5f;
    self.bcgdView.layer.shadowColor = [[UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000] CGColor];
    
    
    self.titleLabel           = [[UILabel alloc] init];
    self.titleLabel.font      = [UIFont systemFontOfSize:20.0f];
    self.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
    self.headImage            = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_icon"]];;
    self.password             = [[UILabel alloc] init];
    self.password.font        = [UIFont systemFontOfSize:15.0f];
    self.password.textColor   = [UIColor grayColor];
    
    [self.contentView addSubview:self.bcgdView];
    [self.bcgdView addSubview:self.titleLabel];
    [self.bcgdView addSubview:self.headImage];
    [self.bcgdView addSubview:self.password];
    
    [self.bcgdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(20);
        make.height.equalTo(@(80));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerY.equalTo(self.bcgdView);
        make.left.equalTo(self.bcgdView).offset(10);
        make.top.equalTo(self.bcgdView).offset(10);
        make.width.equalTo(@(50));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headImage.mas_centerY);
        make.left.equalTo(self.headImage.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@(25));
    }];
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.headImage.mas_centerY);
        make.left.equalTo(self.headImage.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@(20));
    }];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.bcgdView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.bcgdView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

@end
