//
//  Configuration.h
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/08.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

/**
 * NSUserDefaultsのWrapper
 * 参考：http://qiita.com/items/2af840ded249b3e4e9bb
 */
#import <Foundation/Foundation.h>

@interface Configuration : NSObject
+ (NSString *)kanpeString;
+ (void)setKanpeString:(NSString *)value;
+ (void)synchronize;
@end