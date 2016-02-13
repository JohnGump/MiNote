//
//  RegisterTableViewCell.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/12.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "RegisterTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RegisterTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation RegisterTableViewCell



- (void)awakeFromNib {
    RAC(self.iconImageView, image) = RACObserve(self, cellModel.iconImage);
    
    
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
