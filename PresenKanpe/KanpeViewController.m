//
//  KanpeViewController.m
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "KanpeViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation KanpeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] bounds]; //cgRectSize.size.widthで取得
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"kanpe view";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //ボタン
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"画面遷移" forState:UIControlStateNormal];
    button.frame = CGRectMake(cgRectSize.size.width/3*2,0,cgRectSize.size.width/3*1,40);
    [[button layer] setCornerRadius:20.0f];
    [[button layer] setMasksToBounds:YES];
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBackgroundColor:[[UIColor blackColor] CGColor]];
    [[button layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self
               action:@selector(buttonDidPush)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}

@end


