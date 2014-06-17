//
//  STPPlanetViewController.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPPlanetViewController.h"
#import "UIView+STPViewForAutoLayout.h"

@interface STPPlanetViewController () {
    STPPlanetView * planetView;
}

@end

@implementation STPPlanetViewController

-(id)initWithPlanet:(STPPlanet *)planet
{
    self = [self init];
    if(self) {
        [self setPlanet:planet];
    }
    return self;
}

-(void)dealloc
{
    [_planet release]; _planet = nil;
    
    [super dealloc];
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    planetView = [[STPPlanetView alloc] initForAutoLayout];
    [[self view] addSubview:planetView];
    [planetView release];
    
    id topGuide = [self topLayoutGuide];
    
    NSDictionary * allViews = NSDictionaryOfVariableBindings(topGuide, planetView);
    [[self view] addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|-[planetView]-|"
                                 options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:allViews]];
    [[self view] addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"V:[topGuide]-[planetView]-|"
                                 options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:allViews]];
    
    //add data
    [[planetView nameLabel] setText:[NSString stringWithFormat:@"Vue de la planète %@", [_planet name]]];
    [[planetView planetImageView] setImage:[UIImage imageNamed:[_planet imageName]]];
    
    //navBar
    [[self navigationItem] setTitle:[_planet name]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
