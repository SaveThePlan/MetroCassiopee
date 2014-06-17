//
//  STPChooseViewController.m
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import "STPChooseViewController.h"
#import "UIImage+STPImageResize.h"
#import "STPTabBarController.h"

@interface STPChooseViewController () {
    STPChooseView * chooseView;
}

@end

@implementation STPChooseViewController


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Birth & Death

- (id)init
{
    self = [super init];
    if (self) {

        //tabBarItem
        [self setTabBarItem:[[[UITabBarItem alloc] initWithTitle:@"admin"
                                                           image:[UIImage imageResizeWithName:@"gear"
                                                                                      andType:@"png" andHeight:24.0]
                                                             tag:1] autorelease]];
    }
    return self;
}

-(void)dealloc
{
    [_user release]; _user = nil;
    
    [super dealloc];
}




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //background
    [self loadBackground];
    
    //view
    chooseView = [[STPChooseView alloc] initForAutoLayout];
    [chooseView setListener:self];
    [[self view] addSubview:chooseView];
    [chooseView release];
    
    //constraints
    id topGuide = [self topLayoutGuide];
    
    NSDictionary * allViews = NSDictionaryOfVariableBindings(topGuide, chooseView);
    [[self view] addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|[chooseView]|"
                                 options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:allViews]];
    [[self view] addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"V:[topGuide]-[chooseView]|"
                                 options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:allViews]];
    
    
    //configure view with data
    if([_user isJedi]) {
        [[chooseView chooseSegment] setSelectedSegmentIndex:userIsAJedi];
    } else {
        [[chooseView chooseSegment] setSelectedSegmentIndex:userIsASith];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Protocol : STPChooseViewListener

-(void)onChooseSegmentValueChange:(id)sender
{
    if([[chooseView chooseSegment] selectedSegmentIndex] == userIsAJedi) {
        [_user setIsJedi:YES];
    } else if ([[chooseView chooseSegment] selectedSegmentIndex] == userIsASith) {
        [_user setIsJedi:NO];
    }
    
    if([[self tabBarController] isKindOfClass:[STPTabBarController class]]) {
        [(STPTabBarController *)[self tabBarController] resetMetroAccess];
    }
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Privates methods


-(void)loadBackground {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    UIImage * background;
    
    if(screenSize.width > 568 || screenSize.height > 568) {
        background = [UIImage imageNamed:@"fond-2048x2048.jpg"];
    } else if(screenSize.width > 512 || screenSize.height > 512) {
        background = [UIImage imageNamed:@"fond-1136x1136.jpg"];
    } else if(screenSize.width > 480 || screenSize.height > 480) {
        background = [UIImage imageNamed:@"fond-1024x1024.jpg"];
    } else {
        background = [UIImage imageNamed:@"fond-960x960.jpg"];
    }
    
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:background]];
    
}


@end
