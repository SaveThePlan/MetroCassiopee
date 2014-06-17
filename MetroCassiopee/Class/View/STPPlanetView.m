//
//  STPPlanetView.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPPlanetView.h"

@implementation STPPlanetView



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

-(void)loadInterfaceElements
{
    _nameLabel = [[UILabel alloc] initForAutoLayout];
    [_nameLabel setTextColor:[UIColor whiteColor]];
    [_nameLabel setTextAlignment:NSTextAlignmentCenter];
    [_nameLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    [self addSubview:_nameLabel];
    [_nameLabel release];
    
    _planetImageView = [[UIImageView alloc] initForAutoLayout];
    [_planetImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:_planetImageView];
    [_planetImageView release];
}

-(void)loadInterfaceConstraints
{
    NSDictionary * allViews = NSDictionaryOfVariableBindings(_nameLabel, _planetImageView);

    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:|[_nameLabel]|"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:[_planetImageView(200)]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|[_planetImageView(200)]-[_nameLabel]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil views:allViews]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:_planetImageView attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:_nameLabel attribute:NSLayoutAttributeCenterX
                         multiplier:1 constant:0]];
}

@end
