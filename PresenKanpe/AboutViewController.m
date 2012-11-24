//
//  AboutViewController.m
//  PresenKanpe
//
//  Created by entatsu on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MyCustomButton.h"

#define BUTTON_HEIGHT 40 //ボタンの高さ

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] applicationFrame]; //ステータスバーを含まない高さ
    //NavigationBarの高さ取得
    CGFloat navBarHeight  = self.navigationController.navigationBar.bounds.size.height;
    
    //ラベル
    NSString *labelStr = @"使い方\n1.あーすしてこーしてこーしてどーしてそーしてこーする\n2.こーする\n3.どーする";
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
    MyCustomButton *goTwitterButton = [[MyCustomButton alloc] init];
    goTwitterButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT*2
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goTwitterButton setTitle:@"作者のtwitterへ" forState:UIControlStateNormal];
    [goTwitterButton addTarget:self
                        action:@selector(goTwitter)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goTwitterButton];

    
    //ボタン 戻るボタン
    MyCustomButton *goBackButton = [[MyCustomButton alloc] init];
    goBackButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goBackButton setTitle:@"戻る" forState:UIControlStateNormal];
    [goBackButton addTarget:self
                        action:@selector(buttonDidPush)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];

}

- (void)goTwitter {
    NSString *urlString = @"https://twitter.com/tattyamm";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (void)buttonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
