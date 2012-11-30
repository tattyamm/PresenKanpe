//
//  StopWatch.h
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/01.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//
// この辺りを参考にしてる
// http://cocoa.synck.jp/1237172145.html
// TODO そのうち自分で書く。

#import <Foundation/Foundation.h>

@interface StopWatch : NSObject{
    NSTimeInterval offsetTime;
    NSDate *startTime;
}

@end
