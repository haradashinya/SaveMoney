//
//  User.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/28/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "User.h"
#define BASE_URL @"http://localhost:9393"

@implementation User
+(id)shared
{
    static User *user;
    if (!user){
        user = [User alloc];
    }
    return user;
}
- (NSString *)uuid {
    // Returns a UUID
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    if (![ud valueForKey:@"uuid"]){
        [ud setObject:uuidStr forKey:@"uuid"];
    }else{
        NSLog(@"uuid is already exist");
        [ud objectForKey:@"uuid"];
    }
    return [ud objectForKey:@"uuid"];
}



-(void)performRequest {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/",BASE_URL]];
    
    NSString *paramStr = [NSString stringWithFormat:@"uuid=%@",[self uuid]];
    NSData *params = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:params];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];

    NSLog(@"%@",[[request URL] description]);
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}





-(void)create
{
    [self performRequest];
}

-(void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSLog(@"ddd");
}



-(void)get
{
    
    NSURL *url = [NSURL URLWithString:BASE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@",JSON);
        NSLog(@"name is %@",[JSON valueForKeyPath:@"name"]);
        NSLog(@"%@",response);
        NSLog(@"success");
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    
    
    
    [operation start];
    
}

@end
