//
//  ZYRegisterViewController.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWBaseViewController.h"

typedef void(^registerView)();

@interface ALWRegisterViewController : ALWBaseViewController <ALWZYReactiveView>
@property (nonatomic, copy) registerView alw_reloadData;



@end
