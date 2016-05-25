//
//  ZYBasicCell.h
//  MiNote
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 JohnGump. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALWCellDataAdapter;

@interface ALWBasicCell : UITableViewCell

/**
 *  CustomCell's data.
 */
@property (nonatomic, weak) ALWCellDataAdapter         *dataAdapter;

/**
 *  CustomCell's data.
 */
@property (nonatomic, weak) id                       data;

/**
 *  CustomCell's indexPath.
 */
@property (nonatomic, weak) NSIndexPath             *indexPath;

/**
 *  TableView.
 */
@property (nonatomic, weak) UITableView             *tableView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController        *controller;



- (void)loadContent;
- (void)setupCell;
- (void)buildSubview;


@end
