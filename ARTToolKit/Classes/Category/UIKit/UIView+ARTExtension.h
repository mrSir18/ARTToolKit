//
//  UIView+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ARTExtension)

/*!
 * @brief 设置or获取视图的顶部边距坐标值
 */
@property (nonatomic) CGFloat art_top;

/*!
 * @brief 设置or获取视图的左侧边距坐标值
 */
@property (nonatomic) CGFloat art_left;

/*!
 * @brief 设置or获取视图的右侧边距坐标值
 */
@property (nonatomic) CGFloat art_right;

/*!
 * @brief 设置or获取视图的底部边距坐标值
 */
@property (nonatomic) CGFloat art_bottom;

/*!
 * @brief 设置or获取视图的中心X坐标值
 */
@property (nonatomic) CGFloat art_centerX;

/*!
 * @brief 设置or获取视图的中心Y坐标值
 */
@property (nonatomic) CGFloat art_centerY;

/*!
 * @brief 设置or获取视图的宽度值
 */
@property (nonatomic) CGFloat art_width;

/*!
 * @brief 设置or获取视图的高度值
 */
@property (nonatomic) CGFloat art_height;

/*!
 * @brief 设置or获取视图的位置坐标
 */
@property (nonatomic) CGPoint art_origin;

/*!
 * @brief 设置or获取视图的尺寸大小
 */
@property (nonatomic) CGSize art_size;

/*!
 * @brief 当前view所依赖的UIViewController对象
 */
@property (nullable, nonatomic, readonly) UIViewController *art_viewController;

/*!
 * @brief 设置了渐变的view
 */
@property (nullable, nonatomic, strong, readonly) UIView *art_gradientView;

/*!
 * @brief 移除当前视图中的所有子视图
 */
- (void)art_removeAllSubviews;

/**
 Attaches the given block for a single tap action to the receiver.
 @param block The block to execute.
 */
- (void)art_setTapActionWithBlock:(void (^)(void))block;


/**
 * @brief 加载当前视图的Xib文件
 */
+ (id)art_loadFromNib;

#pragma mark - UIView Animation
/**
 * @brief view弹出抖动动画
 */
- (void)art_transformScaleAnimation;


#pragma mark - Gradient Tools
/*!
 * @brief 设置默认的渐变色 红->橙
 * 渐变色位置 左->右
 */
- (void)art_setDefaultGradientColor;

/*!
 * @brief 设置渐变色
 *
 * @param  startColor 起始颜色
 * @param  endColor   结束颜色
 * @param  startPoint 起始点
 * @param  endPoint   结束点
 */
- (void)art_setGradientColorWithStartColor:(UIColor *)startColor
                              endColor:(UIColor *)endColor
                            startPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint;

/*!
 * @brief 移除渐变色
 */
- (void)art_removeGradientColor;

@end

@interface ARTGradientView : UIView

@end

NS_ASSUME_NONNULL_END
