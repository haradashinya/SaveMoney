//
//  SummaryViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/20/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
{
    UIWebView *webView;
}

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
    [[Admob alloc] addAdmobOn:self];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addCloseButton];
    
	// Do any additional setup after loading the view.
}

-(void)addCloseButton
{
    BButton *closeButton = [[BButton alloc] initWithFrame:CGRectMake(-10,50,340, 50)];
    [closeButton setTitle:@"Tap to Close" forState:UIControlStateNormal];
    closeButton.color = [UIColor orangeColor];
    closeButton.tintColor = [UIColor yellowColor];
    [self.view addSubview:closeButton];
    
    [closeButton addTarget:self action:@selector(tapppedCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void)tapppedCloseButton:(id)sender
{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
