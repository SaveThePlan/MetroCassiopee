//
//  STPChooseView.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPChooseView.h"

@implementation STPChooseView



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Getters & Setters

@synthesize listener = _listener;

-(id<STPChooseViewListener>)listener
{
    return _listener;
}

-(void)setListener:(id<STPChooseViewListener>)listener
{
    _listener = [listener retain];
    [_chooseSegment addTarget:_listener action:@selector(onChooseSegmentValueChange:)
             forControlEvents:UIControlEventValueChanged];
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Birth & Death

- (id)init
{
    self = [super init];
    if (self) {
        [self loadInterfaceElements];
        [self loadInterfaceConstraints];
    }
    return self;
}

-(void)dealloc
{
    [_listener release]; _listener = nil;
    
    [super dealloc];
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Privates methods


-(void)loadInterfaceElements
{
    _chooseLabel = [[UILabel alloc] initForAutoLayout];
    [_chooseLabel setTextAlignment:NSTextAlignmentCenter];
    [_chooseLabel setText:@"De quel côté de la force êtes vous ?"];
    [self addSubview:_chooseLabel];
    [_chooseLabel release];

    _chooseSegment = [[UISegmentedControl alloc] initForAutoLayoutWithItems:@[@"jedi", @"sith"]];
    [_chooseSegment setBackgroundImage:[UIImage imageNamed:@"back-segmented.png"]
                              forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_chooseSegment setDividerImage:[UIImage imageNamed:@"div-segmented.png"]
                forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self addSubview:_chooseSegment];
    [_chooseSegment release];
}

-(void)loadInterfaceConstraints
{
    NSDictionary * allViews = NSDictionaryOfVariableBindings(_chooseLabel, _chooseSegment);
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:|-[_chooseLabel]-|"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:[_chooseSegment(200)]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-[_chooseLabel]-[_chooseSegment]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:_chooseSegment attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:_chooseLabel attribute:NSLayoutAttributeCenterX
                         multiplier:1 constant:0]];
}

@end
