//
//  EventsVC.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "EventsVC.h"
#import "inEvent.h"
#import "EventCell.h"
@implementation EventsVC
{
    NSArray *tableImgData;
    IBOutlet UITableView *EventTableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Events" ofType:@"json"];
    
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
    
    EventCell *CustomCell = [EventTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!CustomCell) {
        CustomCell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    CustomCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    id keyValuePair =self.dataList[indexPath.row];
    CustomCell.titleCell.text = keyValuePair[@"name"];
    CustomCell.dateCell.text = keyValuePair[@"date"];
    
    NSString *IDstr = keyValuePair[@"id"];
    int ValueID = IDstr.intValue;
    NSString *picID = [NSString stringWithFormat:@"%d.png",ValueID];
    CustomCell.imgCell.image = [UIImage imageNamed:picID];
    
    CustomCell.titleCell.lineBreakMode = NSLineBreakByWordWrapping;
    CustomCell.titleCell.numberOfLines = 2;

    
    return CustomCell;
}

//select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    inEvent *inEventVC = [self.storyboard instantiateViewControllerWithIdentifier:@"inEvent"];

    id keyValuePair =self.dataList[indexPath.row];
    
     NSString *titleEvent = keyValuePair[@"name"];
    inEventVC.titleLblStr = titleEvent;
    
    NSString *descEvent = keyValuePair[@"desc"];
    inEventVC.descLblStr = descEvent;
    
    NSString *idEvent = keyValuePair[@"id"];
    inEventVC.idStr = idEvent;
    
    NSString *dateEvent = keyValuePair[@"date"];
    inEventVC.dateStr = dateEvent;
    
    NSString *latEvent = keyValuePair[@"latitude"];
    inEventVC.latitudeStr = latEvent;
    NSString *lonEvent = keyValuePair[@"longtitude"];
    inEventVC.longtitudeStr = lonEvent;
    
    [self presentViewController:inEventVC animated:NO completion:nil];
    
}
@end
