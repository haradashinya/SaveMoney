//
//  Helper.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/5/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "Helper.h"

@implementation Helper

-(void)putBackgroundOn:(UIView *)view
{
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [view addSubview:background];
    [view sendSubviewToBack:background];
    view.layer.zPosition = -100;

    }


-(void)showNetWorkErrorAlertView
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"It happened network error." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 70.0);
    [myAlertView setTransform:myTransform];
    [myAlertView show];
}
-(void)showNoDrinkError
{
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There's no Drinks." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 70.0);
    [myAlertView setTransform:myTransform];
    [myAlertView show];
    
}

+(Boolean )isIphone5
{
    float height = [[UIScreen mainScreen] bounds].size.height ;
    if (height < 500.0){
        return NO;
    }else{
        return YES;
    }
}

+(void)clearCache
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

@end
