//
//  ZYBasicCell.m
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYBasicCell.h"

@implementation ZYBasicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)loadContent{
    
}

- (void)setupCell {

    
}
- (void)buildSubview{
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
