//
//  KanpeViewController.m
//  PresenKanpe
//
//  Created by entatsu on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "KanpeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MyCustomButton.h"
#import "StopWatch.h"

@implementation KanpeViewController
@synthesize timerLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //navigationBarの設定
    //  リセットボタンを追加（右上）
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc]
                                 initWithTitle:NSLocalizedString(@"KanpeViewResetButton", nil)
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(resetButtonDidPush)];
    self.navigationItem.rightBarButtonItem = resetButton;

    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] applicationFrame]; //ステータスバーを除いた画面サイズ

    //ラベル
    timerLabel = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    timerLabel.frame = CGRectMake(0, 0, cgRectSize.size.width, 80);
    timerLabel.text = @"00:00";
    timerLabel.textAlignment = NSTextAlignmentCenter;
    timerLabel.backgroundColor = [UIColor blackColor];
    timerLabel.textColor = [UIColor whiteColor];
    timerLabel.font = [UIFont systemFontOfSize:70];
    timerLabel.adjustsFontSizeToFitWidth = YES;
    timerLabel.minimumFontSize = 30.0f;
    [self.view addSubview:timerLabel];
    
    //カンペ文表示
    textView = [[[UITextView alloc] init] autorelease];
    textView.frame = CGRectMake(0,120,cgRectSize.size.width,cgRectSize.size.height-100);
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.editable = NO; //編集不可にする
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:32];
    textView.indicatorStyle = UIScrollViewIndicatorStyleWhite;//スクロールバーの色
    textView.text = [Configuration kanpeString];
    [self.view addSubview:textView];
    
    /*
    //スクロールボタンを置くかも。 -> 1行スクロールのやり方がよくわからない。
    MyCustomButton *scrollButton = [[MyCustomButton alloc] init];
    scrollButton.frame = CGRectMake(0,0,cgRectSize.size.width,35);
    scrollButton.autoresizingMask =
        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [scrollButton setTitle:@"scroll" forState:UIControlStateNormal];
    [scrollButton addTarget:self
                    action:@selector(scrollButtonDidPush)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scrollButton];
     */
    
    
    //スタートボタン
    startButton = [[MyCustomButton alloc] init];
    startButton.frame = CGRectMake(cgRectSize.size.width/2*0,80,cgRectSize.size.width,35);
    [startButton setTitle:NSLocalizedString(@"KanpeViewStartButton", nil) forState:UIControlStateNormal];
    [startButton addTarget:self
                    action:@selector(startButtonDidPush)
          forControlEvents:UIControlEventTouchUpInside];
    [startButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
    [self.view addSubview:startButton];
    
    /*
    //ストップボタン
    stopButton = [[MyCustomButton alloc] init];
    stopButton.frame = CGRectMake(cgRectSize.size.width/2*1,60,cgRectSize.size.width/2*1,40);
    [stopButton setTitle:NSLocalizedString(@"KanpeViewStopButton", nil) forState:UIControlStateNormal];
    [stopButton addTarget:self
                   action:@selector(stopButtonDidPush)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    */
    
    //ストップウォッチ準備
    stopwatch = [[Stopwatch alloc] init];
    
}

- (void)updateUI:(NSTimer *)t
{
    NSTimeInterval second = stopwatch.second;
    //NSString *s = [[NSString alloc] initWithFormat:@"%.2f", second];
    timerLabel.text = [self makeClockStrFromSeconds:second];
    //[s release];
}

- (void)startButtonDidPush {
    NSLog(@"startButtonDidPush");
    [stopwatch control];
    if (stopwatch.isStopwatchStart) {
        // START
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(updateUI:)
                                               userInfo:nil
                                                repeats:YES];
        [timer retain];
        [startButton setTitle:NSLocalizedString(@"KanpeViewStopButton", nil) forState:UIControlStateNormal];
    }
    else {
        // STOP
        [timer invalidate];
        [timer release];
        [startButton setTitle:NSLocalizedString(@"KanpeViewStartButton", nil) forState:UIControlStateNormal];
        
    }
}

/*
- (void)stopButtonDidPush {
    NSLog(@"stopButtonDidPush");
    [stopwatch control];
    if (stopwatch.isStopwatchStart) {
        // START
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(updateUI:)
                                               userInfo:nil
                                                repeats:YES];
        [timer retain];
        [startButton setTitle:@"STOP" forState:UIControlStateNormal];
        
    }
    else {
        // STOP
        [timer invalidate];
        [timer release];
        [startButton setTitle:@"START" forState:UIControlStateNormal];
        
    }
}
 */

- (void)resetButtonDidPush {
    NSLog(@"resetButtonDidPush");
    
    if (stopwatch.isStopwatchStart){
        return;
    }

    //スクロールのリセット
    NSRange range = NSMakeRange(0, 0);
    [textView scrollRangeToVisible:range];
    
    //タイマーのリセット
    [stopwatch reset];
    [self updateUI:nil];
}

/*
- (void)scrollButtonDidPush {
    //末尾までスクロールする場合の書き方
    NSRange range = NSMakeRange(textView.text.length - 1, 1);
    [textView scrollRangeToVisible:range];
}
*/

/**
 * 秒を受け取り、「01:23」という時刻風表示に変換する
 * 例 NSString *result = [self makeClockStrFromSeconds:70.2];
 */
- (NSString *)makeClockStrFromSeconds:(double)second;  //戻り値がNSString型、引数がNSString型のメソッドを定義
{
    int min = (int)second/60;
    int sec = (int)(second-min*60);
    return [NSString stringWithFormat:@"%02d:%02d", min,sec];;
    
}


@end


