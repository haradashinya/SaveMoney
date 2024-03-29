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
    
    Boolean isFirst;
    UIWebView *webView;
    UIActivityIndicatorView *indicator;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isFirst = YES;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addNavButton];
    [self addCloseAndAllButton];
    [self addSummaryView];
	// Do any additional setup after loading the view.
}
-(void)addSummaryView
{
    
    [Helper clearCache];
    NSString *uuid = [[User shared] uuid];
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/summary",uuid];
    
    webView =  [[UIWebView alloc] initWithFrame:CGRectMake(0,50, self.view.frame.size.width, self.view.frame.size.height - 48)];
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    [webView setBackgroundColor:[UIColor clearColor]];
    webView.scalesPageToFit = NO;
    
    if (isFirst == YES){
        indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.frame = CGRectMake(self.view.frame.size.width/2 - 50, (self.view.frame.size.height/2.0f - 50), 100,100);
        indicator.backgroundColor  = [UIColor blackColor];
        indicator.layer.cornerRadius = 5;
        indicator.layer.opacity = 0.8;
        [indicator startAnimating];
        [webView addSubview:indicator];
        isFirst = NO;
    }else {
        [indicator setHidden:YES];
        
    }
    [self.view addSubview:webView];
    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *url = [[request URL] absoluteString];
    NSArray *action = [url componentsSeparatedByString: @":"][1];
    if ([action isEqual:@"//showIndicator"]){
        if ([indicator isHidden]){
            [indicator setHidden:NO];
            
        }
        return NO;
    }else if ([action isEqual:@"//hideIndicator"]){
        if (![indicator isHidden]){
            [indicator setHidden:YES];
            
        }
        
        return NO;
    }
    return YES;
}



-(void)addCloseAndAllButton
{
    
    BButton *closeButton = [[BButton alloc] initWithFrame:CGRectMake(242,5,73, 42)];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    closeButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    closeButton.color = [UIColor orangeColor];
    closeButton.tintColor = [UIColor yellowColor];
    [self.view addSubview:closeButton];
    [closeButton addTarget:self action:@selector(tappedCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)addNavButton
{
    BButton *navButton = [[BButton alloc] initWithFrame:CGRectMake(0,0, 340, 54)];
    navButton.color = [UIColor orangeColor];
    navButton.isAccessibilityElement = NO;
    navButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    [navButton setTitle:@"Summary" forState:UIControlStateNormal];
    [navButton setUserInteractionEnabled:NO];
    [self.view addSubview:navButton];
}
-(void)tappedCloseButton:(id)sender
{
    
    [Helper clearCache];
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
