//
//  AboutViewController.m
//  PresenKanpe
//
//  Created by tatsuya endo on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] bounds]; //cgRectSize.size.widthで取得
    
    
    //ラベル高さ調整の実験
    NSString *labelStr = @"使い方\n1.プレゼン中に見るメモを入力\n2.プレゼン画面へ\n3.プレゼン中にタイマーとメモをみてしゃべる";
    CGSize labelStrSize = [labelStr
                   sizeWithFont:[UIFont boldSystemFontOfSize:13]
                   constrainedToSize:CGSizeMake(cgRectSize.size.width,cgRectSize.size.height/2)
                   lineBreakMode:UILineBreakModeWordWrap];
    NSLog(@"labelStr height: %f", labelStrSize.height);
    NSLog(@"cgRectSize height: %f", cgRectSize.size.height);
    
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = labelStr;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(0,0,cgRectSize.size.width,cgRectSize.size.height);
    [label sizeToFit];
    label.textAlignment = UITextAlignmentLeft;
    label.adjustsFontSizeToFitWidth = YES;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //ボタン
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"画面遷移" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
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
