//
//  YYTabBarItemModel.m
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import "YYTabBarItemModel.h"

@implementation YYTabBarItemModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %@", self.controllerName, self.itemTitle, self.itemImageName];
}

-(YYTabBarItemModel *)initYYTabBarItemModelWithTitle:(NSString *)itemTitle itemImageName:(NSString *)itemImageName controllerName:(NSString *)controllerName selectedItemImageName:(NSString *)selectedItemImageName {
    self = [super init];
    
    if (self) {
        self.itemTitle = itemTitle;
        self.controllerName = controllerName;
        self.itemImageName = itemImageName;
        self.selectedItemImageName = selectedItemImageName;
    }
    return self;
}

@end
