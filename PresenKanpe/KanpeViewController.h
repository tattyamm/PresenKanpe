//
//  KanpenViewController.h
//  PresenKanpe
//
//  Created by entatsu on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomButton.h"

@class Stopwatch;

@interface KanpeViewController : UIViewController{
    UILabel *timerLabel;
    
    NSTimer *timer;
    Stopwatch *stopwatch;
    
    MyCustomButton *startButton, *resetButton;
    UIActivityIndicatorView *busyIndicator;
}
@property (nonatomic, retain) UILabel *timerLabel;

- (void)startButtonDidPush:(id)sender;
- (void)resetButtonDidPush:(id)sender;
- (void)updateUI:(NSTimer *)t;

@end
