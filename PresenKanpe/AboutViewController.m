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

-(id)init{
    self.title=NSLocalizedString(@"AboutViewTitleText", nil);
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] applicationFrame];//ステータスバーを除いた画面サイズ
    //NavigationBarの高さ取得
    CGFloat navBarHeight  = self.navigationController.navigationBar.frame.size.height;

    //説明文 スクロールする
    UITextView* textView = [[[UITextView alloc] init] autorelease];
    textView.frame = CGRectMake(0,0,cgRectSize.size.width,cgRectSize.size.height-navBarHeight);
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.editable = NO; //編集不可にする
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:16];
    textView.text = NSLocalizedString(@"AboutViewAboutText", nil);
    textView.indicatorStyle = UIScrollViewIndicatorStyleWhite;//スクロールバーの色
    [textView flashScrollIndicators];//スクロールバーを常に表示？
    [self.view addSubview:textView];

    //ボタン 作者twitterへのボタン
    MyCustomButton *goTwitterButton = [[MyCustomButton alloc] init];
    goTwitterButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goTwitterButton setTitle:NSLocalizedString(@"AboutViewTwitterButton", nil) forState:UIControlStateNormal];
    [goTwitterButton addTarget:self
                        action:@selector(goTwitter)
              forControlEvents:UIControlEventTouchUpInside];
    [goTwitterButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
    [self.view addSubview:goTwitterButton];

    /*
    //ボタン 戻るボタン(不要かもしれない)
    MyCustomButton *goBackButton = [[MyCustomButton alloc] init];
    goBackButton.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT
                                       ,cgRectSize.size.width,BUTTON_HEIGHT);
    [goBackButton setTitle:NSLocalizedString(@"AboutViewBackButton", nil) forState:UIControlStateNormal];
    [goBackButton addTarget:self
                        action:@selector(buttonDidPush)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];
     */

}

- (void)goTwitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:TWITTER_URL_TATTYAMM]];
}

/*
- (void)buttonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}
*/

@end
