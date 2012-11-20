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
    summaryButton = [[BButton alloc] initWithFrame:CGRectMake(0, 52, 320, 52)];
    summaryButton.color = [UIColor orangeColor];
    [summaryButton setTintColor:[UIColor yellowColor]];
    [summaryButton setTitle:@"Summary" forState:UIControlStateNormal];
    [self.view addSubview:summaryButton];
    
    [self addSummaryButton];
    Drink *drink = [Drink shared];
    
    NSString *uuid = [[User shared] uuid];
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/edit",uuid];
    self.url = [NSURL URLWithString:urlStr];
    
    self.webView = [[UIWebView alloc] init];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height + 50;
    
    CGRect webFrame = CGRectMake(0, 50 + 52, self.view.frame.size.width, self.view.frame.size.height - tabBarHeight - 52);
    
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
-(void)addSummaryButton
{

    
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
