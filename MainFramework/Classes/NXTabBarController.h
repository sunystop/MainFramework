//
//  NXTabBarController.h
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TabBarStyle) {
    TabBarStyleDefault, // 默认的系统
    TabBarStyleCenterIcon // 中间按钮的tabbar
};

@interface NXTabBarController : UITabBarController

+ (instancetype)sharedInstance;

- (void)addChildViewContoller:(UIViewController *)viewController title:(NSString *)title imageNormal:(NSString *)imageNormal imageSeleted:(NSString *)imageSeleted isRequiredNavigationController:(BOOL)isRequired;

- (void)setTabBarStyle:(TabBarStyle)style;
- (void)setTabBarCenterIcon:(NSString *)icon;
- (void)setTabBarGlobalBackgroundImage:(UIImage *)image;
- (void)setTabBarGlobalBackgroundColor:(UIColor *)color;
- (void)setTabBarTitleColorNormal:(UIColor *)colorNormal titleColorSelected:(UIColor *)colorSelected fontSize:(CGFloat)fontSize;
- (void)setTabBarTintColor:(UIColor *)color;

- (void)tabBarCenterIconClick:(void(^)())block;

@end
