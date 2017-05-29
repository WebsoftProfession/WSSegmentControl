//
//  WSSegmentButton.m
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import "WSSegment.h"

@implementation WSSegment

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.isActive) {
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, activeFromValue, self.frame.size.height) cornerRadius:0];
        [self.activeColor setFill];
        [path fill];
    }
    else
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, inActiveFromValue, self.frame.size.height) cornerRadius:0];
        [self.inActiveColor setFill];
        [path fill];
    }
    
    
}

-(void)runActiveAnimation{
    if (activeThemeTimer) {
        [activeThemeTimer invalidate];
        activeThemeTimer = nil;
    }
    activeThemeTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(activateTheme:) userInfo:nil repeats:YES];
}

-(void)runInActiveAnimation
{
    if (inActiveThemeTimer) {
        [inActiveThemeTimer invalidate];
        inActiveThemeTimer = nil;
    }
    inActiveThemeTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(deActivateTheme:) userInfo:nil repeats:YES];
}

-(void)activateTheme:(NSTimer *)timer
{
    activeToValue = self.frame.size.width;
    
    if (activeFromValue <= activeToValue) {
        
        activeFromValue +=2 ;
        [self setNeedsDisplay];
    }
    else
    {
        [activeThemeTimer invalidate];
        activeThemeTimer = nil;
    }
}

-(void)deActivateTheme:(NSTimer *)timer
{
    inActiveToValue = self.frame.size.width;
    
    if (inActiveFromValue <= inActiveToValue) {
        [self setNeedsDisplay];
        inActiveFromValue += 2;
        
    }
    else
    {
        [inActiveThemeTimer invalidate];
        inActiveThemeTimer = nil;
    }
}

@end
