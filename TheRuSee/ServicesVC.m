//
//  ServicesVC.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "ServicesVC.h"
#import "EventCell.h"
#import <MapKit/MapKit.h>
@interface ServicesVC ()

@end

@implementation ServicesVC
{
    NSArray *tableImgData;
    IBOutlet UITableView *ServiceTableView;
    NSString *phoneNumber;
    NSString *ParsedLatitude;
    NSString *ParsedLongitude;
    NSString *Title;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Service" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    self.dataList = (NSArray *)[NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL];
    
    tableImgData = @[@"1.png",@"2.png",@"3.png",];
    
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataList.count;
}
//cell config
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    EventCell *CustomCell = [ServiceTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!CustomCell) {
        CustomCell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    id keyValuePair =self.dataList[indexPath.row];
    CustomCell.serviceTitle.text = keyValuePair[@"name"];
    CustomCell.serviceType.text = keyValuePair[@"cat"];
    
    NSString *IDstr = keyValuePair[@"id"];
    int ValueID = IDstr.intValue;
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    CustomCell.serviceImgCell.image = [UIImage imageNamed:picID];
    
    CustomCell.serviceTitle.lineBreakMode = NSLineBreakByWordWrapping;
    CustomCell.serviceTitle.numberOfLines = 2;
    
    UIImage *callImgBtn = [UIImage imageNamed:@"callNoShadow.png"];
    [CustomCell.callBtn setImage:callImgBtn forState:UIControlStateNormal];
    [CustomCell.callBtn addTarget:self action:@selector(call:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *mapImgBtn = [UIImage imageNamed:@"mapNoShadow.png"];
    [CustomCell.mapBtn setImage:mapImgBtn forState:UIControlStateNormal];
    [CustomCell.mapBtn addTarget:self action:@selector(map:) forControlEvents:UIControlEventTouchUpInside];
    
    phoneNumber = keyValuePair[@"phone"];
    ParsedLatitude = keyValuePair[@"latitude"];
    ParsedLongitude = keyValuePair[@"longtitude"];
    Title = keyValuePair[@"name"];
    
    return CustomCell;
}

//select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

  //  id keyValuePair =self.dataList[indexPath.row];
    
        
}
-(void)call:(UIButton*)sender{
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%d", phoneNumber]]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Внимание" message:@"Не може да правите телефонни обаждания чрез това устройство" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}

-(void)map:(UIButton*)sender{
    float longtitudeInt = [ParsedLongitude floatValue];
    float latitudeInt = [ParsedLatitude floatValue];
    
    CLLocationCoordinate2D rdOfficeLocation = CLLocationCoordinate2DMake(latitudeInt,longtitudeInt);
    //Apple Maps, using the MKMapItem class
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:rdOfficeLocation addressDictionary:nil];
    MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
    item.name = Title;
    [item openInMapsWithLaunchOptions:nil];
}

@end
