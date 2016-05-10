//
//  ZYMainViewModel.h
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ZYBaseViewModel.h"

@interface ZYMainViewModel : ZYBaseViewModel
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
