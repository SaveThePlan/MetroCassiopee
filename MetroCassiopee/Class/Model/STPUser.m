//
//  STPUser.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPUser.h"

@implementation STPUser

-(id)initUserIsJedi:(BOOL)isJedi
{
    self = [self init];
    if(self) {
        [self setIsJedi:isJedi];
    }
    return self;
}

@end
