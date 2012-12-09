//
//  KanpeMenuViewController.m
//  PresenKanpe
//
//  Created by tattyamm on 2012/12/09.
//  Copyright (c) 2012年 tattyamm. All rights reserved.
//

#import "KanpeMenuViewController.h"

@interface KanpeMenuViewController ()

@end

@implementation KanpeMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //viewの設定
    self.view.backgroundColor = [UIColor whiteColor];
    
    //ボタン
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button1 setTitle:@"Reset" forState:UIControlStateNormal];
	[button1 sizeToFit];
	button1.frame = CGRectMake(0,50,100,30);
	[self.view addSubview:button1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
