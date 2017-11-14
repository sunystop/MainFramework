//
//  MainFrameworkAPI.m
//  NCube
//
//  Created by kepuna on 2017/11/11.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import "MainFrameworkAPI.h"
#import "NavManager.h"

@implementation MainFrameworkAPI

+ (UITabBarController *)rootTabBarController {
    return [NXTabBarController sharedInstance];
}

+ (void)addChildViewContoller:(UIViewController *)viewController title:(NSString *)title imageNormal:(NSString *)imageNormal imageSeleted:(NSString *)imageSeleted isRequiredNavigationController:(BOOL)isRequired {
    
    [[NXTabBarController sharedInstance] addChildViewContoller:viewController title:title imageNormal:imageNormal imageSeleted:imageSeleted isRequiredNavigationController:isRequired];
}

+ (void)setTabBarStyle:(TabBarStyle)style {
    [[NXTabBarController sharedInstance] setTabBarStyle:style];
}

+ (void)setTabBarCenterIcon:(NSString *)icon {
    [[NXTabBarController sharedInstance] setTabBarCenterIcon:icon];
}

+ (void)tabBarCenterIconClick:(void (^)())block {
    [[NXTabBarController sharedInstance] tabBarCenterIconClick:block];
}

+ (void)setTabBarGlobalBackgroundImage:(UIImage *)image {
    [[NXTabBarController sharedInstance] setTabBarGlobalBackgroundImage:image];
}

+ (void)setTabBarGlobalBackgroundColor:(UIColor *)color {
    [[NXTabBarController sharedInstance] setTabBarGlobalBackgroundColor:color];
}

+ (void)setTabBarTintColor:(UIColor *)color {
    [[NXTabBarController sharedInstance] setTabBarTintColor:color];
}

+ (void)setTabBarTitleColorNormal:(UIColor *)colorNormal titleColorSelected:(UIColor *)colorSelected fontSize:(CGFloat)fontSize {
    [[NXTabBarController sharedInstance] setTabBarTitleColorNormal:colorNormal titleColorSelected:colorSelected fontSize:fontSize];
}

+ (void)setNavGlobalBackgroundImage:(NSString *)image {
    [NavManager setNavGlobalBackgroundImage:image];
}

+ (void)setNavGlobalBackgroundColor:(UIColor *)color {

    [NavManager setNavGlobalBackgroundColor:color];
}

+ (void)setNavGlobalTextColor:(UIColor *)color fontSize:(CGFloat)fontSize {
    [NavManager setNavTitleFontSize:fontSize titleColor:color];
}

+ (void)setNavGlobalBackIcon:(NSString *)icon {
    [NavManager setNavGlobalBackIcon:icon];
}

+ (void)setNavBottomLineColor:(UIColor *)color {
    [NavManager setNavBottomLineColor:color];
}

+ (void)removeNavGlobalBackgroundColor {
    [NavManager removeNavGlobalBackgroundColor];
}

@end
