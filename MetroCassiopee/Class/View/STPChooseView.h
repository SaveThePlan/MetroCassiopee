//
//  STPChooseView.h
//  MetroCassiopee
//
//  Created by Nanook on 17/06/2014.
//  Copyright (c) 2014 SaveThePlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+STPViewForAutoLayout.h"



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - ENUM UserSide

typedef enum : NSUInteger {
    userIsAJedi = 0,
    userIsASith = 1
} userSide;



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - Listener

@protocol STPChooseViewListener <NSObject>

-(void)onChooseSegmentValueChange:(id)sender;

@end


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#pragma mark - INTERFACE

@interface STPChooseView : UIView

@property(readonly) UILabel * chooseLabel;
@property(readonly) UISegmentedControl * chooseSegment;
@property(retain) id<STPChooseViewListener> listener;

@end
