//
//  MainViewController.m
//  PresenKanpe
//
//  Created by entatsu on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "MainViewController.h"
#import "KanpeViewController.h"
#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>   //UITextFieldの枠線や、UIButtonの背景色を設定するのに使った
#import "Configuration.h"

@implementation MainViewController

-(id)init{
    self.title=@"PresenKanpe";
    return self;
}

- (void)viewDidLoad{

    [super viewDidLoad];
    
    //navigationBar部分
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //  iボタンを追加
    //  http://d.hatena.ne.jp/chaoruko/20120203/1328236510
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self
                   action:@selector(infoButtonDiDPushed)
         forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    //  決定ボタンを追加(任意の文字)
    UIBarButtonItem *goButton = [[UIBarButtonItem alloc]
                            initWithTitle:NSLocalizedString(@"MainViewDoneButton", nil)
                            style:UIBarButtonItemStylePlain
                            target:self
                            action:@selector(goButtonDidPushKanpe)];
    self.navigationItem.rightBarButtonItem = goButton;
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
    
    //テキストフィールド
    textView_ = [[UITextView alloc] init];
    textView_.frame = self.view.bounds;
    //textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //textView_.delegate = self;
    textView_.text = [Configuration kanpeString];
    [self.view addSubview:textView_];
    //親ビューの高さが変更された時に追従するようにする
    textView_.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //キーボード表示・非表示の通知の開始
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //キーボード表示・非表示の通知を終了
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
//キーボードが表示された場合
- (void)keyboardWillShow:(NSNotification *)aNotification {
    //キーボードのCGRectを取得
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[self.view superview] convertRect:keyboardRect fromView:nil];
    
    //キーボードのanimationDurationを取得
    NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //使える画面のサイズ
    CGRect frame = self.view.frame;
    frame.size.height = [[UIScreen mainScreen] applicationFrame].size.height//ステータスバーを除く画面高さ
    - self.navigationController.navigationBar.frame.size.height//navigationBarの高さ
    - keyboardRect.size.height;//キーボードの高さ
    //TODO ここから、ラベルの分の高さを引く
    
    //キーボードアニメーションと同じ間隔でメインビューの高さをアニメーションしつつ変更する。
    //これでUITextViewも追従して高さが変わる。
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}
//キーボードが非表示にされた場合
- (void)keyboardWillHide:(NSNotification *)aNotification {
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[self.view superview] convertRect:keyboardRect fromView:nil];
    
    NSTimeInterval animationDuration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //使える画面のサイズ
    CGRect frame = self.view.frame;
    frame.size.height = [[UIScreen mainScreen] applicationFrame].size.height//ステータスバーを除く画面高さ
    - self.navigationController.navigationBar.frame.size.height//navigationBarの高さ
    - keyboardRect.size.height;//キーボードの高さ
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}



//画面表示時
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self textViewDidEndEditing:textView_]; //非編集モードにする
}

//画面遷移時
- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [textView_ resignFirstResponder];   //非編集モード
}

//編集開始
- (void) textViewDidBeginEditing:(UITextView*)textView {
    /*
    static const CGFloat kKeyboardHeight = 216.0;   //TODO iOS5以降では、変換候補が出るとサイズが変わる。
    
    //アニメーションの設定
    [UIView beginAnimations:nil context:nil];   //アニメーションの条件付け開始
    [UIView setAnimationDuration:0.3];  //指定時間でアニメーションを終了させる
    
    //UITextViewを小さくする
    CGRect textViewFrame = textView.frame;
    textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
    textView.frame = textViewFrame;
    //（他にも移動したいviewがあるならここで操作する）
     */
}

//編集終了
- (void) textViewDidEndEditing:(UITextView*)textView {
    //UITextViewを大きな方に戻す
    textView.frame = self.view.bounds;
}

//編集ボタン、開始ボタンで使う機能
- (void) editDidPush {
    [textView_ becomeFirstResponder];
}
- (void) doneDidPush {
    [textView_ resignFirstResponder];
}

//画面遷移
- (void)goButtonDidPushKanpe {
    //入力文字の保存
    [Configuration setKanpeString:textView_.text];
    
    //画面遷移
    KanpeViewController* about = [[[KanpeViewController alloc] init] autorelease];
    [self.navigationController pushViewController:about animated:YES];
}

//画面遷移
- (void)infoButtonDiDPushed {
    AboutViewController* kanpe = [[[AboutViewController alloc] init] autorelease];
    [self.navigationController pushViewController:kanpe animated:YES];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [textView_ release];
    [super dealloc];
}

@end
