//
//  ZYReactiveView.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>

/// A protocol which is adopted by views which are backed by view models.
@protocol ZYReactiveView <NSObject>
//binds the given view model to the view;

//viewModel  -The view Model
- (void)bindViewModel:(id)viewModel;

@end
