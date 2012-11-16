//
//  MainViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/25/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
{
    GADBannerView *bannerView_;


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100,30);
    [btn setTitle:@"Save" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushedSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view addSubview:btn];
    
    
    HistoryViewController *hvc = [[HistoryViewController alloc] init];
    hvc.title = @"Edit";
    SaveMoneyViewController *svc = [[SaveMoneyViewController alloc] init];
    svc.title = @"Save";
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.title = @"Detail";
    
    UITabBarController *tabBarController;
    tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    tabBarController.viewControllers = @[svc,hvc,dvc];
    tabBarController.delegate =self;

    [self.navigationController pushViewController:tabBarController animated:YES];
    
    

    
    
    
    
    

}






@end
