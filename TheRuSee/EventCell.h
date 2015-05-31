//
//  EventCell.h
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
//Events
@property (weak, nonatomic) IBOutlet UIImageView *imgCell;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *dateCell;
//Landmarks
@property (weak, nonatomic) IBOutlet UIImageView *landImgCell;
@property (weak, nonatomic) IBOutlet UILabel *landTitle;
//Restaurants
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImgCell;
@property (weak, nonatomic) IBOutlet UILabel *restaurantTitle;
//Services
@property (weak, nonatomic) IBOutlet UIImageView *serviceImgCell;
@property (weak, nonatomic) IBOutlet UILabel *serviceTitle;
@property (weak, nonatomic) IBOutlet UILabel *serviceType;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
@property (weak, nonatomic) IBOutlet UIButton *mapBtn;
@end
