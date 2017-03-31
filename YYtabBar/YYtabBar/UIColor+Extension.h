//
//  UIColor+Extension.h
//  YYtabBar
//
//  Created by ios开发 on 2017/3/31.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString WithAddAlpha:(CGFloat) alphaAdd;

@end
