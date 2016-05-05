//
//  MainTableViewCell.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "MainTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MainTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *passWordField;


@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    self.iconImageView.image = self.model.iconImage;
    RAC(self,titleLabel.text) = RACObserve(self, model.title);
    RAC(self,userName.text) = RACObserve(self, model.userName);
    RAC(self,passWordField.text) = RACObserve(self, model.passWord);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
