//
//  AddAccountTableViewCell.m
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "AddAccountTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface AddAccountTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *msgfield;

@end


@implementation AddAccountTableViewCell

- (void)awakeFromNib {
    RAC(self,titleLabel.text) = RACObserve(self, <#KEYPATH#>)
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
