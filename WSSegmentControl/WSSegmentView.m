//
//  WSSegmentView.m
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import "WSSegmentView.h"

@implementation WSSegmentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.clipsToBounds =YES;
    self.layer.cornerRadius = 5.0;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor purpleColor].CGColor;
}


//- (id)initWithFrame:(CGRect)theFrame{
//    self = [super initWithFrame:theFrame];
//    if (self) {
//        
//    }
//    return self;
//}

-(void)titleForSegment
{
    
}


-(void)setupSegment{
    
    int count = [self.delegate numberOfButtonInSegment];
    float buttonWidth = self.frame.size.width/count;
    float buttonHeight = self.frame.size.height;
    for (int i = 0; i<count; i++) {
        WSSegment *btn = [WSSegment buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, buttonHeight);
        [btn setTitle:[self.delegate titlesForSegment:i] forState:UIControlStateNormal];
        btn.tag = buttonWidth+i;
        btn.buttonIndex = i;
        if (i==_currentSegmentIndex) {
            //btn.backgroundColor = [UIColor purpleColor];
            btn.isActive = true;
            if (self.activeColor) {
                self.layer.borderColor = self.activeColor.CGColor;
                btn.activeColor = self.activeColor;
                [btn setTitleColor:self.inActiveColor forState:UIControlStateNormal];
            }
            else{
                self.layer.borderColor = [UIColor purpleColor].CGColor;
                btn.activeColor = [UIColor purpleColor];
                [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            }
            
            [btn runActiveAnimation];
        }
        else
        {
            //btn.backgroundColor = [UIColor lightGrayColor];
            btn.isActive = false;
            if (self.inActiveColor) {
                btn.inActiveColor = self.inActiveColor;
                [btn setTitleColor:self.activeColor forState:UIControlStateNormal];
            }
            else{
                btn.inActiveColor = [UIColor lightGrayColor];
                [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            }
            [btn runInActiveAnimation];
        }
        if (self.font) {
            btn.titleLabel.font = self.font;
        }
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)btnAction:(WSSegment *)btn
{
    self.currentSegmentIndex = btn.buttonIndex;
    [self.delegate didSelectSegmentAtIndex:btn.buttonIndex];
    [self setupSegment];
}

-(int)selectedWSSegmentIndex{
    return self.currentSegmentIndex;
}

-(void)selectWSSegmentAtIndex:(int)index{
    self.currentSegmentIndex=index;
    [self setupSegment];
}

@end
