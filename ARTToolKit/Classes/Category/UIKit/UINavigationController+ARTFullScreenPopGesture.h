//
//  UINavigationController+ARTFullScreenPopGesture.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (ARTFullScreenPopGesture)

/*!
 * @brief   全局禁用侧滑手势
 * @return  默认YES
 */
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *art_fullScreenPopGestureRecognizer;

/*!
 * @brief   是否隐藏全屏导航
 * @return  默认YES
 */
@property (nonatomic, assign, getter=isViewControllerBasedNavigationBarAppearanceEnabled) BOOL art_viewControllerBasedNavigationBarAppearanceEnabled;

@end



#pragma mark - 扩展控制器
@interface UIViewController (ARTFullScreenPopGesture)

/*!
 * @brief   是否隐藏导航栏
 * @return  默认NO
 */
@property (nonatomic, assign, getter=isHideNavigationBarEnabled) BOOL art_hideNavigationBarEnabled;

/*!
 * @brief   是否禁用侧滑返回
 * @return  默认NO
 */
@property (nonatomic, assign, getter=isFullScreenPopGestureRecognizerDisable) BOOL art_fullScreenPopGestureRecognizerDisable;

@end

NS_ASSUME_NONNULL_END
