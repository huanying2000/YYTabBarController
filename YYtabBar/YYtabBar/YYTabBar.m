//
//  YYTabBar.m
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import "YYTabBar.h"

#define distance 0 //第一个和最后一个item距离屏幕边界的距离
#define itemY 0  //item在tabBar 里面的纵坐标

#define YYTabBarSize CGSizeMake(MainScreenBoundsSize.width, tabBarHeight)
#define YYTabBarOrigin CGPointMake(0, MainScreenBoundsSize.height - MALTabBarSize.height)
#define YYSelectNumDefault -1

@implementation YYTabBar {
    float _itemDisTance;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _theTabBarHeight = 0;
        _tabBarSize = CGSizeMake(MainScreenBoundsSize.width, _theTabBarHeight);
        _tabBarOrigin = CGPointMake(0, MainScreenBoundsSize.height - _tabBarSize.height);
        self.layer.zPosition = 1;
    }
    return self;
}
- (NSMutableArray *)items {
    if (_items == nil) {
        
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

+(YYTabBar *)getYYTabBarWithItemModels:(NSArray *)itemModels defaultSelectedIndex:(NSInteger)defaultSelectedIndex parentSize:(CGSize)parentSize tabBarHight:(CGFloat)theTabarHeight {
    YYTabBar *tabbar;
    if (theTabarHeight > 0) {
        //如果传过来的数字 大于0 就根据传过来的数字设置高度 否则设置和原生一样的高度
        tabbar = [[YYTabBar alloc] initWithFrame:CGRectMake(0, parentSize.height - theTabarHeight, YYTabBarSize.width, theTabarHeight)];
    }else {
        tabbar = [[YYTabBar alloc] initWithFrame:CGRectMake(0, parentSize.height - YYTabBarSize.height, YYTabBarSize.width, YYTabBarSize.height)];
    }
    tabbar.itemArray = itemModels;
    [tabbar setUpViews];
    //设置默认选中的情况
    [tabbar selectdefaultItem:defaultSelectedIndex];
    return tabbar;
}
#pragma mark - 设置默认选项
- (void)selectdefaultItem:(NSInteger)defaultSelectedItemIndex {
    _currentSelectedIndex = defaultSelectedItemIndex;
    _lastSelectedIndex = defaultSelectedItemIndex;
    [self setSelectedItemStatus:YYSelectNumDefault];
}
#pragma mark - 设置选中item状态的样式
- (void)setSelectedItemStatus:(NSInteger)selectNum {
    if (selectNum == YYSelectNumDefault) {
        
        selectNum = _currentSelectedIndex;
    }
    
    //去除选中状态下的model
    YYTabBarItemModel *itemModel = [self.itemArray objectAtIndex:selectNum];
    YYTabBarItem *currentSelecteditem = [self.items objectAtIndex:selectNum];
    
    [currentSelecteditem setTitleColor:selectedItemTitleColor forState:(UIControlStateNormal)];
    if (itemModel.selectedItemImageName != nil) {
        
        [currentSelecteditem setImage:[UIImage imageNamed:itemModel.selectedItemImageName] forState:(UIControlStateNormal)];
    }
    
    if (currentSelecteditem.badgeValueView) {
        [currentSelecteditem.badgeValueView setSelected:YES];
    }

}


#pragma mark - 设置items
- (void)setUpViews {
    NSInteger itemCount = [self.itemArray count];
    if (_tabBarSize.height > 0) {
        _itemDisTance = (YYTabBarSize.width * distance - itemCount * itemWH) / (itemCount - 1);
        
    } else {
        _itemDisTance = (YYTabBarSize.width * distance - itemCount * itemWH) / (itemCount - 1);
    }
    
    for (NSInteger itemIndex = 0; itemIndex < itemCount; itemIndex++) {
        float oneWidth = 1.0 * self.frame.size.width / itemCount;
        YYTabBarItemModel *itemModel = [self.itemArray objectAtIndex:itemIndex];
        itemModel.itemIndex = itemIndex;
        YYTabBarItem *item = [YYTabBarItem getYYTabBarItemWithModel:itemModel];
        item.tag = itemIndex;
        [item addTarget:self action:@selector(selectItem:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [item setFrame:CGRectMake(oneWidth * itemIndex, 0, oneWidth + 3, self.frame.size.height)];
        [self addSubview:item];
        [self.items addObject:item];
        
        
    }

}


#pragma mark - itemClickEvent 
- (void)selectItem:(UIButton *)item {
    [self selectedItemAtIndex:item.tag];
}

- (void)selectedItemAtIndex:(NSInteger)itemIndex {
    if (itemIndex == _currentSelectedIndex) {
        return;
    }
    YYTabBarItemModel *itemModel = [self.itemArray objectAtIndex:itemIndex];
    _lastSelectedIndex = _currentSelectedIndex;
    _currentSelectedIndex = itemIndex;
    [self setSelectedItemStatus:YYSelectNumDefault];
    [self setLastSelectedItemStatus:YYSelectNumDefault];
    
    if ([self.delegate respondsToSelector:@selector(selectItem:)]) {
        [self.delegate selectedItem:itemModel];
    }
    
}

#pragma mark - 设置上一个被选中的item的样式
- (void)setLastSelectedItemStatus:(NSInteger)selectNum {
    if (selectNum == YYSelectNumDefault) {
        selectNum = _lastSelectedIndex;
    }
    YYTabBarItemModel *itemModel = [self.itemArray objectAtIndex:selectNum];
    YYTabBarItem *lastSelectedItem = [self.items objectAtIndex:selectNum];
    [lastSelectedItem setTitleColor:itemTitleColor forState:(UIControlStateNormal)];
    if (itemModel.itemImageName != nil) {
        
        [lastSelectedItem setImage:[UIImage imageNamed:itemModel.itemImageName] forState:(UIControlStateNormal)];
    }
    
    if (lastSelectedItem.badgeValueView) {
        [lastSelectedItem.badgeValueView setSelected:NO];
    }
}

- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber {
    YYTabBarItem *item = [self.items objectAtIndex:itemIndex];
    [item setItemBadgeNumber:badgeNumber];
}

- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber badgetRect:(CGRect)badgetRect{
    YYTabBarItem *item = [self.items objectAtIndex:itemIndex];
    item.badgeValueView.frame = badgetRect;
    [item setItemBadgeNumber:badgeNumber];
}



@end
