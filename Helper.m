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

@end
