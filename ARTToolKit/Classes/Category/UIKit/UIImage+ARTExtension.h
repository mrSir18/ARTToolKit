//
//  UIImage+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

@interface UIImage (ARTExtension)

/*!
 * @brief 根据制定的颜色生成图片
 * @param color 指定的图片颜色
 * @return 生成指定颜色的图片
 */
+ (UIImage *)art_imageFromColor:(UIColor *)color withSize:(CGSize)imageSize;


/*!
 * @brief 根据制定的颜色生成图片
 * @param color 指定的图片颜色
 * @return 生成指定颜色的图片
 */
+ (UIImage *)art_imageFromColor:(UIColor *)color;


/*!
 * @brief 获取从中心拉伸后的图片
 * @return 拉伸后生成的新图片
 */
- (UIImage *)art_stretchImageFromCenter;


/*!
 * @brief 裁剪图片生成带圆角的新图片
 * @param imageSize    指定裁剪图片的尺寸
 * @param cornerRadius 指定裁剪的圆角半径
 * @return 生成带圆角的新图片
 */
- (UIImage *)art_imageWithImageSize:(CGSize)imageSize cornerRadius:(CGFloat)cornerRadius;


/*!
 * @brief 根据原图大小实现图片旋转
 * @param orientation 图片旋转方向
 * @return 旋转后的图片
 */
- (UIImage *)art_imageWithOrientation:(UIImageOrientation)orientation;


/*!
 * @brief 将imageOrientation方向不是Up的转成UIImageOrientationUp
 *
 * 当image显示时会按照imageOrientation的方向进行绘制，当不是UIImageOrientationUp时
 * 图片的显示可能不是我们想要显示的方向
 */
- (UIImage *)art_toOrientationUpImage;


/*!
 * @brief 压缩图片的尺寸以及图片Data的大小不超过制定大小
 * @param compressSize    所需压缩后的图片的尺寸
 * @param scale           所需压缩原图的比例
 * @param maxDataLength   压缩后图片的大小（NSData类型的数 length方法后得到的就是b/1024 = k）
 * @return 压缩后生成的新图片
 */
- (UIImage *)art_compressImageWithSize:(CGSize)compressSize scale:(CGFloat)scale maxDataLength:(CGFloat)maxDataLength;


/*!
 * @brief 按原图比例进行绘制压缩图片(尺寸)
 * @param scale 压缩的原图比例
 * @return 拉伸后生成的新图片
 */
- (UIImage *)art_compressSizeWithScale:(CGFloat)scale;


@end
