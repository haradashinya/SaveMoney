//
//  RankViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/27/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "RankViewController.h"

@interface RankViewController ()

@end

@implementation RankViewController
{
    UILabel *rankRabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self renderRankLabel];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)renderRankLabel
{
    rankRabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    rankRabel.text = @"Your rank";
    [rankRabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:rankRabel];
    
}

@end
