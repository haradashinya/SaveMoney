//
//  User.h
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/28/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPClient.h>
#import <AFJSONRequestOperation.h>
#import <AFNetworking.h>


@protocol RankDelegate <NSObject>
@required
- (void)receivedRank;
@end

@interface User : NSObject <NSURLConnectionDelegate,NSURLConnectionDataDelegate>
@property int rank;
@property int total;
@property (nonatomic,strong) id <RankDelegate> delegate;
+(id)shared;
-(NSString *)uuid;
-(void)create;
-(void)getRank;
-(void)receivedRank;

@end
