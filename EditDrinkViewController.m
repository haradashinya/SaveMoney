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
    webView =  [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.scalesPageToFit = NO;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.co.jp"]]];

    [self.view addSubview:webView];

	// Do any additional setup after loading the view.
}
-(void)close
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
