//
//  ViewController.h
//  WSSegmentControl
//
//  Created by Dotsquares on 2/13/17.
//  Copyright © 2017 Dotsquares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSSegmentView.h"

@interface ViewController : UIViewController<WSSegmentDelegate>

{
    __weak IBOutlet WSSegmentView *wsSegment;
}
@end

