//
//  UINavigationController+ARTFullScreenPopGesture.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UINavigationController+ARTFullScreenPopGesture.h"
#import <objc/runtime.h>

#pragma mark - 手势代理
@interface ARTFullScreenPopGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>
@property (nonatomic, weak) UINavigationController *navigationController;
@end

@implementation ARTFullScreenPopGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;//没有弹出视图控制器时，忽略该手势
    }
    
    UIViewController *topViewController = self.navigationController.viewControllers.lastObject;
    if (topViewController.isFullScreenPopGestureRecognizerDisable) {
        return NO; //当视图控制器禁用了侧滑，忽略该手势
    }

    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
        return NO; //当视图控制器处于跳转过度中时，忽略该手势
    }
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO; //当手势向相反方向滑动时，忽略该手势
    }
    
    return YES;
}

@end



#pragma mark - 私有交换方法
typedef void (^ARTViewControllerWillAppearInjectBlock)(UIViewController *viewController, BOOL animated);

@interface UIViewController (ARTFullScreenPopGesturePrivate)
@property (nonatomic, copy) ARTViewControllerWillAppearInjectBlock art_willAppearInjectBlock;
@end

@implementation UIViewController (ARTFullScreenPopGesturePrivate)

+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(art_viewWillAppear:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)art_viewWillAppear:(BOOL)animated {
    [self art_viewWillAppear:animated];
    
    if (self.art_willAppearInjectBlock) {
        self.art_willAppearInjectBlock(self, animated);
    }
}

- (ARTViewControllerWillAppearInjectBlock)art_willAppearInjectBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setArt_willAppearInjectBlock:(ARTViewControllerWillAppearInjectBlock)block {
    objc_setAssociatedObject(self, @selector(art_willAppearInjectBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end



#pragma mark - 扩展导航栏
@implementation UINavigationController (ARTFullScreenPopGesture)

+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, @selector(pushViewController:animated:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(art_pushViewController:animated:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)art_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.art_fullScreenPopGestureRecognizer]) {
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.art_fullScreenPopGestureRecognizer];
        /*handleNavigationTransition”, 通过Runtime动态获取到指定的target, 及action添加到自定义的手势上*/
        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget        = [internalTargets.firstObject valueForKey:@"target"];
        SEL internalAction       = NSSelectorFromString(@"handleNavigationTransition:");
        self.art_fullScreenPopGestureRecognizer.delegate = self.popGestureRecognizerDelegate;
        [self.art_fullScreenPopGestureRecognizer addTarget:internalTarget action:internalAction];
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    /*设置导航栏状态*/
    [self art_setupViewControllerBasedNavigationBarAppearanceIfNeeded:viewController];
    [self art_pushViewController:viewController animated:animated];
}

- (void)art_setupViewControllerBasedNavigationBarAppearanceIfNeeded:(UIViewController *)appearingViewController {
    if (!self.isViewControllerBasedNavigationBarAppearanceEnabled) {
        return;
    }
    @WeakObj(self);
    ARTViewControllerWillAppearInjectBlock block = ^(UIViewController *viewController, BOOL animated) {
        if (selfWeak) {
            [selfWeak setNavigationBarHidden:viewController.isHideNavigationBarEnabled animated:animated];
        }
    };
    appearingViewController.art_willAppearInjectBlock = block;
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (disappearingViewController && !disappearingViewController.art_willAppearInjectBlock) {
        disappearingViewController.art_willAppearInjectBlock = block;
    }
}

- (ARTFullScreenPopGestureRecognizerDelegate *)popGestureRecognizerDelegate {
    ARTFullScreenPopGestureRecognizerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    if (!delegate) {
        delegate = [[ARTFullScreenPopGestureRecognizerDelegate alloc] init];
        delegate.navigationController = self;
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

- (UIPanGestureRecognizer *)art_fullScreenPopGestureRecognizer {
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, _cmd);
    if (!panGestureRecognizer) {
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        objc_setAssociatedObject(self, _cmd, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return panGestureRecognizer;
}

- (BOOL)isViewControllerBasedNavigationBarAppearanceEnabled {
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    if (number) {
        return number.boolValue;
    }
    self.art_viewControllerBasedNavigationBarAppearanceEnabled = YES;
    return YES;
}

- (void)setArt_viewControllerBasedNavigationBarAppearanceEnabled:(BOOL)enabled {
    SEL key = @selector(isViewControllerBasedNavigationBarAppearanceEnabled);
    objc_setAssociatedObject(self, key, @(enabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end



#pragma mark - 扩展控制器
@implementation UIViewController (ARTFullScreenPopGesture)

- (BOOL)isHideNavigationBarEnabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setArt_hideNavigationBarEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(isHideNavigationBarEnabled), @(enabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isFullScreenPopGestureRecognizerDisable {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setArt_fullScreenPopGestureRecognizerDisable:(BOOL)disable {
    objc_setAssociatedObject(self, @selector(isFullScreenPopGestureRecognizerDisable), @(disable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
