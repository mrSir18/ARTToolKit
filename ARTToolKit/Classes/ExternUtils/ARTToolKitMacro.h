//
//  ARTToolKitMacro.h
//  Pods
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UIScreen+ARTExtension.h"

// 手机机型是否为iPhone X
#define IS_IPHONE_X                              [UIScreen art_currentScreenIsIphoneX]

//当前方向屏幕的宽
#define kCurrentScreenWidth                     [UIScreen art_currentScreenWidth]

//当前方向屏幕的高
#define kCurrentScreenHeight                    [UIScreen art_currentScreenHeight]

// 状态栏高度
#define kApplicationStatusBarHeight             [UIApplication sharedApplication].statusBarFrame.size.height

// 导航栏
#define kNavigationBarHeight                    64.0f

// tabBar
#define kTabBarHeight                           49.0f
#define kIPhoneXTabBarHeight                    83.0f

// 1px的线
#define kLineWith1pixel                         (1.0f / [UIScreen mainScreen].scale)

//*************************针对iPhoneX*************************
#define kIPhoneXStatusBarHeight                 44.0f
#define kIphoneXNaviBarHeight                   44.0f
#define kIphoneXTabBarSpaceBottomHeight         34.0f
//************************************************************


#ifdef DEBUG

#define ARTLog(format, ...) printf("%s %s [Line %d] \n%s\n", ([[[NSDate date]art_dateString]UTF8String]), __PRETTY_FUNCTION__, __LINE__,  [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else

#define ARTLog(format, ...)

#endif
