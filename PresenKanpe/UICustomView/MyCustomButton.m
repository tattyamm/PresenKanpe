//
//  MyCustomButton.m
//  PresenKanpe
//
//  Created by entatsu on 2012/11/24.
//  Copyright (c) 2012年 entatsu. All rights reserved.
//

#import "MyCustomButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyCustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 * Only override drawRect: if you perform custom drawing.
 * An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSLog(@"MyCustomButton drawRect");
    
    //UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [[self layer] setCornerRadius:20.0f];
    [[self layer] setMasksToBounds:YES];
    [[self layer] setBorderWidth:2.0f];

    //ボタンタップ時の設定
    UIColor *backColor = [UIColor blackColor];
    UIColor *borderColor = [UIColor whiteColor];

    if (self.state && (UIControlStateSelected || UIControlStateHighlighted)) {
        backColor = [UIColor whiteColor];
        borderColor = [UIColor blackColor];
    }else{
        backColor = [UIColor blackColor];
        borderColor = [UIColor whiteColor];
    }
    [[self layer] setBackgroundColor:[backColor CGColor]];  // forState:UIControlStateNormalではだめ。
    [[self layer] setBorderColor:[borderColor CGColor]];
    
    /* 自分で書く必要がある部分
    [button setTitle:@"ボタン" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonDidPush)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0,cgRectSize.size.height-navBarHeight-BUTTON_HEIGHT
                              ,cgRectSize.size.width,BUTTON_HEIGHT);
    [self.view addSubview:button];
     */
    
}

@end
