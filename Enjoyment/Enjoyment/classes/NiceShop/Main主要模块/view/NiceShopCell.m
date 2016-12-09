//
//  NiceShopCell.m
//  Enjoyment
//
//  Created by zzj on 16/12/9.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import "NiceShopCell.h"
#import "NSModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NiceShopCell()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation NiceShopCell

- (void)config:(NSItems *)model {
    
    self.topImageView.clipsToBounds = YES;
    if (model.image.url != nil) {
        NSURL *url = [NSURL URLWithString:model.image.url];
        [self.topImageView sd_setImageWithURL:url];
    }
    
    self.titleLabel.text = model.name;
    self.timeLabel.text = model.active_time;
    self.distanceLabel.text = [NSString stringWithFormat:@"%ld",model.distance];
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@/人均",model.consumption_per_person];
    
    //block
    //self.jumpBlock(model.detail_url);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
