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
    //  iボタンを追加
    //  http://d.hatena.ne.jp/chaoruko/20120203/1328236510
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self
                   action:@selector(buttonDidPushAbout)
         forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    //  戻るボタンの変更
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"arrow_left_24.png"]
                                   style:UIBarButtonItemStyleBordered
                                   target:nil
                                   action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"Hello, world!";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //ボタンを追加(カンペ画面へ)
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"presen" forState:UIControlStateNormal];
    [button2 sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button2.center = newPoint;
    button2.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button2 addTarget:self
               action:@selector(buttonDidPushKanpe)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}


- (void)buttonDidPushKanpe {
    KanpeViewController* about = [[[KanpeViewController alloc] init] autorelease];
    [self.navigationController pushViewController:about animated:YES];
}

- (void)buttonDidPushAbout {
    AboutViewController* kanpe = [[[AboutViewController alloc] init] autorelease];
    [self.navigationController pushViewController:kanpe animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
