//
//  NSMutableArray+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSMutableArray+ARTExtension.h"

@implementation NSMutableArray (ARTExtension)

- (void)art_insertObject:(id)object atIndex:(NSInteger)index
{
    if ((index <= self.count) && (object != nil)) {
        [self insertObject:object atIndex:index];
    }
}

- (void)art_addObject:(id)object
{
    if ((object != nil) && (object != NULL)) {
        [self addObject:object];
    }
}

@end
