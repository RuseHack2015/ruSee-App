//
//  EventCell.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "EventCell.h"

@implementation EventCell

@synthesize titleCell, dateCell, imgCell, landImgCell, landTitle, restaurantImgCell, restaurantTitle, serviceImgCell, serviceTitle, serviceType, callBtn, mapBtn;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
