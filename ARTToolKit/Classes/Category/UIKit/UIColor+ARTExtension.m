//
//  UIColor+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UIColor+ARTExtension.h"

@implementation UIColor (ARTExtension)

+ (UIColor *)art_colorWithHEXValue:(NSInteger)hexValue
{
    return [self art_colorWithHEXValue:hexValue alpha:1.0f];
}

+ (UIColor *)art_colorWithHEXValue:(NSInteger)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0f
                           green:((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0f
                            blue:((CGFloat)(hexValue & 0xFF)) / 255.0f
                           alpha:alpha];
}

static inline NSUInteger hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

static BOOL hexStrToRGBA(NSString *str,
                         CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    
    
    str = ({ // Trim blank characters (space and newline) in head and tail.
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        [[str stringByTrimmingCharactersInSet:set] uppercaseString];
        
    });
    
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

+ (UIColor *)art_colorWithHEXString:(NSString *)hexString
{
    CGFloat r, g, b, a;
    if (hexStrToRGBA(hexString, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

@end
