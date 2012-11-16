//
//  DetailViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/16/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[Admob alloc] addAdmobOn:self];
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithInt:3], @"0",
                          [NSNumber numberWithInt:40], @"1",
                          [NSNumber numberWithInt:20], @"2",
                          [NSNumber numberWithInt:56], @"3",
                          [NSNumber numberWithInt:70], @"4",
                          [NSNumber numberWithInt:34], @"5",
                          [NSNumber numberWithInt:43], @"6",
                          nil];
    
    DSBarChart *chart = [[DSBarChart alloc] initWithFrame:self.view.bounds color:[UIColor redColor] andDictionary:dict];
    chart.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    chart.bounds = self.view.bounds;
    chart.backgroundColor = [UIColor clearColor];
    [self.view addSubview:chart];
    
    
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
