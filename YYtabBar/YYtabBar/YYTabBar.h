//
//  YYTabBar.h
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYTabBarItem.h"

#define MainScreenBoundsSize [UIScreen mainScreen].bounds.size
#define tabBarHeight 44 //tabBar的高度

@protocol YYTabBarDelegate <NSObject>

@optional

- (void)selectedItem:(YYTabBarItemModel *)selectedItemModel;
- (BOOL)respondsToSelf:(YYTabBarItemModel *)selectedItemModel;

@end

@interface YYTabBar : UIView {
    
    NSMutableArray *_items;
    
}

@property (nonatomic,assign) CGSize tabBarSize;

@property (nonatomic,assign) CGPoint tabBarOrigin;

@property (nonatomic,assign) CGFloat theTabBarHeight;

@property (nonatomic,strong) NSArray *itemArray;

@property (nonatomic,weak) id<YYTabBarDelegate> delegate;

@property (nonatomic,assign,readonly) NSInteger currentSelectedIndex;

@property (nonatomic,assign,readonly) NSInteger lastSelectedIndex;

@property (nonatomic,readonly) NSMutableArray *items;


+ (YYTabBar *)getYYTabBarWithItemModels:(NSArray *)itemModels defaultSelectedIndex:(NSInteger)defaultSelectedIndex parentSize:(CGSize)parentSize tabBarHight:(CGFloat)theTabarHeight;
- (void)selectedItemAtIndex:(NSInteger)itemIndex;
- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber;
- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber badgetRect:(CGRect)badgetRect;

@end
