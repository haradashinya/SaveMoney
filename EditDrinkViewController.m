//
//  EditDrinkViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/6/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "EditDrinkViewController.h"

@interface EditDrinkViewController ()

@end

@implementation EditDrinkViewController
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

    [self.view addSubview:webView];
    NSString *uuid = [[User shared] uuid];
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/edit",uuid];
    webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height);
    webView.layer.cornerRadius = 0;
    webView.scalesPageToFit = NO;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(-10,10,self.view.frame.size.width + 20,50);
    [closeButton setTitle:@"close" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(tappedCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view addSubview:closeButton];
    [self.view addSubview:webView];
}

-(void)tappedCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
    NSLog(@"ffff");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"url is %@",[request description]);
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
