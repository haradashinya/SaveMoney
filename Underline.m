//
//  Underline.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/13/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "Underline.h"

@implementation Underline

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"called unerrline");
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 207.0f/255.0f, 91.0f/255.0f, 44.0f/255.0f, 1.0f); // RGBA
    CGContextSetLineWidth(ctx, 1.0f);
    
    CGContextMoveToPoint(ctx, 0, self.bounds.size.height - 1);
    CGContextAddLineToPoint(ctx, self.bounds.size.width, self.bounds.size.height - 1);
    
    CGContextStrokePath(ctx);
    
    [super drawRect:rect];
}


@end
