//
//  inRestaurant.h
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface inRestaurant : UIViewController 

@property (strong, nonatomic) NSString *titleLblStr;
@property (strong, nonatomic) NSString *menuLblStr;
@property (strong, nonatomic) NSString *idStr;
@property (strong, nonatomic) NSString *phoneStr;
@property (strong, nonatomic) NSString *webStr;
@property (strong, nonatomic) NSString *latitudeStr;
@property (strong, nonatomic) NSString *longtitudeStr;


@property (strong, nonatomic) IBOutlet UIImageView *restImgView;
@property (strong, nonatomic) IBOutlet UILabel *restTitleLbl;
@property (strong, nonatomic) IBOutlet UITextView *restMenuField;



@end
