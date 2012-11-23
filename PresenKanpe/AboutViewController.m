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
    
    
    //ラベル
    NSString *labelStr = @"使い方\n1.プレゼン中に見るメモを入力\n2.プレゼン画面へ\n3.プレゼン中にタイマーとメモをみてしゃべる";
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = labelStr;
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    label.frame = CGRectMake(0,0,cgRectSize.size.width,cgRectSize.size.height/2);
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    [self.view addSubview:label];
    
    //ボタン 作者twitterへのボタン
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"作者twitter" forState:UIControlStateNormal];
    button.frame = CGRectMake(0,0,cgRectSize.size.width,40);
    button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [[button layer] setCornerRadius:20.0f];
    [[button layer] setMasksToBounds:YES];
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBackgroundColor:[[UIColor blackColor] CGColor]];
    [[button layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    [button addTarget:self
               action:@selector(buttonDidPush)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
