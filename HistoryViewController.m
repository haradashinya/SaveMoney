//
//  HistoryViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/13/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
{
    BButton *summaryButton;
    UIActivityIndicatorView *indicator;
    Boolean isFirst;
    
}


static id historyViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (!historyViewController){
        historyViewController = [super initWithNibName:(NSString *)nibBundleOrNil bundle:nibBundleOrNil];
        
        isFirst = YES;
        self.delegate = self;
    }
    return historyViewController;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    BButton *navButton = [[BButton alloc] initWithFrame:CGRectMake(0, 52, 340, 54)];
    navButton.color = [UIColor orangeColor];
    navButton.isAccessibilityElement = NO;
    navButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    [navButton setTitle:@"History" forState:UIControlStateNormal];
    [navButton setUserInteractionEnabled:NO];
    [self.view addSubview:navButton];
    
    summaryButton = [[BButton alloc] initWithFrame:CGRectMake(235,55,83,45)];
    summaryButton.layer.zPosition = 30.0f;
    [summaryButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    summaryButton.color = [UIColor orangeColor];
    [summaryButton setTintColor:[UIColor yellowColor]];
    [summaryButton setTitle:[Helper currentTime] forState:UIControlStateNormal];
    [summaryButton addTarget:self action:@selector(tappedSummaryButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:summaryButton];
    
    Drink *drink = [Drink shared];
    
    NSString *uuid = [[User shared] uuid];
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/edit",uuid];
    NSMutableURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];

    self.url = [NSURL URLWithString:urlStr];
    
    self.webView = [[UIWebView alloc] init];
    
    

    [self.webView loadRequest:request];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height + 50;
    
    CGRect webFrame = CGRectMake(0,50 + 52,self.view.frame.size.width, self.view.frame.size.height - tabBarHeight - 41);
    
    self.webView.frame = webFrame;
    self.webView.delegate = self;
    
    self.webView.layer.cornerRadius = 0;
    self.webView.scalesPageToFit = NO;
    self.webView.backgroundColor = [UIColor clearColor];

    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [self.webView setClipsToBounds:YES];
    [self.view addSubview:self.webView];
    drink.hvcDelegate = self;
    
    [[Admob alloc] addAdmobOn:self];
    


//    [self.view addSubview:self.webView];
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    
    if (isFirst == YES){
        indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.frame = CGRectMake(self.view.frame.size.width/2 - 50, (self.view.frame.size.height/2.0f - 50), 100,100);
        indicator.backgroundColor  = [UIColor blackColor];
        indicator.layer.cornerRadius = 5;
        indicator.layer.opacity = 0.8;
        [indicator startAnimating];
        [indicator setHidden:NO];
        [self.webView addSubview:indicator];
        isFirst = NO;
    }else {
        [indicator setHidden:YES];
        
    }
    
    
}
-(void)tappedSummaryButton:(id)sender
{
    SummaryViewController *svc = [[SummaryViewController alloc] init];
    [self presentViewController:svc animated:NO completion:nil];
}
-(void)saveAction:(id)sender
{
    NSLog(@"caleeld touch up");
}



-(void)didRefreshPage
{
    [Helper clearCache];
//    [self.webView stringByEvaluatingJavaScriptFromString:@"location.reload();"];
    [self.webView reload];
//    [self.webView stringByEvaluatingJavaScriptFromString:@"window.refresh();"];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error code is %i",[error code]);
    if ([error code] != -999){
        [indicator setHidden:YES];
    }
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator setHidden:YES];
    
}
-(void)tappedCloseButton:(id)sender
{
    
}
-(void)showIndicator
{
    [indicator setHidden:NO];
    
}
-(void)hideIndicator
{
    [indicator setHidden:YES];
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
