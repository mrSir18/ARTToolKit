//
//  UIFont+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

@interface UIFont (ARTExtension)

/*!
 * @brief 苹方常规字体 (PingFangSC-Regular)
 * @param fontSize 字体大小
 */
+ (UIFont *)art_fontPingFangSCWithSize:(CGFloat)fontSize;

/*!
 * @brief 平方中等字体 (PingFangSC-Medium)
 * @param fontSize 字体大小
 */
+ (UIFont *)art_fontPingFangSCMediumWithSize:(CGFloat)fontSize;
/*!
 * @brief 平方加粗字体 (PingFangSC-Semibold)
 * @param fontSize 字体大小
 */
+ (UIFont *)art_fontPingFangSCSemiboldWithSize:(CGFloat)fontSize;

@end
