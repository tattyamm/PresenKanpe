//
//  Configuration.m
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/12/08.
//  Copyright (c) 2012年 tatsuya endo. All rights reserved.
//

#import "Configuration.h"
#import "Const.h"

@implementation Configuration

+ (NSString *)kanpeString {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{KANPE_STRING_SAVE_KEY : @""}];
    return [userDefaults objectForKey:KANPE_STRING_SAVE_KEY];
}

+ (void)setKanpeString:(NSString *)value {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:KANPE_STRING_SAVE_KEY];
}

+ (void)synchronize {
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end