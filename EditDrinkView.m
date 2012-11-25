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
    UIButton *closeButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *uuid = [[User shared] uuid];
        NSString *urlStr = [NSString stringWithFormat:@"http://localhost:9393#users/%@/drinks/edit",uuid];
        self.webView =  [[UIWebView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + 50, self.frame.size.width, self.frame.size.height - 50)];
        self.webView.scalesPageToFit = NO;
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
        closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        closeButton.frame = CGRectMake(0, 0,320,50);
        closeButton.backgroundColor = [UIColor blackColor];
        [closeButton setTitle:@"close" forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(tappedCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];
        [self addSubview:self.webView];
        
        
    }
    return self;
}
-(void)tappedCloseButton:(id)sender
{
    [self.webView removeFromSuperview];
    [closeButton removeFromSuperview];
}

-(UIView *)view
{
    return self.webView;
}


@end
