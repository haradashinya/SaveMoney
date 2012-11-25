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
    [self addSummaryView];
    
    
    

    
	// Do any additional setup after loading the view.
}
-(void)addSummaryView
{
    
    NSString *uuid = [[User shared] uuid];
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/summary",uuid];
    
    webView =  [[UIWebView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height - 50)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    [webView setBackgroundColor:[UIColor clearColor]];
    webView.scalesPageToFit = NO;
    [self.view addSubview:webView];
    
}

-(void)addCloseButton
{
    BButton *closeButton = [[BButton alloc] initWithFrame:CGRectMake(-10,50,340, 50)];
    [closeButton setTitle:@"Tap to Close" forState:UIControlStateNormal];
    closeButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
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
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finished load");
}

@end
