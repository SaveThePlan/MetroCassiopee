//
//  STPPlanetViewController.h
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPPlanet.h"
#import "STPPlanetView.h"

@interface STPPlanetViewController : UIViewController

@property(retain) STPPlanet * planet;

-(id)initWithPlanet:(STPPlanet *)planet;

@end
