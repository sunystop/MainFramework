//
//  MainFrameworkAPI.h
//  NCube
//
//  Created by kepuna on 2017/11/11.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXTabBarController.h"

@interface MainFrameworkAPI : NSObject

/**
 获取根控制器

 @return rootTabBarController
 */
+ (UITabBarController *)rootTabBarController;


/**
 添加子控制器

 @param viewController 子控制器
 @param title 标题
 @param imageNormal 普通状态图标
 @param imageSeleted 选中状态图标
 @param isRequired 是否需要导航控制器
 */
+ (void)addChildViewContoller:(UIViewController *)viewController title:(NSString *)title imageNormal:(NSString *)imageNormal imageSeleted:(NSString *)imageSeleted isRequiredNavigationController:(BOOL)isRequired;


/**
 设置tabbar的style （默认是系统的）

 @param style 样式
 */
+ (void)setTabBarStyle:(TabBarStyle)style;

/**
 设置tabbar中间的icon（TabBarStyleCenterIcon 样式）

 @param icon icon
 */
+ (void)setTabBarCenterIcon:(NSString *)icon;

/**
 设置tabbar中间icon的事件回调

 @param block 回调处理block
 */
+ (void)tabBarCenterIconClick:(void(^)())block;

/**
 设置tabbar全局的背景图片

 @param image 背景图片
 */
+ (void)setTabBarGlobalBackgroundImage:(UIImage *)image;

/**
 设置tabbar全局的背景颜色

 @param color 背景颜色
 */
+ (void)setTabBarGlobalBackgroundColor:(UIColor *)color;

/**
 设置tabbar图标和选中文字的颜色

 @param color 颜色
 */
+ (void)setTabBarTintColor:(UIColor *)color;

/**
 设置tabbar文字的颜色和大小（不设置使用系统默认的颜色）

 @param colorNormal 普通状态文字颜色
 @param colorSelected 选中状态文字颜色
 @param fontSize 文字大小
 */
+ (void)setTabBarTitleColorNormal:(UIColor *)colorNormal titleColorSelected:(UIColor *)colorSelected fontSize:(CGFloat)fontSize;

/**
 设置导航栏全局的背景图片

 @param image 图片
 */
+ (void)setNavGlobalBackgroundImage:(NSString *)image;

/**
 设置导航栏全局的背景颜色 (不设置默认是系统的颜色)

 @param color 背景颜色
 */
+ (void)setNavGlobalBackgroundColor:(UIColor *)color;

/**
 设置导航栏title的文字颜色和大小

 @param color 文字颜色
 @param fontSize 文字大小
 */
+ (void)setNavGlobalTextColor:(UIColor *)color fontSize:(CGFloat)fontSize;

/**
 设置导航栏返回按钮图标

 @param icon 返回图标
 */
+ (void)setNavGlobalBackIcon:(NSString *)icon;

/**
 设置导航栏底线的颜色

 @param color 颜色
 */
+ (void)setNavBottomLineColor:(UIColor *)color;

/**
 清除导航栏全局的背景颜色
 */
+ (void)removeNavGlobalBackgroundColor;

@end
