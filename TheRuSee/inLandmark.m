//
//  inLandmark.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "inLandmark.h"

@implementation inLandmark
@synthesize landTitleLbl,landImgView,landDescLbl;
@synthesize titleLblStr, descLblStr, idStr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    landTitleLbl.text = titleLblStr;
    landDescLbl.text = descLblStr;
    NSLog(@"%@", idStr);
    
    landTitleLbl.lineBreakMode = NSLineBreakByWordWrapping;
    landTitleLbl.numberOfLines = 2;
    
    int ValueID = [idStr intValue];
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    landImgView.image = [UIImage imageNamed:picID];
    
    landDescLbl.font = [UIFont fontWithName:@"HelveticaNeue" size: 16];
    
    
    
    
}

@end
