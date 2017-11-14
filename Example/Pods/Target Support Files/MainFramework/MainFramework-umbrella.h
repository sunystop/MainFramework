#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MainFrameworkAPI.h"
#import "NavigationView.h"
#import "NavManager.h"
#import "NXNavigationController.h"
#import "NXTabBar.h"
#import "NXTabBarController.h"
#import "UITabBar+badge.h"

FOUNDATION_EXPORT double MainFrameworkVersionNumber;
FOUNDATION_EXPORT const unsigned char MainFrameworkVersionString[];

