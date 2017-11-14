//
//  NavigationView.h
//  NavDemo
//
//  Created by kepuna on 2017/11/2.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationView : UIView

/**
 init method
 */
+ (instancetype)nav:(void (^)(NavigationView *nav))initBlock;

/**
 nav添加到视图并设置target控制器
 */
- (NavigationView *(^)(UIView *view, UIViewController *target))addInViewAndTarget;

/**
 导航的title
 */
- (NavigationView *(^)(NSString *value))title;

/**
 * 设置nav右边item用image
 */
- (NavigationView *(^)(NSString *value))rightItemWithImage;

/**
 * 设置nav右边item用文字
 */
- (NavigationView *(^)(NSString *value))rightItemWithTitle;

/**
 设置右边icon的targe和action方法
 */
- (NavigationView *(^)(id target, SEL action ))rightItemTargetAction;

/**
 更新返回图标
 */
- (NavigationView *(^)(NSString *value))updateBackItemWithImage;

/**
 更新返回用文字
 */
- (NavigationView *(^)(NSString *value))updateBackItemWithTitle;

/**
 自定义leftView
 */
- (NavigationView *(^)(UIView *view, CGRect frame))customLeftView;
- (NavigationView *(^)(UIView *view, CGRect frame))customRightView;

/**
 是否隐藏返回按钮 (默认为NO)
 */
- (NavigationView *(^)(BOOL))isHideBackIcon;

/**
 * 是否隐藏导航条下面的线
 */
- (NavigationView *(^)(BOOL))isHideBottomLine;

+ (CGFloat)height;

@end
