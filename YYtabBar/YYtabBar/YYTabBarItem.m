//
//  YYTabBarItem.m
//  YYtabBar
//
//  Created by ios开发 on 2017/3/30.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import "YYTabBarItem.h"
#import "UIImage+Extension.h"

#define kImageBiLi 0.7
#define itemFrame CGRectMake(0, 0, itemWH, itemWH)
#define distanceWithLableAndImageView 5

@implementation YYTabBarItem

+(YYTabBarItem *)getYYTabBarItemWithModel:(YYTabBarItemModel *)itemModel {
    YYTabBarItem *tabBarItem = [[YYTabBarItem alloc] init];
    [tabBarItem configItemWithItemModel:itemModel];
    return tabBarItem;
}

#pragma mark - 配置item的信息
- (void)configItemWithItemModel:(YYTabBarItemModel *)itemModel {
    if (itemModel.itemTitle != nil) {
        
        [self setTitle:itemModel.itemTitle forState:UIControlStateNormal];
    }
    
    if (itemModel.itemImageName != nil) {
        
        [self setImage:[UIImage imageNamed:itemModel.itemImageName] forState:UIControlStateNormal];
    }
}

#pragma mark - 设置小红圈里面的数字
-(void)setItemBadgeNumber:(NSInteger)number {
    if (number != 0) {
        if (self.badgeValueView.hidden) {
            self.badgeValueView.hidden = NO;
        }
        [self.badgeValueView setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self.badgeValueView setTitle:[NSString stringWithFormat:@"%ld",number] forState:UIControlStateNormal];
    }else {
        self.badgeValueView.hidden = YES;
    }
}

- (UIButton *)badgeValueView {
    if (_badgeValueView == nil) {
        CGFloat x = itemWH - badgeValueViewWH + 5;
        CGFloat y = -5;
        
        _badgeValueView = [[UIButton alloc] initWithFrame:CGRectMake(x, y, badgeValueViewWH, badgeValueViewWH)];
        _badgeValueView.backgroundColor = [UIColor redColor];
        _badgeValueView.titleLabel.font = badgeValueFont;
        [_badgeValueView setTitleColor:badgeValueColor forState:(UIControlStateNormal)];
        _badgeValueView.hidden = YES;
        _badgeValueView.userInteractionEnabled = NO;
        _badgeValueView.adjustsImageWhenHighlighted = NO;
        
    }
    return _badgeValueView;
}


-(void)setItemBadgeBackgroundStyle:(CGRect)badgetRect blurColor:(UIColor *)blurColor highLightColor:(UIColor *)highLightColor cornerRadius:(int)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(int)borderWidth {
    _badgeValueView.frame = badgetRect;
    _badgeValueView.layer.masksToBounds = YES;
    _badgeValueView.layer.cornerRadius = cornerRadius;
    _badgeValueView.layer.borderWidth = borderWidth;
    
    if (borderColor) {
        _badgeValueView.layer.borderColor = borderColor.CGColor;
    }
    if (blurColor) {
        [_badgeValueView setBackgroundImage:[UIImage ImageWithUIcolor:blurColor] forState:UIControlStateNormal];
    }
    if (highLightColor) {
        [_badgeValueView setBackgroundImage:[UIImage ImageWithUIcolor:highLightColor] forState:UIControlStateSelected];
    }
}



- (void)setItemBadgeFontStyle:(UIFont *)font blurColor:(UIColor *)blurColor highLightColor:(UIColor *)highLightColor {
    
    if (font) {
        _badgeValueView.titleLabel.font = font;
    }
    if (blurColor) {
        [_badgeValueView setTitleColor:blurColor forState:UIControlStateNormal];
    }
    if (highLightColor) {
        [_badgeValueView setTitleColor:highLightColor forState:UIControlStateSelected];
    }

}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置按钮文字颜色
        [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
        // 设置按钮文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 让图片按照原来的宽高比显示出来
        self.imageView.contentMode = UIViewContentModeBottom;
        // 设置按钮文字的字体
        self.titleLabel.font = itemTitleFont;
        // 设置按钮里面的内容（UILabel、UIImageView）居中
        // self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self addSubview:self.badgeValueView];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (_badgeValueView) {
        _badgeValueView.frame = CGRectMake(self.frame.size.width - 26, -5, 22, 16);
        _badgeValueView.layer.cornerRadius = 5;
        _badgeValueView.layer.borderWidth = 2;
        _badgeValueView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
}

#pragma mark - 重写Button的方法
//文字内容 的位置
- (CGRect) titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * (1 - kImageBiLi) - distanceWithLableAndImageView;
    CGFloat titleY = contentRect.size.height - titleHeight - 5;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

#pragma mark 控制UIImageView的位置和尺寸
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    //图片中不包含标题图片的位置
    CGFloat imageX = 0;
    CGFloat imageY = -20;
    CGFloat imageWidth = contentRect.size.width;
//    CGFloat imageHeight = contentRect.size.height * kImageBiLi;
    return CGRectMake(imageX, imageY, imageWidth, contentRect.size.height);
}





@end
