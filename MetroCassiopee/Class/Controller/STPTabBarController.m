//
//  STPTabBarController.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPTabBarController.h"

#import "STPChooseViewController.h"
#import "STPMetroViewController.h"

#import "STPUser.h"

@interface STPTabBarController () {
    STPUser * user;
    STPChooseViewController * chooseCtrler;
    STPMetroViewController * metroCtrler;
}

@end

@implementation STPTabBarController



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Birth & Death

-(id)init
{
    self = [super init];
    if(self) {
        user = [[STPUser alloc] initUserIsJedi:YES];
        
        chooseCtrler = [[STPChooseViewController alloc] init];
        [chooseCtrler setUser:user];
        
        metroCtrler = [[STPMetroViewController alloc] init];
        [metroCtrler setUser:user];
        
        [self setViewControllers:[NSArray arrayWithObjects:chooseCtrler, metroCtrler, nil]];
    }
    return self;
}

-(void)dealloc
{
    [chooseCtrler release]; chooseCtrler = nil;
    [metroCtrler release]; metroCtrler = nil;
    [user release]; user = nil;
    
    [super dealloc];
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Actions

-(void)resetMetroAccess
{
    [metroCtrler resetView];
}


@end
