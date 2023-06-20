//
//  UIColor+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

@interface UIColor (ARTExtension)

/*!
 * @brief 根据十六进制初始化UIColor
 * @param hexValue 十六进制数, 例如:0xa0a0a0
 * 注意：默认透明度(alpha:1.0f)
 */
+ (UIColor *)art_colorWithHEXValue:(NSInteger)hexValue;

/*!
 * @brief 根据十六进制初始化UIColor
 * @param hexValue 十六进制数, 例如:0xa0a0a0
 * @param alpha 透明度
 */
+ (UIColor *)art_colorWithHEXValue:(NSInteger)hexValue alpha:(CGFloat)alpha;

/*!
 * @brief 根据十六进制初始化UIColor
 * @param hexString 十六进制字符串,例如:"#a0a0a0"
 * 注意：默认透明度(alpha:1.0f)
 */
+ (UIColor *)art_colorWithHEXString:(NSString *)hexString;

@end
