//
//  UIImage+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UIImage+ARTExtension.h"

@implementation UIImage (ARTExtension)

+ (UIImage *)art_imageFromColor:(UIColor *)color withSize:(CGSize)imageSize
{
    UIImage *image = nil;
    CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO,[UIScreen mainScreen].scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)art_imageFromColor:(UIColor *)color
{
    return [UIImage art_imageFromColor:color withSize:CGSizeMake(1.0f, 1.0f)];
}

- (UIImage *)art_stretchImageFromCenter
{
    return [self stretchableImageWithLeftCapWidth:self.size.width * 0.5f
                                     topCapHeight:self.size.height * 0.5f];
}

- (UIImage *)art_imageWithImageSize:(CGSize)imageSize cornerRadius:(CGFloat)cornerRadius
{
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, scale);
    CGRect bounds = CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:cornerRadius];
    [path addClip];
    [self drawInRect:bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)art_imageWithOrientation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, self.size.height, self.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, self.size.height, self.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, self.size.width, self.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, self.size.width, self.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), self.CGImage);
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

- (UIImage *)art_toOrientationUpImage
{
    UIImage *image = self;
    if (image.imageOrientation == UIImageOrientationUp) {
        return image;
    }
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored: {
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        }
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored: {
            transform = CGAffineTransformTranslate(transform, image.size.width, 0.0f);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        }
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored: {
            transform = CGAffineTransformTranslate(transform, 0.0f, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        }
        default:{break;}
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:{
            transform = CGAffineTransformTranslate(transform, image.size.width, 0.0f);
            transform = CGAffineTransformScale(transform, -1.0f, 1.0f);
            break;
        }
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:{
            transform = CGAffineTransformTranslate(transform, image.size.height, 0.0f);
            transform = CGAffineTransformScale(transform, -1.0f, 1.0f);
            break;
        }
        default:{break;}
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    CGImageRef ctxImage = CGBitmapContextCreateImage(ctx);
    UIImage *retImage = [UIImage imageWithCGImage:ctxImage];
    CGImageRelease(ctxImage);
    CGContextRelease(ctx);
    return retImage;
}

- (UIImage *)art_compressImageWithSize:(CGSize)compressSize scale:(CGFloat)compressScale maxDataLength:(CGFloat)maxDataLength
{
    CGFloat widthScale = compressSize.width / self.size.width;
    CGFloat heightScale = compressSize.height / self.size.height;
    CGFloat scale = widthScale > heightScale ? heightScale : widthScale;
    UIImage *compressImage = [self art_compressSizeWithScale:MIN(1.0f, scale)];
    NSData *imageData = UIImageJPEGRepresentation(compressImage, 1.0f);
    if (imageData.length > maxDataLength) { //小于200k则不压缩
        imageData = UIImageJPEGRepresentation(compressImage, compressScale);
    }
    return [UIImage imageWithData:imageData];
}

- (UIImage *)art_compressSizeWithScale:(CGFloat)scale
{
    CGSize newSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0.0f, 0.0f, newSize.width, newSize.height)];
    UIImage* compressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImage;
}

@end
