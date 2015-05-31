//
//  RestaurantsVC.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "RestaurantsVC.h"
#import "EventCell.h"
#import "inRestaurant.h"
@interface RestaurantsVC ()

@end

@implementation RestaurantsVC
{
    NSArray *tableImgData;
    IBOutlet UITableView *RestaurantTableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"json"];
    
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
    
    EventCell *CustomCell = [RestaurantTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!CustomCell) {
        CustomCell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    CustomCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    id keyValuePair =self.dataList[indexPath.row];
    CustomCell.restaurantTitle.text = keyValuePair[@"name"];
    
    NSString *IDstr = keyValuePair[@"id"];
    int ValueID = IDstr.intValue;
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    CustomCell.restaurantImgCell.image = [UIImage imageNamed:picID];
    
    CustomCell.restaurantTitle.lineBreakMode = NSLineBreakByWordWrapping;
    CustomCell.restaurantTitle.numberOfLines = 2;
    
    
    return CustomCell;
}

//select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    inRestaurant *inRestaurantVC = [self.storyboard instantiateViewControllerWithIdentifier:@"inRestaurant"];
    
    id keyValuePair =self.dataList[indexPath.row];
    
    NSString *titleRestaurant = keyValuePair[@"name"];
    inRestaurantVC.titleLblStr = titleRestaurant;
    
    NSString *menuRestaurant = keyValuePair[@"menu"];
    inRestaurantVC.menuLblStr = menuRestaurant;
    
    NSString *idERestaurant = keyValuePair[@"id"];
    inRestaurantVC.idStr = idERestaurant;
    
    NSString *phoneRestaurant = keyValuePair[@"phone"];
    inRestaurantVC.phoneStr = phoneRestaurant;
    
    NSString *webRestaurant = keyValuePair[@"web"];
    inRestaurantVC.webStr = webRestaurant;
    
    NSString *latRestaurant = keyValuePair[@"latitude"];
    inRestaurantVC.latitudeStr = latRestaurant;
    NSString *lonRestaurant = keyValuePair[@"longtitude"];
    inRestaurantVC.longtitudeStr = lonRestaurant;
    
    [self presentViewController:inRestaurantVC animated:NO completion:nil];
    
}

@end
