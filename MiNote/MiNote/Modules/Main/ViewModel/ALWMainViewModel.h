//
//  ZYMainViewModel.h
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import "ALWBaseViewModel.h"

@interface ALWMainViewModel : ALWBaseViewModel
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSString       *objectId;
@end
