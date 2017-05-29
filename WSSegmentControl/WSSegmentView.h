//
//  WSSegmentView.h
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSSegment.h"

@protocol WSSegmentDelegate <NSObject>
-(NSString *)titlesForSegment:(int)index;
-(int)numberOfButtonInSegment;
-(void)didSelectSegmentAtIndex:(int)index;
@end
@interface WSSegmentView : UIView<WSSegmentDelegate>
@property (nonatomic,strong) id<WSSegmentDelegate> delegate;
@property (assign) int currentSegmentIndex;
@property (nonatomic,strong) UIColor *activeColor;
@property (nonatomic,strong) UIColor *inActiveColor;
@property (nonatomic,strong) UIFont *font;
-(void)setupSegment;
-(int)selectedWSSegmentIndex;
-(void)selectWSSegmentAtIndex:(int)index;
@end
