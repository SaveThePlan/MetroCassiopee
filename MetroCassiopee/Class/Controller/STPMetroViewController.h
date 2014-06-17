//
//  STPMetroViewController.h
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPUser.h"

@interface STPMetroViewController : UIViewController

@property(retain) STPUser * user;

-(void)resetView;

@end
