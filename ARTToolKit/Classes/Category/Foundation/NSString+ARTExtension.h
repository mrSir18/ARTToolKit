//
//  NSString+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSString (ARTExtension)

#pragma mark - API Basic Utils
/*!
 * @brief 转换时间字符串为NSDate对象
 * @param format 时间字符串的日期格式
 * @return 转换的NSDate对象
 */
- (NSDate *)art_dateWithFormat:(NSString *)format;


/*!
 * @brief 获取字符串尺寸
 *
 * @param font 字号
 * @return size
 */
- (CGSize)art_sizeWithFontCompatible:(UIFont *)font;


/*!
 * @brief 获取字符串尺寸
 *
 * @param font             字号
 * @param width            字符串宽度
 * @param lineBreakMode    折行模式
 * @return size
 */
- (CGSize)art_sizeWithFontCompatible:(UIFont *)font
                            forWidth:(CGFloat)width
                       lineBreakMode:(NSLineBreakMode)lineBreakMode;


/*!
 * @brief 转换为NSMutableAttributedString
 *
 * @param attributesDic      编辑内容
 * @param attributeRange     编辑区域
 * @return  attributedString
 */
- (NSMutableAttributedString *)art_attributedStringWithAttributes:(NSDictionary *)attributesDic
                                                            range:(NSRange)attributeRange;

/*!
 * @brief 去除字符串前后空格及回车符
 * @return 新字符串
 */
- (NSString *)art_stringByTrimmingWhitespace;


/*!
 * @brief 字符串行数
 * @return 行数
 */
- (NSUInteger)art_numberOfLines;


/*!
 * @brief 检测字符串中是否包含中文
 * @return 返回检测后的结果
 */
- (BOOL)art_isContainChinese;


/*!
 * @brief 判断字符串是否是手机号
 * @return 返回判断后的结果
 */
- (BOOL)art_isPhoneNumber;


/*!
 * @brief 设置最大字符限制，超过则...
 */
- (NSString *)art_limitedLengthCharWith:(NSInteger)limitedNum;

/*!
 * @brief 字符数
 */
- (NSInteger)art_convertToLength;


#pragma mark - API SubString Utils
/*!
 * @brief 安全截取字符串中的子NSString对象
 * @param from 子NSString对象的下标
 * @return 截取的子NSString对象
 */
- (NSString *)art_substringFromIndex:(NSUInteger)from;


/*!
 * @brief 安全截取字符串中的子NSString对象
 * @param to 子NSString对象的下标
 * @return 截取的子NSString对象
 */
- (NSString *)art_substringToIndex:(NSUInteger)to;


/*!
 * @brief 安全截取字符串中的子NSString对象
 * @param range 子NSString对象的范围
 * @return 截取的子NSString对象
 */
- (NSString *)art_substringWithRange:(NSRange)range;


/*!
 * @brief 将字符串的首字母进行[小写]处理
 * @return 首字符[小写]的NSString对象
 */
- (NSString *)art_lowercaseCaptialString;


/*!
 * @brief 将字符串的首字母进行[大写]处理
 * @return 首字符[大写]的NSString对象
 */
- (NSString *)art_uppercaseCaptialString;


#pragma mark - API Base64 Utils
/*!
 * @brief 使用base64编码String数据
 * @return 返回base64编码后的String对象
 */
- (NSString *)art_base64EncodedString;


/*!
 * @brief 使用base64解码String数据
 * @return 返回base64解码后的String对象
 */
- (NSString *)art_base64DecodeString;


/*!
 * @brief 使用base64编码String数据
 * @return 返回base64编码后的Data对象
 */
- (NSData *)art_base64EncodedData;


/*!
 * @brief 使用base64解码String数据
 * @return 返回base64解码后的Data对象
 */
- (NSData *)art_base64DecodeData;


#pragma mark - URL相关
/*!
 * @brief 对字符串进行URL编码处理
 * @return 返回编码后的字符串
 */
- (NSString *)art_stringURLEncode;


/*!
 * @brief 对字符串进行URL解码处理
 * @return 返回解码后的字符串
 */
- (NSString *)art_stringURLDecode;


/*!
 * @brief 对特殊字符进行URL编码处理 "!*'();:@&=+$,/?%#[]
 * @return 返回编码后的字符串
 */
- (NSString *)art_stringSymbolURLEncode;


/**
 * @desc url后拼接query信息
 *
 * @param queryString 格式为key=value
 *
 * @return 拼接后生成的url
 */
- (NSString *)art_appendQueryString:(NSString *)queryString;



#pragma mark - API MD5 Utils
/*!
 * @brief 对字符串进行MD5加密处理
 * @return 返回MD5加密后的字符串
 */
- (NSString *)art_md5String;

#pragma mark - API JSON Utils
/*!
 * @brief Json转对象
 */
-(id)art_JSONValue;

@end
