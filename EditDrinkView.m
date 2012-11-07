//
//  EditDrinkView.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/6/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "EditDrinkView.h"

@implementation EditDrinkView
{
    UIWebView *webView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *uuid = [[User shared] uuid];
        NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/edit",uuid];
        
        webView =  [[UIWebView alloc] initWithFrame:self.bounds];
        webView.scalesPageToFit = NO;
        
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
        
        [self addSubview:webView];
        
    }
    return self;
}

-(UIView *)view
{
    return webView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
