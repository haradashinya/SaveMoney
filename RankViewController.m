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
    User *user;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        user = [User shared];
        [user setDelegate:self];
        // Custom initialization
    }
    return self;
}
// get /rank/ accesss when view appear.
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"appear!");
    [user getRank];
}

// handle received self.received
-(void)receivedRank
{
    NSLog(@"successs!");
    NSLog(@"%i",user.rank);
}

- (void)viewDidLoad
{
    
    [[Helper alloc] putBackgroundOn:self.view];
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
    rankRabel.backgroundColor = [UIColor clearColor];
    rankRabel.text = @"Your rank";

    [rankRabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:rankRabel];
    
    
}

@end
