//
//  CellDataAdapter.h
//  MiNote
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellDataAdapter : NSObject

@property (nonatomic, strong) NSString *cellReuseIdentifier;

@property (nonatomic, strong) id data;

@property (nonatomic) CGFloat cellHeight;

@property (nonatomic) NSInteger cellType;

+ (CellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                       data:(id)data
                                                 cellHeight:(CGFloat)cellHeight
                                                   cellType:(NSInteger)cellType;

#pragma mark - Optional properties.

/**
 *  The tableView.
 */
@property (nonatomic, weak)   UITableView  *tableView;

/**
 *  TableView's indexPath.
 */
@property (nonatomic, weak)   NSIndexPath  *indexPath;
@end
