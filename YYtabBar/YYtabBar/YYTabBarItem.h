//
//  YYTabBarItem.h
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYTabBarItemModel.h"
#import "UIColor+Extension.h"

#define itemWH 49                                                 //tabBar里按钮的大小
#define itemTitleColor [UIColor blackColor]                       //item里标题默认颜色
#define selectedItemTitleColor [UIColor colorWithHexString:@"ff6700"]// item被选中时标题的颜色
#define itemTitleFont [UIFont systemFontOfSize:10]                 //item 标题 字体font
#define badgeValueFont [UIFont systemFontOfSize:10]               //小红圈里字体的大小
#define badgeValueColor [UIColor whiteColor]                      //小红圈里字体的颜色
#define badgeValueViewWH itemWH * 0.4                             //小红圈的大小

@interface YYTabBarItem : UIButton

@property (nonatomic,strong) UIButton *badgeValueView;

+(YYTabBarItem *)getYYTabBarItemWithModel:(YYTabBarItemModel *)itemModel;

- (void)setItemBadgeNumber:(NSInteger)number;

- (void)setItemBadgeBackgroundStyle:(CGRect)badgetRect blurColor:(UIColor *)blurColor highLightColor:(UIColor *)highLightColor cornerRadius:(int)cornerRadius borderColor:(UIColor*)borderColor borderWidth:(int)borderWidth;
- (void)setItemBadgeFontStyle:(UIFont *)font blurColor:(UIColor *)blurColor highLightColor:(UIColor *)highLightColor;

@end
