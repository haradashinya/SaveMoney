//
//  BBLabel.h
//  SaveMoney
//
//  Created by HARADA SHINYA on 11/20/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BBLabel : UILabel

- (UIColor *)lightenColor:(UIColor *)oldColor value:(float)value;
- (UIColor *)darkenColor:(UIColor *)oldColor value:(float)value;
- (BOOL)isLightColor:(UIColor *)color;


@end
