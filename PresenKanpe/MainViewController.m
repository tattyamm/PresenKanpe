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

@implementation MainViewController

-(id)init{
    self.title=@"PresenKanpe";
    return self;
}

- (void)viewDidLoad{

    [super viewDidLoad];
    
    //navigationBar部分
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //  iボタンを追加
    //  http://d.hatena.ne.jp/chaoruko/20120203/1328236510
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self
                   action:@selector(infoButtonDiDPushed)
         forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    //  決定ボタンを追加(任意の文字)
    UIBarButtonItem *goButton = [[UIBarButtonItem alloc]
                            initWithTitle:@"決定"
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
    textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView_.delegate = self;
    textView_.text = @"実は好奇心のゆえに、しかれども予は予が画師たるを利器として、ともかくも口実を設けつつ、予と兄弟もただならざる医学士高峰をしいて、某の日東京府下の一病院において、渠が刀を下すべき、貴船伯爵夫人の手術をば予をして見せしむることを余儀なくしたり。\nその日午前九時過ぐるころ家を出でて病院に腕車を飛ばしつ。直ちに外科室の方に赴くとき、むこうより戸を排してすらすらと出で来たれる華族の小間使とも見ゆる容目よき婦人二、三人と、廊下の半ばに行き違えり。見れば渠らの間には、被布着たる一個七、八歳の娘を擁しつ、見送るほどに見えずなれり。これのみならず玄関より外科室、外科室より二階なる病室に通うあいだの長き廊下には、フロックコート着たる紳士、制服着けたる武官、あるいは羽織袴の扮装の人物、その他、貴婦人令嬢等いずれもただならず気高きが、あなたに行き違い、こなたに落ち合い、あるいは歩し、あるいは停し、往復あたかも織るがごとし。";
    [self.view addSubview:textView_];
    
    /* キーボードに追従しないので、一旦コメントアウト
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
    [nextButton addTarget:self action:@selector(goButtonDidPushKanpe) forControlEvents:UIControlEventTouchUpInside];
    // ボタンをViewに貼る
    [accessoryView addSubview:nextButton];
    textField.inputAccessoryView = accessoryView;
     */
    
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
    static const CGFloat kKeyboardHeight = 216.0;   //TODO iOS5以降では、変換候補が出るとサイズが変わる。
    
    //アニメーションの設定
    [UIView beginAnimations:nil context:nil];   //アニメーションの条件付け開始
    [UIView setAnimationDuration:0.3];  //指定時間でアニメーションを終了させる
    
    //UITextViewを小さくする
    CGRect textViewFrame = textView.frame;
    textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
    textView.frame = textViewFrame;
    //（他にも移動したいviewがあるならここで操作する）
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
