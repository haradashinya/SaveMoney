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
    
}


static id historyViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (!historyViewController){
        historyViewController = [super initWithNibName:(NSString *)nibBundleOrNil bundle:nibBundleOrNil];
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
    [summaryButton setTitle:@"Summary" forState:UIControlStateNormal];
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
    
    CGRect webFrame = CGRectMake(0,50 + 52, self.view.frame.size.width, self.view.frame.size.height - tabBarHeight - 41);
    
    self.webView.frame = webFrame;
    
    self.webView.layer.cornerRadius = 0;
    self.webView.scalesPageToFit = NO;
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    drink.hvcDelegate = self;
    
    [[Admob alloc] addAdmobOn:self];
    


    [self.view addSubview:self.webView];
	// Do any additional setup after loading the view.
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
    [self.webView stringByEvaluatingJavaScriptFromString:@"location.reload()"];

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"erorororoororoor");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finished load");
}
-(void)tappedCloseButton:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
