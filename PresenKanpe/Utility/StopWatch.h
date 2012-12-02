//
//  StopWatch.h
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/01.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stopwatch : NSObject {
    NSTimeInterval offsetTime;
    NSDate *startTime;
    BOOL isStopwatchStart;
}
@property(readonly) NSTimeInterval second;
@property BOOL isStopwatchStart;
- (void)startStop;
- (void)reset;
@end