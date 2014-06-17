//
//  STPMetroViewController.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPMetroViewController.h"
#import "STPMapTableViewController.h"
#import "UIImage+STPImageResize.h"

@interface STPMetroViewController () {
    STPMapTableViewController * mapTableViewCtrler;
    UINavigationController * navController;
}

@end

@implementation STPMetroViewController



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Birth & Death

-(void)dealloc
{
    [mapTableViewCtrler release]; mapTableViewCtrler = nil;
    [navController release]; navController = nil;
    [_user release]; _user = nil;
    
    [super dealloc];
}

-(id)init
{
    self = [super init];
    if (self) {
        //tabBarItem
        [self setTabBarItem:[[[UITabBarItem alloc] initWithTitle:@"carte des stations"
                                                           image:[UIImage imageResizeWithName:@"map" andType:@"png"
                                                                                    andHeight:24.0]
                                                             tag:1] autorelease]];
    }
    return self;
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mapTableViewCtrler = [[STPMapTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [mapTableViewCtrler setUser:_user];
    
    navController = [[UINavigationController alloc] initWithRootViewController:mapTableViewCtrler];
    
    [[self view] addSubview:[navController view]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Actions

-(void)resetView
{
    [navController popToRootViewControllerAnimated:YES];
}


@end
