//
//  UIScreen+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UIScreen+ARTExtension.h"

CGFloat const ARTDefaultNavHeight        = 44.0f; //默认导航条高度
CGFloat const ARTDefaultStatusHeight     = 20.0f; //默认状态栏高度
CGFloat const ARTDefaultTabBarHeight     = 49.0f; //默认tabbar高度

@implementation UIScreen (ARTExtension)

+ (CGFloat)art_currentScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)art_currentScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (BOOL)art_currentScreenIsIphoneX
{
    CGFloat screenWidth = ceil([self art_currentScreenWidth]);
    CGFloat screenHeight = ceil([self art_currentScreenHeight]);
    if ((screenWidth == 375 && screenHeight == 812) || (screenWidth == 414 && screenHeight == 896))
    {
        return YES;
    }

    if (@available(iOS 11.0, *)) {
        if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom > 0 && UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone)
        {
            return YES;
        }
    }
    return NO;
}

+ (CGFloat)art_navViewHeight
{
    CGFloat navBarHeight = ARTDefaultNavHeight;
    CGFloat statusBarHeight = [self art_statusBarHeight];
    return navBarHeight + statusBarHeight;
}

+ (CGFloat)art_statusBarHeight
{
   float statusBarHeight = 0;
   if (@available(iOS 13.0, *)) {
       UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
       statusBarHeight = statusBarManager.statusBarFrame.size.height;
   }else {
       statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
   }
   // 兜底
    if (statusBarHeight == 0) {
        statusBarHeight = ARTDefaultStatusHeight;
    }
   return statusBarHeight;
}

+ (CGFloat)art_tabBarHeight
{
    return ARTDefaultTabBarHeight + [self art_virtualHomeHeight];
}

+ (CGFloat)art_virtualHomeHeight
{
    CGFloat virtualHomeHeight = 0;
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        virtualHomeHeight = window.safeAreaInsets.bottom;
    }
    return virtualHomeHeight;
}

+ (UIEdgeInsets)art_safeAreaInset
{
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        return window.safeAreaInsets;
    }
    return UIEdgeInsetsMake([self art_statusBarHeight], 0, 0, 0);
}

@end
