//
//  ViewController.m
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *titleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    titleArray = @[@"Swift",@"Objective",@"Random"];
    wsSegment.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [wsSegment setupSegment];
}

-(int)numberOfButtonInSegment
{
    return 3;
}

-(NSString *)titlesForSegment:(int)index
{
    return [titleArray objectAtIndex:index];
}

-(void)didSelectSegmentAtIndex:(int)index
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
