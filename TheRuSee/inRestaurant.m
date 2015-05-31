//
//  inRestaurant.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "inRestaurant.h"
#import <MapKit/MapKit.h>
#import "RestaurantsVC.h"
@interface inRestaurant ()

@end

@implementation inRestaurant
@synthesize restImgView, restMenuField, restTitleLbl;
@synthesize titleLblStr, menuLblStr, idStr, phoneStr, webStr,  latitudeStr, longtitudeStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    restTitleLbl.text = titleLblStr;
    NSLog(@"%@", idStr);
    
    restTitleLbl.lineBreakMode = NSLineBreakByWordWrapping;
    restTitleLbl.numberOfLines = 2;
    
    int ValueID = [idStr intValue];
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    restImgView.image = [UIImage imageNamed:picID];
    
    restMenuField.font = [UIFont fontWithName:@"HelveticaNeue" size: 16];
    
    restMenuField.text = menuLblStr;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)callBtn:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%d", phoneStr]]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Внимание" message:@"Не може да правите телефонни обаждания чрез това устройство" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}
- (IBAction)mapBtn:(id)sender {
    
    float longtitudeInt = [longtitudeStr floatValue];
    float latitudeInt = [latitudeStr floatValue];
    
    CLLocationCoordinate2D rdOfficeLocation = CLLocationCoordinate2DMake(latitudeInt,longtitudeInt);
    //Apple Maps, using the MKMapItem class
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:rdOfficeLocation addressDictionary:nil];
    MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
    item.name = titleLblStr;
    [item openInMapsWithLaunchOptions:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
