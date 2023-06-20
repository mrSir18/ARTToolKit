//
//  NSURL+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (ARTExtension)

/*!
 * @brief 字符串生成NSURL对象(==[NSURL URLWithString:])
 * 兼容链接中含有中文字符(一半编码+中文字符)
 *
 * @param urlString 链接字符串
 * @return NSURL对象
 */
+ (instancetype)art_urlWithString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
