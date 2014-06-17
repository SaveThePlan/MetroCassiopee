//
//  STPChooseViewController.h
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPUser.h"
#import "STPChooseView.h"

@interface STPChooseViewController : UIViewController <STPChooseViewListener>

@property(retain) STPUser * user;

@end
