//
//  UIScreen+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (ARTExtension)

/**
 * @desc  当前屏幕宽度
 */
+ (CGFloat)art_currentScreenWidth;

/**
 * @desc 当前屏幕高度
 */
+ (CGFloat)art_currentScreenHeight;

/**
 * @desc 导航条高度
 */
+ (CGFloat)art_navViewHeight;

/**
 * @desc 状态栏高度
 */
+ (CGFloat)art_statusBarHeight;

/**
 * @desc 虚拟home键高度
 */
+ (CGFloat)art_virtualHomeHeight;

/**
 * @desc 安全区域
 */
+ (UIEdgeInsets)art_safeAreaInset;

/**
 * @desc tabBar高度
 */

+ (CGFloat)art_tabBarHeight;

/**
 * @desc 判断当前屏幕顶部是否有刘海
 */
+ (BOOL)art_currentScreenIsIphoneX;

@end

NS_ASSUME_NONNULL_END
