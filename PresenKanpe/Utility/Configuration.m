//
//  Configuration.m
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/08.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

#import "Configuration.h"
#import "Const.h"

@implementation Configuration

/**
 * kanpeStringのgetter.
 */
+ (NSString *)kanpeString {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{KANPE_STRING_SAVE_KEY : NSLocalizedString(@"DefaultKaneText", nil)}];
    return [userDefaults objectForKey:KANPE_STRING_SAVE_KEY];
}

/**
 * kanpeStringのsetter.
 */
+ (void)setKanpeString:(NSString *)value {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:KANPE_STRING_SAVE_KEY];
}

+ (void)synchronize {
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end