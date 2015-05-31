//
//  inLandmark.h
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface inLandmark : UIViewController

@property (strong, nonatomic) NSString *titleLblStr;
@property (strong, nonatomic) NSString *descLblStr;
@property (strong, nonatomic) NSString *idStr;

@property (strong, nonatomic) NSString *latitudeStr;
@property (strong, nonatomic) NSString *longtitudeStr;




@property (strong, nonatomic) IBOutlet UIImageView *landImgView;
@property (strong, nonatomic) IBOutlet UILabel *landTitleLbl;
@property (strong, nonatomic) IBOutlet UITextView *landDescLbl;

@end
