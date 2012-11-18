//
//  MainViewController.m
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "MainViewController.h"
#import "KanpeViewController.h"
#import "AboutViewController.h"


@implementation MainViewController

-(id)init{
    self.title=@"PresenKanpe";
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //navigationBar部分
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    UIImage* infoButtonImage = [UIImage imageNamed:@"info_24.png"]; //TODO UIButtonTypeInfoLightは使えないのだろうか。
    UIImageView* infoButtonImageView = [[[UIImageView alloc] initWithImage:infoButtonImage] autorelease];
    UIBarButtonItem* navBarinfoButtonIcon = [[[UIBarButtonItem alloc] initWithCustomView:infoButtonImageView] autorelease];
    self.navigationItem.leftBarButtonItem =navBarinfoButtonIcon;
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"Hello, world!";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //ボタン
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"about" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self
               action:@selector(buttonDidPushKanpe)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //ボタンを追加
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"presen" forState:UIControlStateNormal];
    [button2 sizeToFit];
    newPoint.y += 100;
    button2.center = newPoint;
    button2.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button2 addTarget:self
               action:@selector(buttonDidPushAbout)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}


- (void)buttonDidPushKanpe {
    AboutViewController* about = [[[AboutViewController alloc] init] autorelease];
    [self.navigationController pushViewController:about animated:YES];
}

- (void)buttonDidPushAbout {
    KanpeViewController* kanpe = [[[KanpeViewController alloc] init] autorelease];
    [self.navigationController pushViewController:kanpe animated:YES];
}

- (void)buttonDidPushUiButton1 {
    AboutViewController* about = [[[AboutViewController alloc] init] autorelease];
    [self.navigationController pushViewController:about animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
