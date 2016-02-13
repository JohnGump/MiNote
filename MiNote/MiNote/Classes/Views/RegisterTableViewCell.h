//
//  RegisterTableViewCell.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/12.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterModel.h"

@interface RegisterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (nonatomic, strong)RegisterModel *cellModel;

@end
