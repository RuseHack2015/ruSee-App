//
//  LandmarksVC.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "LandmarksVC.h"
#import "EventCell.h"
#import "inLandmark.h"
@implementation LandmarksVC
{
    NSArray *tableImgData;
    IBOutlet UITableView *LandmarksTableView;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Landmarks" ofType:@"json"];
    
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
    
    EventCell *CustomCell = [LandmarksTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!CustomCell) {
        CustomCell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    CustomCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    id keyValuePair =self.dataList[indexPath.row];
    CustomCell.landTitle.text = keyValuePair[@"name"];
    
    NSString *IDstr = keyValuePair[@"id"];
    int ValueID = IDstr.intValue;
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    CustomCell.landImgCell.image = [UIImage imageNamed:picID];
    
    CustomCell.landTitle.lineBreakMode = NSLineBreakByWordWrapping;
    CustomCell.landTitle.numberOfLines = 2;
    
    
    return CustomCell;
}

//select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    inLandmark *inLandmarkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"inLandmark"];
    
    id keyValuePair =self.dataList[indexPath.row];
    
    NSString *titleLandmark = keyValuePair[@"name"];
    inLandmarkVC.titleLblStr = titleLandmark;
    
    NSString *descLandmark = keyValuePair[@"desc"];
    inLandmarkVC.descLblStr = descLandmark;
    
    NSString *idLandmark = keyValuePair[@"id"];
    inLandmarkVC.idStr = idLandmark;
    
    NSString *latLandmark = keyValuePair[@"latitude"];
    inLandmarkVC.latitudeStr = latLandmark;
    NSString *lonLandmark = keyValuePair[@"longtitude"];
    inLandmarkVC.longtitudeStr = lonLandmark;
    
    [self presentViewController:inLandmarkVC animated:NO completion:nil];
    
}
@end
