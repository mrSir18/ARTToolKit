//
//  NSData+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSData+ARTExtension.h"
#import <CommonCrypto/CommonCrypto.h>
#import <zlib.h>

@implementation NSData (ARTExtension)

#pragma mark - API AES256 Utils
- (NSData *)art_AES128EncryptWithKey:(NSString *)key
{
    /*1.处理AES256的加密秘钥*/
    char keyRefer[kCCKeySizeAES256+1];
    bzero(keyRefer, sizeof(keyRefer));
    [key getCString:keyRefer maxLength:sizeof(keyRefer) encoding:NSUTF8StringEncoding];
    
    /*2.开辟存储加密结果的内存*/
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    /*3.执行AES256加密处理*/
    size_t dataOutMoved = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyRefer, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &dataOutMoved);
    
    /*4.处理结果并释放非OC对象*/
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:dataOutMoved];
    }
    free(buffer);
    return nil;
}

- (NSData *)art_AES128DecryptWithKey:(NSString *)key
{
    /*1.处理AES256的加密秘钥*/
    char keyRefer[kCCKeySizeAES256+1];
    bzero(keyRefer, sizeof(keyRefer));
    [key getCString:keyRefer maxLength:sizeof(keyRefer) encoding:NSUTF8StringEncoding];
    
    /*2.开辟存储加密结果的内存*/
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    /*3.执行AES256加密处理*/
    size_t dataOutMoved = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyRefer, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &dataOutMoved);
    
    /*4.处理结果并释放非OC对象*/
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:dataOutMoved];
    }
    free(buffer);
    return nil;
}

/*!
 * @brief 使用AES256加密Data数据
 * @return AES256加密后的Data对象
 */
- (NSData *)art_AES256EncryptWithKey:(NSString *)key
{
    /*1.处理AES256的加密秘钥*/
    char keyRefer[kCCKeySizeAES256+1];
    bzero(keyRefer, sizeof(keyRefer));
    [key getCString:keyRefer maxLength:sizeof(keyRefer) encoding:NSUTF8StringEncoding];
    
    /*2.开辟存储加密结果的内存*/
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    /*3.执行AES256加密处理*/
    size_t dataOutMoved = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyRefer, kCCKeySizeAES256,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &dataOutMoved);
    
    /*4.处理结果并释放非OC对象*/
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:dataOutMoved];
    }
    free(buffer);
    return nil;
}


/*!
 * @brief 使用AES256解密Data数据
 * @return AES256解密后的Data对象
 */
- (NSData *)art_AES256DecryptWithKey:(NSString *)key
{
    /*1.处理AES256的加密秘钥*/
    char keyRefer[kCCKeySizeAES256+1];
    bzero(keyRefer, sizeof(keyRefer));
    [key getCString:keyRefer maxLength:sizeof(keyRefer) encoding:NSUTF8StringEncoding];
    
    /*2.开辟存储加密结果的内存*/
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    /*3.执行AES256加密处理*/
    size_t dataOutMoved = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyRefer, kCCKeySizeAES256,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &dataOutMoved);
    
    /*4.处理结果并释放非OC对象*/
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:dataOutMoved];
    }
    free(buffer);
    return nil;
}

#pragma mark - API Base64 Utils
- (NSString *)art_base64EncodedString
{
    if (self.length > 0) {
        return [self base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return nil;
}

- (NSString *)art_base64DecodeString
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64DecodingIgnoreUnknownCharacters;
        NSData *data = [[NSData alloc] initWithBase64EncodedData:self options:options];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSData *)art_base64EncodedData
{
    if (self.length > 0) {
        return [self base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return nil;
}

- (NSData *)art_base64DecodeData
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64DecodingIgnoreUnknownCharacters;
        return [[NSData alloc] initWithBase64EncodedData:self options:options];
    }
    return nil;
}

#pragma mark - API MD5 Utils
- (NSString *)art_md5String
{
    if (self.length > 0) {
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(self.bytes, (CC_LONG)self.length, result);
        return [NSString stringWithFormat:
                @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                result[0], result[1], result[2], result[3],
                result[4], result[5], result[6], result[7],
                result[8], result[9], result[10], result[11],
                result[12], result[13], result[14], result[15]
                ];
    }
    return nil;
}

- (NSData *)art_md5Data
{
    if (self.length > 0) {
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(self.bytes, (CC_LONG)self.length, result);
        return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
    }
    return nil;
}

#pragma mark - GZIP Utils
- (NSData *)art_gzippedData
{
    if (self.length == 0 || [self art_isGzippedData])
    {
        return self;
    }
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)(void *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    static const NSUInteger ChunkSize = 16384;
    
    NSMutableData *output = nil;
    int compression = Z_DEFAULT_COMPRESSION;
    if (deflateInit2(&stream, compression, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY) == Z_OK)
    {
        output = [NSMutableData dataWithLength:ChunkSize];
        while (stream.avail_out == 0)
        {
            if (stream.total_out >= output.length)
            {
                output.length += ChunkSize;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            deflate(&stream, Z_FINISH);
        }
        deflateEnd(&stream);
        output.length = stream.total_out;
    }
    
    return output;
}

- (NSData *)art_gUnzippedData
{
    if (self.length == 0 || ![self art_isGzippedData])
    {
        return self;
    }
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    NSMutableData *output = nil;
    if (inflateInit2(&stream, 47) == Z_OK)
    {
        int status = Z_OK;
        output = [NSMutableData dataWithCapacity:self.length * 2];
        while (status == Z_OK)
        {
            if (stream.total_out >= output.length)
            {
                output.length += self.length / 2;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            status = inflate (&stream, Z_SYNC_FLUSH);
        }
        if (inflateEnd(&stream) == Z_OK)
        {
            if (status == Z_STREAM_END)
            {
                output.length = stream.total_out;
            }
        }
    }
    
    return output;
}

- (BOOL)art_isGzippedData
{
    const UInt8 *bytes = (const UInt8 *)self.bytes;
    return (self.length >= 2 && bytes[0] == 0x1f && bytes[1] == 0x8b);
}

#pragma mark - JSON Utils
- (id)art_JSONValue
{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
}

@end
