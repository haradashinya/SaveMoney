//
//  SaveMoneyViewController.h
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/26/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drink.h"
#import "Admob.h"
#import <QuartzCore/QuartzCore.h>
#import  "EditDrinkView.h"
#import "Helper.h"
#import "EditDrinkViewController.h"

@interface SaveMoneyViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) NSMutableDictionary *currentCoffee;


@end
