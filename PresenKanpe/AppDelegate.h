//
//  AppDelegate.h
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window_;
    UIViewController* mainViewController_;
    UIViewController* kanpeViewController_;
    UIViewController* aboutViewController_;
}

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) MainViewController *mainViewController;

@end


