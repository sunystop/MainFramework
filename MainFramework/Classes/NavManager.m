//
//  NXBarManager.m
//  NCube
//
//  Created by kepuna on 2017/11/12.
//  Copyright © 2017年 junjie.liu. All rights reserved.
//

#import "NavManager.h"


#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

#define NavBackgroundColor RGB(248,248,248) //导航栏颜色
#define NavBottomLineColor RGB(178,178,178)
#define NavTitleColor RGB(73,73,73)

#define NavGlobalBackgroundColorKey @"NavGlobalBackgroundColorKey"
#define NavGlobalTitleFontSizeKey @"NavGlobalTitleFontSizeKey"
#define NavGlobalTitleColorKey @"NavGlobalTitleColorKey"
#define NavBottomLineColorKey @"NavBottomLineColorKey"
#define NavBackItemIconKey @"NavBackItemIconKey"
#define NavGlobalBackgroundImageKey @"NavGlobalBackgroundImageKey"

#define FontSize 18

@implementation NavManager

+ (UIColor *)navGlobalBackgroundColor {
    UIColor *color = [self getAndUnarchiverForKey:NavGlobalBackgroundColorKey];
    return color ? color : NavBackgroundColor;
}

+ (void)setNavGlobalBackgroundColor:(UIColor *)color {
    [self saveAndArchiveForKey:NavGlobalBackgroundColorKey value:color];
}

+ (void)setNavGlobalBackgroundImage:(NSString *)image {
    [self saveForKey:NavGlobalBackgroundImageKey value:image];
}

+ (UIImage *)navGlobalBackgroundImage {
    NSString *str = [self getForKey:NavGlobalBackgroundImageKey];
    if (str) {
        return [UIImage imageNamed:str];
    }
    return nil;
}

+ (void)setNavBottomLineColor:(UIColor *)color {
    [self saveAndArchiveForKey:NavBottomLineColorKey value:color];
}

+ (UIColor *)navBottomLineColor {
    UIColor *color = [self getAndUnarchiverForKey:NavBottomLineColorKey];
    return color ? color : NavBottomLineColor;
}

+ (void)removeNavGlobalBackgroundColor {
    
    UIColor *color = [self navGlobalBackgroundColor];
    if (color) {
        [self removeForKey:NavGlobalBackgroundColorKey];
    }
}

+ (CGFloat)navTitleFontSize {
    CGFloat fontSize = [[self getForKey:NavGlobalTitleFontSizeKey] floatValue];
    if (fontSize == 0) {
        fontSize = FontSize;
    }
    return fontSize;
}

+ (UIColor *)navTitleColor {
    UIColor *color = [self getAndUnarchiverForKey:NavGlobalTitleColorKey];
    return color ? color : NavTitleColor;
}

+ (void)setNavTitleFontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor {
    [self saveForKey:NavGlobalTitleFontSizeKey value:@(fontSize)];
    [self saveAndArchiveForKey:NavGlobalTitleColorKey value:titleColor];
}

+ (void)setNavGlobalBackIcon:(NSString *)icon {
    [self saveForKey:NavBackItemIconKey value:icon];
}

+ (UIImage *)navGlobalBackIcon {
    NSString *str = [self getForKey:NavBackItemIconKey];
    if (!str) {
         NSAssert(NO, @"请设置返回icon");
    }
    return [UIImage imageNamed:str];
}

+ (void)saveForKey:(NSString *)key value:(id)value{
    if (value) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void)saveAndArchiveForKey:(NSString *)key value:(id)value{
    if (value) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)getForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (id)getAndUnarchiverForKey:(NSString *)key {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (data) {
       id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
       return obj;
    }
    return nil;
}

+ (void)removeForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
