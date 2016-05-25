//
//  NoDataCell.m
//  MiNote
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "NoDataCell.h"
#import "ALWCellDataAdapter.h"

@interface NoDataCell()

@property (nonatomic, strong) UILabel *promptlabel;

@end

@implementation NoDataCell

- (void)setupCell
{
//    self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)loadContent
{
    //添加数据
    if (self.dataAdapter.data) {
        self.promptlabel.text = self.dataAdapter.data;
    }
}

- (void)buildSubview
{
    self.promptlabel = [[UILabel alloc] init];
    self.promptlabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.promptlabel];
    [self.promptlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kMAIN_HEIGHT, 50));
    }];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.promptlabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.promptlabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}


@end
