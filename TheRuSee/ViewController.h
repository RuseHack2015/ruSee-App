//
//  ViewController.h
//  TheRuSee
//
//  Created by Atanas Bahchevanov on 5/30/15.
//  Copyright (c) 2015 SamSumSiCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NACarousel.h"

@interface ViewController : UIViewController{
	NACarousel *carousel;
}
@property (nonatomic, retain) IBOutlet NACarousel *carousel;

@end

