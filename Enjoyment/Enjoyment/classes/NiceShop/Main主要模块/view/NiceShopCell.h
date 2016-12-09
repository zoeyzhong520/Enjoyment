//
//  NiceShopCell.h
//  Enjoyment
//
//  Created by zzj on 16/12/9.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSItems;

@interface NiceShopCell : UITableViewCell

- (void)config:(NSItems *)model;

//block
@property (nonatomic, strong) void (^jumpBlock)(NSString *value);

@end
