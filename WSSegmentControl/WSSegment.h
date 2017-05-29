//
//  WSSegmentButton.h
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSSegment : UIButton
{
    NSTimer *activeThemeTimer;
    NSTimer *inActiveThemeTimer;
    
    CGFloat activeFromValue;
    CGFloat activeToValue;
    
    CGFloat inActiveFromValue;
    CGFloat inActiveToValue;
    
}
@property (assign) BOOL isActive;
@property (assign) int buttonIndex;
@property (nonatomic) UIColor *activeColor;
@property (nonatomic) UIColor *inActiveColor;

-(void)runActiveAnimation;
-(void)runInActiveAnimation;


@end
