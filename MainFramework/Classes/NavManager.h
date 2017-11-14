//
//  NXBarManager.h
//  NCube
//
//  Created by kepuna on 2017/11/12.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavManager : NSObject

+ (UIColor *)navGlobalBackgroundColor;
+ (CGFloat)navTitleFontSize;
+ (UIColor *)navTitleColor;
+ (UIColor *)navBottomLineColor;
+ (UIImage *)navGlobalBackIcon;
+ (UIImage *)navGlobalBackgroundImage;
+ (void)setNavGlobalBackgroundImage:(NSString *)image;
+ (void)setNavGlobalBackgroundColor:(UIColor *)color;
+ (void)setNavBottomLineColor:(UIColor *)color;
+ (void)setNavTitleFontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;
+ (void)setNavGlobalBackIcon:(NSString *)icon;
+ (void)removeNavGlobalBackgroundColor;

@end
