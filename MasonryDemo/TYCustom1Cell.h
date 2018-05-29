//
//  TYCustom1Cell.h
//  MasonryDemo
//
//  Created by Tiny on 2018/5/29.
//  Copyright © 2018年 hxq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYCustom1Model.h"
@interface TYCustom1Cell : UITableViewCell

@property (nonatomic, strong) TYCustom1Model *model;

@property (nonatomic, copy) void (^expendBlock)(void);

@end
