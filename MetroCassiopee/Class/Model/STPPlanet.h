//
//  STPPlanet.h
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STPPlanet : NSObject

@property(copy, nonatomic) NSString * name;
@property(copy, nonatomic) NSString * imageName;
@property(assign) BOOL isJediPlace;

-(id)initWithName:(NSString *)name andImageName:(NSString *)imageName andAccess:(BOOL)isJediPlace;

@end
