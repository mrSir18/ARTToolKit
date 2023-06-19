//
//  ARTEmptyUtils.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/19.
//

#import "ARTEmptyUtils.h"

@implementation ARTEmptyUtils

+ (BOOL)isEmptyTarget:(id)target
{
    if (target == nil) {
        return YES;
    }
    if (target == NULL) {
        return YES;
    }
    if ([target isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isEmptyNumber:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    return (![object isKindOfClass:[NSNumber class]]);
}

+ (BOOL)isEmptyString:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        return ([(NSString *)object length] <= 0);
    }
    return YES;
}

+ (BOOL)isBlankString:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    if (![object isKindOfClass:[NSString class]]) {
        return YES;
    }
    NSString *string = (NSString *)object;
    id chset = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    string = [string stringByTrimmingCharactersInSet:chset];
    return !([string length] > 0);
}

+ (BOOL)isEmptyData:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    if (![object isKindOfClass:[NSData class]]) {
        return YES;
    }
    return !([((NSData *)object) length] > 0);
}

+ (BOOL)isEmptyDictionary:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    if (![object isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return !([((NSDictionary *)object) count] > 0);
}

+ (BOOL)isEmptyArray:(id)object
{
    if ([[self class] isEmptyTarget:object]) {
        return YES;
    }
    if (![object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return !([((NSArray *)object) count] > 0);
}

@end
