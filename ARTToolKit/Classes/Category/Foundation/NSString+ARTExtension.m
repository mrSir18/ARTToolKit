//
//  NSString+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSString+ARTExtension.h"

@implementation NSString (ARTExtension)

#pragma mark - API Basic Utils
- (NSDate *)art_dateWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter dateFromString:self];
}

- (CGSize)art_sizeWithFontCompatible:(UIFont *)font
{
    NSDictionary *dictionaryAttributes = @{NSFontAttributeName:font};
    CGSize stringSize = [self sizeWithAttributes:dictionaryAttributes];
    return CGSizeMake(ceil(stringSize.width), ceil(stringSize.height));
}

- (CGSize)art_sizeWithFontCompatible:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    //NSDictionary *dictionaryAttributes = @{NSFontAttributeName:font};
    CGSize stringSize = [self sizeWithFont:font
                         constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                             lineBreakMode:lineBreakMode];
    CGFloat widthResult = stringSize.width;
    if(widthResult - width >= 0.001)
    {
        widthResult = width;
    }
    
    return CGSizeMake(ceil(widthResult), ceil(stringSize.height));
}


// 转换为NSMutableAttributedString
- (NSMutableAttributedString *)art_attributedStringWithAttributes:(NSDictionary *)attributesDic range:(NSRange)attributeRange
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString addAttributes:attributesDic range:attributeRange];
    return attributedString;
}


- (NSString *)art_stringByTrimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)art_numberOfLines
{
    return [[self componentsSeparatedByString:@"\n"] count] + 1;
}

- (BOOL)art_isContainChinese
{
    for (int i = 0; i < [self length]; i ++) {
        unichar item = [self characterAtIndex:i];
        if ((item >= 0x4e00) && (item <= 0x9fff)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)art_isPhoneNumber
{
    if (self.length != 11) {return NO;}
    NSString *regex = [NSString stringWithFormat:@"%@", @"^[0-9]*$"];
    id predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [((NSPredicate *)predicate) evaluateWithObject:self];
}

- (NSString *)art_limitedLengthCharWith:(NSInteger)limitedNum
{
    NSString *finalContentString = self;
    NSUInteger unicodeCount = 0;
    if (self.length * 2 > limitedNum) {
        NSUInteger subLength = 0;
        char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
        p++;
        for (int i = 0; i < self.length;  i+=1 ) {
            if (*p) {
                subLength+=2;
                p+=2;
            }else {
                subLength++;
                p+=2;
            }
            if (subLength > limitedNum) {
                finalContentString = [[self substringToIndex:unicodeCount] stringByAppendingString:@"..."];
                break;
            }else {
                unicodeCount++;
            }
        }
    }
    return finalContentString;
}

- (NSInteger)art_convertToLength {
    
    NSInteger strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
    
}


#pragma mark - API SubString Utils
- (NSString *)art_substringFromIndex:(NSUInteger)from
{
    if (self.length > from) {
        NSRange range = [self rangeOfComposedCharacterSequenceAtIndex:from];
        return [self substringFromIndex:(range.location)];
    }
    return self;
}

- (NSString *)art_substringToIndex:(NSUInteger)to
{
    if (self.length > to) {
        NSRange range = [self rangeOfComposedCharacterSequenceAtIndex:to];
        return [self substringToIndex:(range.location)];
    }
    return self;
}

- (NSString *)art_substringWithRange:(NSRange)range
{
    if ((range.location + range.length) <= self.length) {
        NSRange subrange = [self rangeOfComposedCharacterSequencesForRange:range];
        return [self substringWithRange:subrange];
    }
    return self;
}

- (NSString *)art_lowercaseCaptialString
{
    if (self.length > 0) {
        NSString *first = [[self substringToIndex:1] lowercaseString];
        if (self.length > 1) {
            NSString *lastString = [self substringFromIndex:1];
            return [NSString stringWithFormat:@"%@%@", first, lastString];
        } else {
            return first;
        }
    }
    return nil;
}

- (NSString *)art_uppercaseCaptialString
{
    if (self.length > 0) {
        NSString *first = [[self substringToIndex:1] uppercaseString];
        if (self.length > 1) {
            NSString *lastString = [self substringFromIndex:1];
            return [NSString stringWithFormat:@"%@%@", first, lastString];
        } else {
            return first;
        }
    }
    return nil;
}

#pragma mark - API Base64 Utils
- (NSString *)art_base64EncodedString
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64EncodingEndLineWithLineFeed;
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return [data base64EncodedStringWithOptions:options];
    }
    return nil;
}

- (NSString *)art_base64DecodeString
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64DecodingIgnoreUnknownCharacters;
        NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:options];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSData *)art_base64EncodedData
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64EncodingEndLineWithLineFeed;
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return [data base64EncodedDataWithOptions:options];
    }
    return nil;
}

- (NSData *)art_base64DecodeData
{
    if (self.length > 0) {
        NSUInteger options = NSDataBase64DecodingIgnoreUnknownCharacters;
        return [[NSData alloc] initWithBase64EncodedString:self options:options];
    }
    return nil;
}

#pragma mark - API URLEncode Utils
- (NSString *)art_stringURLEncode
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)art_stringURLDecode
{
    return [self stringByRemovingPercentEncoding];
}

- (NSString *)art_stringSymbolURLEncode {
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"\"!*'();:@&=+$,/?%#[]"] invertedSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

// url后拼接query信息
- (NSString *)art_appendQueryString:(NSString *)queryString
{
    if (![queryString isKindOfClass:[NSString class]] || queryString.length == 0 || ![queryString containsString:@"="])
    {
        return self;
    }
    else
    {
        if ([self containsString:@"?"])
        {
            return [self stringByAppendingFormat:@"&%@", queryString];
        }
        else
        {
            return [self stringByAppendingFormat:@"?%@", queryString];
        }
    }
}

#pragma mark - API MD5 Utils
- (NSString *)art_md5String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] art_md5String];
}

#pragma mark - API JSON Utils
- (id)art_JSONValue {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

@end

