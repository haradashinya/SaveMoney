//
//  Admob.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/27/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "Admob.h"
#import "GADBannerView.h"
#define AD_ID @"a1508ae2226b93d"

@implementation Admob
{

}


-(void)addAdmobOn:(UIViewController *)viewController
{
    
    GADBannerView *bannerView_;
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0,
                                            0.0,
                                            GAD_SIZE_320x50.width,
                                            GAD_SIZE_320x50.height)];
    bannerView_.adUnitID = AD_ID;
    
    
    GADRequest *request = [GADRequest request];
    request.testing = YES;
    [bannerView_ setRootViewController:viewController];
    
    [bannerView_ loadRequest:request];
    
    [viewController.view addSubview:bannerView_];
    
}
@end
