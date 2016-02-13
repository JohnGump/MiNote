//
//  AddAccountTableViewCell.h
//  MiNote
//
//  Created by 苹果电脑开发账号 on 16/2/13.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddAccountModel.h"
@interface AddAccountTableViewCell : UITableViewCell

@property (nonatomic, strong)AddAccountModel *model;


@property (weak, nonatomic) IBOutlet UITextField *msgfield;

@end
