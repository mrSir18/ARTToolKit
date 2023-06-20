//
//  NSDictionary+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSDictionary+ARTExtension.h"

@implementation NSDictionary (ARTExtension)

- (NSInteger)art_integerForKey:(id)aKey defaultValue:(NSInteger)defaultValue
{
    NSNumber *object = [self art_numberForKey:aKey];
    if (object != nil) {
        return [object integerValue];
    }
    return defaultValue;
}

- (NSInteger)art_integerForKey:(id)aKey
{
    return [self art_integerForKey:aKey defaultValue:0];
}

- (double)art_doubleForKey:(id)aKey defaultValue:(double)defaultValue
{
    NSNumber *object = [self art_numberForKey:aKey];
    if (object != nil) {
        return [object doubleValue];
    }
    return defaultValue;
}

- (double)art_doubleForKey:(id)aKey
{
    return [self art_doubleForKey:aKey defaultValue:0.0f];
}

- (float)art_floatForKey:(id)aKey defaultValue:(float)defaultValue
{
    NSNumber *object = [self art_numberForKey:aKey];
    if (object != nil) {
        return [object floatValue];
    }
    return defaultValue;
}

- (float)art_floatForKey:(id)aKey
{
    return [self art_floatForKey:aKey defaultValue:0.0f];
}

- (long)art_longForKey:(id)aKey defaultValue:(long)defaultValue
{
    NSNumber *object = [self art_numberForKey:aKey];
    if (object != nil) {
        return [object longValue];
    }
    return defaultValue;
}

- (long)art_longForKey:(id)aKey
{
    return [self art_longForKey:aKey defaultValue:0.0f];
}

- (BOOL)art_boolForKey:(id)aKey defaultValue:(BOOL)defaultValue
{
    NSNumber *object = [self art_numberForKey:aKey];
    if (object != nil) {
        return [object boolValue];
    }
    return defaultValue;
}

- (BOOL)art_boolForKey:(id)aKey
{
    return [self art_boolForKey:aKey defaultValue:NO];
}

- (NSNumber *)art_numberForKey:(id)aKey defaultValue:(NSNumber *)defaultValue
{
    id object = [self art_objectForKey:aKey];
    if (![object isKindOfClass:[NSNumber class]]) {
        if ([object isKindOfClass:[NSString class]]) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *number = [formatter numberFromString:object];
            return ((number) ? number : defaultValue);
        }
        return defaultValue;
    }
    return object;
}

- (NSNumber *)art_numberForKey:(id)aKey
{
    return [self art_numberForKey:aKey defaultValue:nil];
}

- (NSString *)art_stringForKey:(id)aKey defaultValue:(NSString *)defaultValue
{
    id object = [self art_objectForKey:aKey];
    if (![object isKindOfClass:[NSString class]]) {
        if ([object isKindOfClass:[NSNumber class]]) {
            return [object stringValue];
        }
        return defaultValue;
    }
    return object;
}

- (NSString *)art_stringForKey:(id)aKey
{
    return [self art_stringForKey:aKey defaultValue:nil];
}

- (NSArray *)art_arrayForKey:(id)aKey defaultValue:(NSArray *)defaultValue
{
    id object = [self art_objectForKey:aKey];
    if (![object isKindOfClass:[NSArray class]]) {
        return defaultValue;
    }
    return object;
}

- (NSArray *)art_arrayForKey:(id)aKey
{
    return [self art_arrayForKey:aKey defaultValue:nil];
}

- (NSDictionary *)art_dictionaryForKey:(id)aKey defaultValue:(NSDictionary *)defaultValue
{
    id object = [self art_objectForKey:aKey];
    if (![object isKindOfClass:[NSDictionary class]]) {
        return defaultValue;
    }
    return object;
}

- (NSDictionary *)art_dictionaryForKey:(id)aKey
{
    return [self art_dictionaryForKey:aKey defaultValue:nil];
}

- (id)art_objectForKey:(id)aKey
{
    //判断键的值是否有效
    if ((aKey == nil) || (aKey == NULL)) {
        return nil;
    }
    if ([aKey isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    //获取字典中的键所对应的值
    id aValue = [self objectForKey:aKey];
    if ((aValue == nil) || (aValue == NULL)) {
        return nil;
    }
    if ([aValue isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return aValue;
}

-(NSString *)art_logStrDescription
{
    NSMutableString *logStr = [NSMutableString string];
    
    for (NSString *key in self.allKeys)
    {
        NSString *keyValue = [NSString stringWithFormat:@"%@=%@ ", key, [self art_objectForKey:key]];
        [logStr appendString:keyValue];
    }
    
    return logStr;
}

@end

