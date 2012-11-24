//
//  KanpeViewController.m
//  PresenKanpe
//
//  Created by entatsu on 2012/11/11.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "KanpeViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation KanpeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewの設定
    self.view.backgroundColor = [UIColor blackColor];
    
    //画面サイズ取得
    CGRect cgRectSize = [[UIScreen mainScreen] bounds]; //cgRectSize.size.widthで取得
    
    //ラベル
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"kanpe view";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    //カンペ文表示
    UITextView* textView = [[[UITextView alloc] init] autorelease];
    textView.frame = CGRectMake(0,100,cgRectSize.size.width,300);
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.editable = NO; //編集不可
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:32];
    textView.text = @"実は好奇心のゆえに、しかれども予は予が画師たるを利器として、ともかくも口実を設けつつ、予と兄弟もただならざる医学士高峰をしいて、某の日東京府下の一病院において、渠が刀を下すべき、貴船伯爵夫人の手術をば予をして見せしむることを余儀なくしたり。\nその日午前九時過ぐるころ家を出でて病院に腕車を飛ばしつ。";
    [self.view addSubview:textView];
    
    //ボタン
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"画面遷移" forState:UIControlStateNormal];
    button.frame = CGRectMake(cgRectSize.size.width/3*2,0,cgRectSize.size.width/3*1,40);
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


