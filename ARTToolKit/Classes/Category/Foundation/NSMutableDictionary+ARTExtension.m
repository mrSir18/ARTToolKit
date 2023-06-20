//
//  NSMutableDictionary+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSMutableDictionary+ARTExtension.h"

@implementation NSMutableDictionary (ARTExtension)

- (void)art_setObject:(id)object forKey:(id<NSCopying>)key
{
    if ((object != nil) && (key != nil)) {
        [self setObject:object forKey:key];
    }
}

@end
