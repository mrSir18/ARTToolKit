//
//  NSData+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSData (ARTExtension)

#pragma mark - API AES256 Utils
/*!
 * @brief 使用AES128加密Data数据
 * @return AES128加密后的Data对象
 */
- (NSData *)art_AES128EncryptWithKey:(NSString *)key;


/*!
 * @brief 使用AES128解密Data数据
 * @return AES128解密后的Data对象
 */
- (NSData *)art_AES128DecryptWithKey:(NSString *)key;


/*!
 * @brief 使用AES256加密Data数据
 * @return AES256加密后的Data对象
 */
- (NSData *)art_AES256EncryptWithKey:(NSString *)key;


/*!
 * @brief 使用AES256解密Data数据
 * @return AES256解密后的Data对象
 */
- (NSData *)art_AES256DecryptWithKey:(NSString *)key;


#pragma mark - API Base64 Utils
/*!
 * @brief 使用base64编码Data数据
 * @return 返回base64编码后的String对象
 */
- (NSString *)art_base64EncodedString;


/*!
 * @brief 使用base64解码Data数据
 * @return 返回base64解码后的String对象
 */
- (NSString *)art_base64DecodeString;


/*!
 * @brief 使用base64编码Data数据
 * @return 返回base64编码后的Data对象
 */
- (NSData *)art_base64EncodedData;


/*!
 * @brief 使用base64解码Data数据
 * @return 返回base64解码后的Data对象
 */
- (NSData *)art_base64DecodeData;


#pragma mark - API MD5 Utils
/*!
 * @brief 获取Data数据的MD5签名数据
 * @return MD5签名后的String对象
 */
- (NSString *)art_md5String;


/*!
 * @brief 获取Data数据的MD5签名数据
 * @return MD5签名后的Data对象
 */
- (NSData *)art_md5Data;


#pragma mark - GZIP Utils

/**
 * @desc GZIP压缩
 */
- (NSData *)art_gzippedData;

/**
 * @desc GZIP解压
 */
- (NSData *)art_gUnzippedData;


#pragma mark - JSON Utils
/*!
 * @brief JsonData转对象，Array或者dictionary
 */
- (id)art_JSONValue;

@end

