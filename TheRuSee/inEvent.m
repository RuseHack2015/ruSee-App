//
//  inEvent.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "inEvent.h"
#import "EventsVC.h"
#import <MapKit/MapKit.h>
@interface inEvent (){

    IBOutlet UILabel *titleSector;
    IBOutlet UITextView *descSector;
    IBOutlet UIImageView *imgSector;
    IBOutlet UILabel *dateSector;
    
}

@end


@implementation inEvent


@synthesize titleLblStr, descLblStr, idStr, dateStr, longtitudeStr, latitudeStr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleSector.text = titleLblStr;
    descSector.text = descLblStr;
    NSLog(@"%@", idStr);
    
    titleSector.lineBreakMode = NSLineBreakByWordWrapping;
    titleSector.numberOfLines = 2;
    
    int ValueID = [idStr intValue];
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    imgSector.image = [UIImage imageNamed:picID];
    
    descSector.font = [UIFont fontWithName:@"HelveticaNeue" size: 16];
    
    dateSector.text = dateStr;
    
    
    
}
- (IBAction)GoToMap:(id)sender {
    
    float longtitudeInt = [longtitudeStr floatValue];
    float latitudeInt = [latitudeStr floatValue];
    
    CLLocationCoordinate2D rdOfficeLocation = CLLocationCoordinate2DMake(latitudeInt,longtitudeInt);
    //Apple Maps, using the MKMapItem class
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:rdOfficeLocation addressDictionary:nil];
    MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
    item.name = titleLblStr;
    [item openInMapsWithLaunchOptions:nil];
}

@end
