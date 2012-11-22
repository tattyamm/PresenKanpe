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
#import <QuartzCore/QuartzCore.h>   //UITextFieldの枠線や、UIButtonの背景色を設定するのに使った

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
    
    
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] bounds]; //cgRectSize.size.widthで取得
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"表示する文字を入力して下さい";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(0,0,cgRectSize.size.width,70);
    label.textAlignment = UITextAlignmentLeft;
    label.adjustsFontSizeToFitWidth = YES;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //テキストフィールド TODO キーボードサイズを取得し、iPhoneとiPadとiOS5でちょうど良く表示する
    UITextView* textField = [[[UITextView alloc] init] autorelease];
    textField.frame = CGRectMake(0, 30, cgRectSize.size.width, 100);
    textField.backgroundColor = [UIColor whiteColor];
    textField.textColor = [UIColor blackColor];
    textField.layer.cornerRadius = 5.0f;//角丸
    textField.layer.borderColor = [[UIColor blackColor] CGColor];
    textField.layer.borderWidth = 1;
    [[textField layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    [[textField layer] setBorderWidth:1.0];
    textField.text = @"（TODO 前回の入力内容を追加）";
    [self.view addSubview:textField];
    
    //カンペ画面へ キーボードと同時に出る　http://www.toyship.org/archives/82
    UIView* accessoryView =[[[UIView alloc] initWithFrame:CGRectMake(0,0,cgRectSize.size.width,40)] autorelease];
    accessoryView.backgroundColor = [UIColor grayColor];
    // ボタンを作成する。　//TODO iPad向けの調整
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(cgRectSize.size.width/3*2,0,cgRectSize.size.width/3*1,40);
    [[nextButton layer] setCornerRadius:20.0f];
    [[nextButton layer] setMasksToBounds:YES];
    [[nextButton layer] setBorderWidth:2.0f];
    [[nextButton layer] setBackgroundColor:[[UIColor blackColor] CGColor]];
    [[nextButton layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    [nextButton setTitle:@"決定" forState:UIControlStateNormal];
    
    
    
    // ボタンを押したときによばれる動作を設定する。
    [nextButton addTarget:self action:@selector(buttonDidPushKanpe) forControlEvents:UIControlEventTouchUpInside];
    // ボタンをViewに貼る
    [accessoryView addSubview:nextButton];
    textField.inputAccessoryView = accessoryView;
    
    /*
     //ボタンを追加(カンペ画面へ)(ただのボタン)
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
     */
    

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
