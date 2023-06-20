//
//  NSArray+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/19.
//

#import "NSArray+ARTExtension.h"

@implementation NSArray (ARTExtension)

- (NSNumber *)art_numberAtIndex:(NSInteger)index defaultValue:(NSNumber *)defaultValue
{
    id object = [self art_objectAtIndex:index];
    if (![object isKindOfClass:[NSNumber class]]) {
        if ([object isKindOfClass:[NSString class]]) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *number = [formatter numberFromString:object];
            if (number) {
                return number;
            } else {
                return defaultValue;
            }
        }
        return defaultValue;
    }
    return object;
}

- (NSNumber *)art_numberAtIndex:(NSInteger)index
{
    return [self art_numberAtIndex:index defaultValue:nil];
}

- (NSString *)art_stringAtIndex:(NSInteger)index defaultValue:(NSString *)defaultValue
{
    id object = [self art_objectAtIndex:index];
    if (![object isKindOfClass:[NSString class]]) {
        if ([object isKindOfClass:[NSNumber class]]) {
            return [object stringValue];
        }
        return defaultValue;
    }
    return object;
}

- (NSString *)art_stringAtIndex:(NSInteger)index
{
    return [self art_stringAtIndex:index defaultValue:nil];
}

- (NSArray *)art_arrayAtIndex:(NSInteger)index defaultValue:(NSArray *)defaultValue
{
    id array = [self art_objectAtIndex:index];
    if (![array isKindOfClass:[NSArray class]]) {
        return defaultValue;
    }
    return array;
}

- (NSArray *)art_arrayAtIndex:(NSInteger)index
{
    return [self art_arrayAtIndex:index defaultValue:nil];
}

- (NSDictionary *)art_dictionaryAtIndex:(NSInteger)index defaultValue:(NSDictionary *)defaultValue
{
    id object = [self art_objectAtIndex:index];
    if (![object isKindOfClass:[NSDictionary class]]) {
        return defaultValue;
    }
    return object;
}

- (NSDictionary *)art_dictionaryAtIndex:(NSInteger)index
{
    return [self art_dictionaryAtIndex:index defaultValue:nil];
}

- (id)art_objectAtIndex:(NSInteger)index
{
    id object = nil;
    if (index < self.count)
    {
        if (index >= 0)
        {
            object = [self objectAtIndex:index];
        }
    }
    return object;
}

@end
