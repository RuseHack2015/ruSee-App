//
//  ViewController.m
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import "ViewController.h"
#import "EventsVC.h"
#import "LandmarksVC.h"
#import "MapVC.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clock;

@end

@implementation ViewController

@synthesize carousel, clock;

- (void)viewDidLoad {
    [super viewDidLoad];

    NACarousel * nacarousel = [[NACarousel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    self.carousel = nacarousel;
    
    [self.carousel addImage:@"showroom.png"];
    [self.carousel addImage:@"theater.png"];
    [self.carousel addImage:@"bal.png"];

    
    [self.view addSubview:self.carousel];
    
    [self.carousel addObserver:self forKeyPath:@"isTransitioning" options:NSKeyValueObservingOptionNew context:NULL];
    [self.carousel addObserver:self forKeyPath:@"isStarted" options:NSKeyValueObservingOptionNew context:NULL];

    [self.carousel start];
    carousel.layer.zPosition = -10;
    
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    
    NSDate *now = [[NSDate alloc] init];

    NSString *theTime = [timeFormat stringFromDate:now];
    
    NSLog(@"%@", theTime);
    clock.text = theTime;
    
}
- (IBAction)EventsMenuBtn:(id)sender {
    EventsVC *EventVCid = [self.storyboard instantiateViewControllerWithIdentifier:@"EventVC"];
    [self presentViewController:EventVCid animated:NO completion:nil];
}
- (IBAction)LandmarksMenuBtn:(id)sender {
    EventsVC *LandmarkstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LandmarksVC"];
    [self presentViewController:LandmarkstVC animated:NO completion:nil];
}
- (IBAction)RestaurantMenuBtn:(id)sender {
    EventsVC *RestaurantVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantVC"];
    [self presentViewController:RestaurantVC animated:NO completion:nil];
}
- (IBAction)MapMenuBtn:(id)sender {
    EventsVC *MapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapVC"];
    [self presentViewController:MapVC animated:NO completion:nil];
}
- (IBAction)ServicesMenuBtn:(id)sender {
    EventsVC *ServiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    [self presentViewController:ServiceVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqual:@"isTransitioning"]) {
        //self.prevButton.enabled = !self.carousel.isTransitioning;
        //self.nextButton.enabled = !self.carousel.isTransitioning;
    } else if ([keyPath isEqual:@"isStarted"]) {
        //self.startButton.enabled = !self.carousel.isStarted;
        //self.stopButton.enabled  = self.carousel.isStarted;
    }
}




@end
