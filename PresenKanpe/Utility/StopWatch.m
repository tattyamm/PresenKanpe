//
//  StopWatch.m
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/01.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

#import "StopWatch.h"

@implementation StopWatch

- (NSTimeInterval)second
{
    NSTimeInterval second;
    second = -[startTime timeIntervalSinceNow]; // zero if startTime is nil
    second += offsetTime;
    return second;
}

@end
