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
#import "Configuration.h"
#import "FPPopoverController.h"
#import "KanpeMenuViewController.h"

@implementation KanpeViewController
@synthesize timerLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //navigationBarの設定
    //  メニューボタン
    /*
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [menuButton addTarget:self
                   action:@selector(menuButtonDidPush)
         forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    */
    //  メニューボタン
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]
                                 initWithTitle:NSLocalizedString(@"KanpeViewMenuButton", nil)
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(popover:)];
    self.navigationItem.rightBarButtonItem = menuButton;
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] bounds]; //cgRectSize.size.widthで取得
    
    //ラベル
    timerLabel = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    timerLabel.frame = CGRectMake(0, 0, cgRectSize.size.width, 50);
    timerLabel.text = @"00:00";
    timerLabel.textAlignment = NSTextAlignmentCenter;
    timerLabel.backgroundColor = [UIColor blackColor];
    timerLabel.textColor = [UIColor whiteColor];
    timerLabel.font = [UIFont systemFontOfSize:40];
    timerLabel.adjustsFontSizeToFitWidth = YES;
    timerLabel.minimumFontSize = 30.0f;
    [self.view addSubview:timerLabel];
    
    //カンペ文表示
    UITextView* textView = [[[UITextView alloc] init] autorelease];
    textView.frame = CGRectMake(0,100,cgRectSize.size.width,300);
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.editable = NO; //編集不可にする
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:32];
    textView.text = [Configuration kanpeString];
    [self.view addSubview:textView];
    
    //スクロールボタンを置くかも。
    MyCustomButton *scrollButton = [[MyCustomButton alloc] init];
    scrollButton.frame = CGRectMake(cgRectSize.size.width/3*2,0,cgRectSize.size.width/3*1,40);
    scrollButton.autoresizingMask =
        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [scrollButton setTitle:@"scroll" forState:UIControlStateNormal];
    [scrollButton addTarget:self
                    action:@selector(scrollButtonDidPush)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scrollButton];
    
    
    //リセットボタン（後で消すかも）
    resetButton = [[MyCustomButton alloc] init];
    resetButton.frame = CGRectMake(cgRectSize.size.width/3*1,0,cgRectSize.size.width/3*1,40);
    resetButton.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [resetButton setTitle:NSLocalizedString(@"KanpeViewResetButton", nil) forState:UIControlStateNormal];
    [resetButton addTarget:self
                     action:@selector(resetButtonDidPush)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    
    
    //スタートボタン
    startButton = [[MyCustomButton alloc] init];
    startButton.frame = CGRectMake(cgRectSize.size.width/2*0,60,cgRectSize.size.width/2*1,40);
    [startButton setTitle:NSLocalizedString(@"KanpeViewStartButton", nil) forState:UIControlStateNormal];
    [startButton addTarget:self
                    action:@selector(startButtonDidPush)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    //ストップボタン
    MyCustomButton *stopButton = [[MyCustomButton alloc] init];
    stopButton.frame = CGRectMake(cgRectSize.size.width/2*1,60,cgRectSize.size.width/2*1,40);
    [stopButton setTitle:NSLocalizedString(@"KanpeViewStopButton", nil) forState:UIControlStateNormal];
    [stopButton addTarget:self
                   action:@selector(stopButtonDidPush)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    
    //ストップウォッチ準備
    stopwatch = [[Stopwatch alloc] init];
    
}

- (void)updateUI:(NSTimer *)t
{
    NSTimeInterval second = stopwatch.second;
    NSString *s = [[NSString alloc] initWithFormat:@"%.2f", second];
    timerLabel.text = s;
    [s release];
}

- (void)startButtonDidPush {
    NSLog(@"startButtonDidPush");
    //timerLabel.text = @"55:55"; //こうやって表示を変える
    [stopwatch startStop];
    if (stopwatch.isStopwatchStart) {
        // START
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(updateUI:)
                                               userInfo:nil
                                                repeats:YES];
        [timer retain];
        [startButton setTitle:@"STOP" forState:UIControlStateNormal];
        
        resetButton.userInteractionEnabled = NO;
        resetButton.alpha = 0.5;

    }
    else {
        // STOP
        [timer invalidate];
        [timer release];
        [startButton setTitle:@"START" forState:UIControlStateNormal];
        
        resetButton.userInteractionEnabled = YES;
        resetButton.alpha = 1.0;
    }
}


- (void)stopButtonDidPush {
    NSLog(@"stopButtonDidPush");
}

- (void)resetButtonDidPush {
    NSLog(@"resetButtonDidPush");
    
    if (stopwatch.isStopwatchStart)
        return;
    
    [stopwatch reset];
    [self updateUI:nil];
    
}


- (void)scrollButtonDidPush {
    [self.navigationController popViewControllerAnimated:YES];
}

//
-(void)popover:(id)sender{
//-(IBAction)buttonClicked:(UIButton*)okButton
    
    //the view controller you want to present as popover
    //KanpeViewController *controller = [[KanpeViewController alloc] init];
    KanpeMenuViewController *controller = [[KanpeMenuViewController alloc] init];
    
    //our popover
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];

    //UIBarButtonへの対応
    //http://stackoverflow.com/questions/12017598/iphone-error-when-using-the-fppopover-class-when-using-it-with-a-uibarbuttonite?rq=1
    UIBarButtonItem *buttonItem = sender;
    UIView* btnView = [buttonItem valueForKey:@"view"];
    //On these cases is better to specify the arrow direction
    [popover setArrowDirection:FPPopoverArrowDirectionUp];
    [popover presentPopoverFromView:btnView];
    
    //the popover will be presented from the okButton view
    //[popover presentPopoverFromView:menuButton];
    
    //release
    [controller release];
}


/**
 * 秒を受け取り、「01:23」という時刻風表示に変換する
 * 例 NSString *result = [self makeClockStrFromSeconds:70.2];
 */
- (NSString *)makeClockStrFromSeconds:(double)second;  //戻り値がNSString型、引数がNSString型のメソッドを定義
{
    NSLog(@"引数:%f",second);
    int min = (int)second/60;
    int sec = (int)(second-min*60);
    return [NSString stringWithFormat:@"%d:%d", min,sec];;
    
}


@end


