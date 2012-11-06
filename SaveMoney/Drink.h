//
//  Drink.h
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/2/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Helper.h"
#define BASE_URL @"http://localhost:9393"

@interface Drink : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property (nonatomic,strong) NSMutableArray *types;
@property  float totalPrice;
@property id delegate;
+(id)shared;
-(float)priceForCoffee:(NSString *)name;
-(void)performCreateWith:(NSString *)name;
-(void)create;
-(void)performTotalPrice;

-(void)updateCurrentPriceLabel;
@end
