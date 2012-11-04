//
//  Drink.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/2/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "Drink.h"

@implementation Drink

//singleton
+(id)shared
{
    static Drink *drink;
    if (!drink){
        drink = [[Drink alloc] init];
        NSMutableDictionary *drip = [@{@"name" : @"Drip Coffee",@"price" : @3.0} mutableCopy];
        NSMutableDictionary *green = [@{@"name" : @"Green Tea",@"price" : @4.0} mutableCopy];
        NSMutableDictionary *cafe = [@{@"name" : @"Cafe late",@"price" : @3.5} mutableCopy];
        drink.types = [@[drip,green,cafe] mutableCopy];
    }
    return drink;
}

-(float)priceForCoffee:(NSString *)name
{
    float currentPrice;
    if ([name isEqual:@"Drip Coffee"]){
        currentPrice = 3.0;
    }else if ([name isEqual:@"Green Tea"]){
        currentPrice = 4.0;
    }else if ([name isEqual:@"Tea"]){
        currentPrice = 3.0;
    }else if ([name isEqual:@"Cafe late"]){
        currentPrice = 3.5;
    }
    return currentPrice;
}

-(void)performCreateWith:(NSString *)name
{
    NSString *uuid = [[User alloc] uuid];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/drinks/",BASE_URL,uuid]];
    
    NSLog(@"url is %@",[url description]);
    
    NSString *paramStr = [NSString stringWithFormat:@"price=%.2f&type=%@",[self priceForCoffee:name],name];
    
    
    NSData *params = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:params];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}



-(void)performTotalPrice
{
    NSString *uuid = [[User alloc] uuid];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/drinks/total_price/",BASE_URL,uuid]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"JSON is %@",[JSON valueForKey:@"total"]);
        self.totalPrice = [[JSON valueForKey:@"total"] floatValue];
        [self.delegate updateCurrentPriceLabel];
        NSLog(@"self.totalPrice is %f",self.totalPrice);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    
    
    
    [operation start];
    
}





-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"response is %@",[response  description]);
    // update total price
    [self performTotalPrice];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error %@",[error localizedDescription]);
}



@end
