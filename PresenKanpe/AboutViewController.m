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
#import "Const.h"

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
    
    //新ラベル スクロールする
    UITextView* textView = [[[UITextView alloc] init] autorelease];
    textView.frame = CGRectMake(0,0,cgRectSize.size.width,cgRectSize.size.height/3*2);
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.editable = NO; //編集不可にする
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:16];
    textView.text = NSLocalizedString(@"AboutViewAboutText", nil);
    [self.view addSubview:textView];

    //ボタン 作者twitterへのボタン
    MyCustomButton *goTwitterButton = [[MyCustomButton alloc] init];
    goTwitterButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT*2
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goTwitterButton setTitle:NSLocalizedString(@"AboutViewTwitterButton", nil) forState:UIControlStateNormal];
    [goTwitterButton addTarget:self
                        action:@selector(goTwitter)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goTwitterButton];

    
    //ボタン 戻るボタン(不要かもしれない)
    MyCustomButton *goBackButton = [[MyCustomButton alloc] init];
    goBackButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goBackButton setTitle:NSLocalizedString(@"AboutViewBackButton", nil) forState:UIControlStateNormal];
    [goBackButton addTarget:self
                        action:@selector(buttonDidPush)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];

}

- (void)goTwitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:TWITTER_URL_TATTYAMM]];
}

- (void)buttonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
