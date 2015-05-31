//
//  MapVC.h
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import "JFMapAnnotation.h"

@interface MapVC : ViewController <MKMapViewDelegate, CLLocationManagerDelegate>

//Map properties
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@property (strong, nonatomic) CLLocationManager *myLocation;

@property (strong, nonatomic) CLLocation *currentLocation;
- (void)addGestureRecogniserToMapView;
- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer;
- (NSMutableArray *)parseJSONCities;
@end
