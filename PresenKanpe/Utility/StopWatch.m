//
//  StopWatch.m
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/01.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

#import "StopWatch.h"

@implementation Stopwatch

@synthesize isStopwatchStart;

- (NSTimeInterval)second
{
    NSTimeInterval second;
    second = -[startTime timeIntervalSinceNow]; // zero if startTime is nil
    second += offsetTime;
    return second;
}

- (void)control
{
    if (isStopwatchStart) {
        // STOP
        offsetTime = self.second;
        [startTime release];
        startTime = nil;
        self.isStopwatchStart = NO;
    }
    else {
        // START
        startTime = [[NSDate alloc] init];
        self.isStopwatchStart = YES;
    }
}

- (void)reset
{
    self.isStopwatchStart = NO;
    offsetTime = 0.0;
}

- (id)init
{
    [super init];
    [self reset];
    return self;
}

- (void)dealloc
{
    [startTime release];
    [super dealloc];
}
@end