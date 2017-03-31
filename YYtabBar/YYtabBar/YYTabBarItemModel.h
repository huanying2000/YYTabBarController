//
//  YYTabBarItemModel.h
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYTabBarItemModel : NSObject

@property (nonatomic,assign) NSInteger itemIndex;

@property (nonatomic, copy) NSString *controllerName;        //item 对应控制器类名
@property (nonatomic, copy) NSString *itemImageName;         // item 对应图片名称(未选中状态)
@property (nonatomic, copy) NSString *itemTitle;             // item 对应标题
@property (nonatomic, copy) NSString *selectedItemImageName; //item 选中状态下图片名

- (YYTabBarItemModel *)initYYTabBarItemModelWithTitle:(NSString *)itemTitle itemImageName:(NSString *)itemImageName controllerName:(NSString *)controllerName selectedItemImageName:(NSString *)selectedItemImageName;

@end
