//
//  NXTabBarController.m
//  NCube
//
//  Created by kepuna on 2016/11/27.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "NXTabBarController.h"
#import "NXNavigationController.h"
#import "NXTabBar.h"
#import "UITabBar+badge.h"

@interface NXTabBarController ()

@property (nonatomic, strong) NXNavigationController *navigationVC;
@property (nonatomic, strong) NXTabBar *customTabBar;

@end


@implementation NXTabBarController

+ (instancetype)sharedInstance {
    static NXTabBarController *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[NXTabBarController alloc] init];
    });
    return _instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addChildViewContoller:(UIViewController *)viewController title:(NSString *)title imageNormal:(NSString *)imageNormal imageSeleted:(NSString *)imageSeleted isRequiredNavigationController:(BOOL)isRequired {
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:imageNormal] selectedImage:[UIImage imageNamed:imageSeleted]];
    
    if (isRequired) {
        NXNavigationController *nav = [[NXNavigationController alloc]initWithRootViewController:viewController];
        [self addChildViewController:nav];
    } else {
        [self addChildViewController:viewController];
    }
}

- (void)setTabBarTitleColorNormal:(UIColor *)colorNormal titleColorSelected:(UIColor *)colorSelected fontSize:(CGFloat)fontSize {

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName : colorNormal} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName : colorSelected} forState:UIControlStateSelected];
    
}

- (void)setTabBarTintColor:(UIColor *)color {
    [UITabBar appearance].tintColor = color;
}

- (void)setTabBarGlobalBackgroundImage:(UIImage *)image {
    [[UITabBar appearance] setBackgroundImage:image];
    [UITabBar appearance].translucent = NO;
}

- (void)setTabBarGlobalBackgroundColor:(UIColor *)color {
    [[UITabBar appearance] setBarTintColor:color];
    [UITabBar appearance].translucent = NO;
}

- (void)setTabBarStyle:(TabBarStyle)style {
    if (style == TabBarStyleCenterIcon) {
        [self setValue:self.customTabBar forKey:@"tabBar"];
    }
}

- (void)setTabBarCenterIcon:(NSString *)icon {
    [self.customTabBar setCenterImage:icon];
}

- (void)tabBarCenterIconClick:(void (^)())block {
    self.customTabBar.centerIconClickBlock = block;
}

#pragma mark - getters & settters
- (NXTabBar *)customTabBar {
    if (_customTabBar == nil) {
        _customTabBar = [[NXTabBar alloc]init];
    }
    return _customTabBar;
}

@end
