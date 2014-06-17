//
//  STPPlanet.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPPlanet.h"

@implementation STPPlanet

-(id)initWithName:(NSString *)name andImageName:(NSString *)imageName andAccess:(BOOL)isJediPlace
{
    self = [self init];
    if (self) {
        [self setName:name];
        [self setImageName:imageName];
        [self setIsJediPlace:isJediPlace];
    }
    return self;
}

-(void)dealloc
{
    [_name release]; _name = nil;
    [_imageName release]; _imageName = nil;
    
    [super dealloc];
}

@end
