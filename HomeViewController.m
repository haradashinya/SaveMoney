//
//  HomeViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/27/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "HomeViewController.h"
#import "User.h"
#import "Drink.h"


@interface HomeViewController ()
@end

@implementation HomeViewController
{
    User *user;
    Drink *drink;
    
    
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

    [[Admob alloc] addAdmobOn:self];
    
    user = [User shared];
    drink = [Drink shared];
    [user create];
    [drink performTotalPrice];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
