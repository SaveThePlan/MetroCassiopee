//
//  STPMapTableViewController.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPMapTableViewController.h"
#import "STPPlanet.h"
#import "STPPlanetViewController.h"

@interface STPMapTableViewController () {
    NSArray * planets;
}

@end

@implementation STPMapTableViewController



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Birth & Death

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        planets = [[NSArray arrayWithArray:[self arrayOfPlanets]] retain];
    }
    return self;
}

-(void)dealloc
{
    [planets release]; planets = nil;
    [_user release]; _user = nil;
    
    [super dealloc];
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationItem] setTitle:@"Carte"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Protocol : UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [planets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId;
    static NSString * character;
    static UIColor * bgColor;
    static UIColor * fgColor;
    
    STPPlanet * planet = (STPPlanet *)[planets objectAtIndex:[indexPath row]];
    
    if([planet isJediPlace]) {
        cellId = @"cellJedi";
        character = @"leia.png";
        bgColor = [UIColor whiteColor];
        fgColor = [UIColor lightGrayColor];
    } else {
        cellId = @"cellSith";
        character = @"vador.png";
        bgColor = [UIColor blackColor];
        fgColor = [UIColor whiteColor];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        [cell setBackgroundColor:bgColor];
        [[cell textLabel] setTextColor:fgColor];
    }
    
    [[cell textLabel] setText:[planet name]];
    
    if([planet isJediPlace] == [_user isJedi]) {
        [[cell detailTextLabel] setText:@"accès autorisé"];
        [[cell detailTextLabel] setTextColor:[UIColor greenColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    } else {
        [[cell detailTextLabel] setText:@"accès refusé"];
        [[cell detailTextLabel] setTextColor:[UIColor redColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Protocol : UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STPPlanet * planet = (STPPlanet *)[planets objectAtIndex:[indexPath row]];
    
    if([planet isJediPlace] == [_user isJedi]) {
        //access allowed
        STPPlanetViewController * planetDetails = [[STPPlanetViewController alloc] initWithPlanet:planet];
        [[self navigationController] pushViewController:planetDetails animated:YES];
        [planetDetails release];
    }
    
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Privates methods

-(NSArray *)arrayOfPlanets
{
    NSMutableArray * tmpMap = [[NSMutableArray alloc] init];
    
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Tatooine"
                                         andImageName:@"planete-0.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Yavin IV"
                                         andImageName:@"planete-1.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Endor"
                                         andImageName:@"planete-2.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Geonosis"
                                         andImageName:@"planete-3.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Hoth"
                                         andImageName:@"planete-4.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Coruscan"
                                         andImageName:@"planete-5.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Alderaan"
                                         andImageName:@"planete-6.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Bespin"
                                         andImageName:@"planete-7.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Camino"
                                         andImageName:@"planete-8.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Mustafar"
                                         andImageName:@"planete-9.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Dagobah"
                                         andImageName:@"planete-10.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Dantooine"
                                         andImageName:@"planete-11.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Bestine"
                                         andImageName:@"planete-12.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Polus"
                                         andImageName:@"planete-13.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Mon Calamari"
                                         andImageName:@"planete-14.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Kuat"
                                         andImageName:@"planete-15.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Shola"
                                         andImageName:@"planete-16.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Ryloth"
                                         andImageName:@"planete-17.png" andAccess:YES]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Alzoc III"
                                         andImageName:@"planete-18.png" andAccess:NO]];
    [tmpMap addObject:[[STPPlanet alloc] initWithName:@"Jabiim"
                                         andImageName:@"planete-19.png" andAccess:YES]];
    
    return [tmpMap autorelease];
}

@end
