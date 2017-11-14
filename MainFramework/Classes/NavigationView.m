//
//  NavigationView.m
//  NavDemo
//
//  Created by kepuna on 2017/11/2.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import "NavigationView.h"
#import "NavManager.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScale  ScreenWidth/375.0

CGFloat const NavigationViewLineViewHeight = 0.5;
CGFloat const NavigationViewHeight = 64;

@interface NavigationView ()

@property (nonatomic, weak) UIViewController *targetVC;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *rightItemBtn;
@property (nonatomic, strong) UIButton *backItemBtn;

@end

@implementation NavigationView

+ (void)setNavGlobalBackgroundColor:(UIColor *)color {
    [[self alloc] setBackgroundColor:color];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor =  [NavManager navGlobalBackgroundColor];        [self addSubview:self.titleLabel];
        
        UIImage *img = [NavManager navGlobalBackgroundImage];
        if (img) {
            self.backgroundColor = [UIColor colorWithPatternImage:[NavManager navGlobalBackgroundImage]];
        }
        
        [self addSubview:self.lineView];
        [self addSubview:self.rightItemBtn];
        [self addSubview:self.backItemBtn];
    }
    return self;
}

+ (instancetype)nav:(void (^)(NavigationView *))initBlock {
    NavigationView *navView = [[NavigationView alloc]init];
    if (initBlock) {
        initBlock(navView);
    }
    return navView;
}

- (NavigationView *(^)(UIView *, UIViewController *))addInViewAndTarget {
    return ^NavigationView *(UIView *view, UIViewController *target) {
        [view addSubview:self];
        self.targetVC = target;
        return self;
    };
}

- (NavigationView *(^)(NSString *))title{
    return ^NavigationView *(NSString *title) {
        self.titleLabel.text = title;
        return self;
    };
}


- (NavigationView *(^)(NSString *))rightItemWithImage {
    return ^NavigationView *(NSString *icon) {
        [self.rightItemBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        [self.rightItemBtn sizeToFit];
        self.rightItemBtn.center = CGPointMake(self.frame.size.width - self.rightItemBtn.bounds.size.width, self.titleLabel.center.y);
        return self;
    };
}

- (NavigationView *(^)(NSString *))rightItemWithTitle {
    return ^NavigationView *(NSString *title) {
        [self.rightItemBtn setTitle:title forState:UIControlStateNormal];
        [self.rightItemBtn setTitleColor:[NavManager navTitleColor] forState:UIControlStateNormal];
        self.rightItemBtn.titleLabel.font = [UIFont systemFontOfSize:16 * kScale];
        [self.rightItemBtn sizeToFit];
        self.rightItemBtn.center = CGPointMake(self.frame.size.width - self.rightItemBtn.bounds.size.width, self.titleLabel.center.y);
        return self;
    };
}

- (NavigationView *(^)(id, SEL))rightItemTargetAction {
    return ^NavigationView *(id target, SEL action) {
        [self.rightItemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (NavigationView *(^)(NSString *))updateBackItemWithImage {
    return ^NavigationView *(NSString *icon) {
        [self.backItemBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        self.backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        [self.backItemBtn sizeToFit];
        return self;
    };
}

- (NavigationView *(^)(NSString *))updateBackItemWithTitle {
    return ^NavigationView *(NSString *title) {
        [self.backItemBtn setImage:nil forState:UIControlStateNormal];
        [self.backItemBtn setTitle:title forState:UIControlStateNormal];
        [self.backItemBtn setTitleColor:[NavManager navTitleColor] forState:UIControlStateNormal];
        self.backItemBtn.titleLabel.font = [UIFont systemFontOfSize:16 * kScale];
        self.backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        [self.backItemBtn sizeToFit];
        return self;
    };
}

- (NavigationView *(^)(UIView *, CGRect))customLeftView {
    return ^NavigationView *(UIView *view, CGRect frame) {
        [self addSubview:view];
        view.frame = frame;
        return self;
    };
}

- (NavigationView *(^)(UIView *, CGRect))customRightView {
    return ^NavigationView *(UIView *view, CGRect frame) {
        [self addSubview:view];
        view.frame = frame;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isHideBackIcon {
    return ^NavigationView *(BOOL isHide) {
        self.backItemBtn.hidden = isHide;
        return self;
    };
}

- (NavigationView *(^)(BOOL))isHideBottomLine {
    return ^NavigationView *(BOOL isHide) {
        self.lineView.hidden = isHide;
        return self;
    };
}

#pragma mark - event response
- (void)s_backItemBtnClick {
    if (self.targetVC.presentingViewController) {
        [self.targetVC dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.targetVC.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getters
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.center = CGPointMake(self.center.x, self.center.y + 10 * kScale);
        _titleLabel.bounds = CGRectMake(0, 0, 200 * kScale, 25 * kScale);
        _titleLabel.font = [UIFont systemFontOfSize:[NavManager navTitleFontSize]];
        _titleLabel.textColor = [NavManager navTitleColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        CGRect frame = CGRectMake(0, [NavigationView height] - NavigationViewLineViewHeight * kScale, self.frame.size.width, NavigationViewLineViewHeight * kScale);
        _lineView = [[UIView alloc]initWithFrame:frame];
        _lineView.backgroundColor = [NavManager navBottomLineColor];
    }
    return _lineView;
}

- (UIButton *)rightItemBtn {
    if (_rightItemBtn == nil) {
        _rightItemBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightItemBtn;
}

- (UIButton *)backItemBtn {
    if (_backItemBtn == nil) {
        _backItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backItemBtn setImage:[NavManager navGlobalBackIcon] forState:UIControlStateNormal];
        [_backItemBtn sizeToFit];
        _backItemBtn.center = CGPointMake(20 * kScale, self.titleLabel.center.y);
        [_backItemBtn addTarget:self action:@selector(s_backItemBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backItemBtn;
}

+ (CGFloat)height {
   return NavigationViewHeight * kScale;
}

- (void)setFrame:(CGRect)frame {
    
    CGRect temp = CGRectMake(0, 0, ScreenWidth, NavigationViewHeight * kScale);
    [super setFrame:temp];
}

@end
