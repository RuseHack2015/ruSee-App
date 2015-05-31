//
//  MapVC.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "MapVC.h"

@implementation MapVC

@synthesize myMapView;
@synthesize myLocation;
@synthesize currentLocation;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self myLocation];
    //[self initializeLocationUpdates];
    [[self navigationController] setNavigationBarHidden:YES];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self addGestureRecogniserToMapView];
    
    //Map show user location
    self.myMapView.showsUserLocation=YES;
    self.myMapView.delegate = self;
    [self.myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    //Current location positioning
    myLocation = [[CLLocationManager alloc]init];
    myLocation.delegate = self;
    myLocation.desiredAccuracy = kCLLocationAccuracyBest;
//    
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myMapView.userLocation.coordinate, 500, 500);     MKCoordinateRegion adjustRegion = [myMapView regionThatFits:region];
//    [myMapView setRegion:adjustRegion animated:YES];
//    
    //refresh current location
    myLocation.distanceFilter = 2;
    

    //Current location positioning
    myLocation = [[CLLocationManager alloc]init];
    myLocation.delegate = self;
    myLocation.desiredAccuracy = kCLLocationAccuracyBest;
    
    //refresh current location(GPS)
    myLocation.distanceFilter = 1;
    
    [myLocation startUpdatingLocation];

    __block NSArray *annoations;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        annoations = [self parseJSONCities];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [self.myMapView addAnnotations:annoations];
            
        });
    });
    
    
    
}

- (void)addGestureRecogniserToMapView{
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addPinToMap:)];
    lpgr.minimumPressDuration = 0.5; //
    [self.myMapView addGestureRecognizer:lpgr];
    
}


/*
 Called from LongPress Gesture Recogniser, convert Screen X+Y to Longitude and Latitude then add a standard Pin at that Location.
 The pin has its Title and SubTitle set to Placeholder text, you can modify this as you wish, a good idea would be to run a Geocoding block and put the street address in the SubTitle.
 */
- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.myMapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.myMapView convertPoint:touchPoint toCoordinateFromView:self.myMapView];
    
    JFMapAnnotation *toAdd = [[JFMapAnnotation alloc]init];
    
    toAdd.coordinate = touchMapCoordinate;
    toAdd.subtitle = @"Subtitle";
    toAdd.title = @"Title";
    
    [self.myMapView addAnnotation:toAdd];
    
}

/*
 Convert raw JSON to Objective-C Foundation Objects
 Iterate over each returned object and create a JFMapAnnotationObject from it
 Add each new Annotation to an Array and then return it.
 */
- (NSMutableArray *)parseJSONCities{
    
    NSMutableArray *retval = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"map"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    for (JFMapAnnotation *record in json) {
        
        JFMapAnnotation *temp = [[JFMapAnnotation alloc]init];
        [temp setTitle:[record valueForKey:@"name"]];
        [temp setSubtitle:[record valueForKey:@"cat"]];
        [temp setCoordinate:CLLocationCoordinate2DMake([[record valueForKey:@"latitude"]floatValue], [[record valueForKey:@"longtitude"]floatValue])];
        [retval addObject:temp];
        
    }
    
    return retval;
}


-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *pinView = nil;
    if(annotation != myMapView.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKAnnotationView *)[myMapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil )
            pinView = [[MKAnnotationView alloc]
                       initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        
        //pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.canShowCallout = YES;
        //pinView.animatesDrop = YES;
        pinView.image = [UIImage imageNamed:@"pin.png"];    //as suggested by Squatch
    }
    else {
        [myMapView.userLocation setTitle:@"I am here"];
    }
    return pinView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
