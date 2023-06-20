//
//  NSNumber+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSNumber+ARTExtension.h"

@implementation NSNumber (ARTExtension)

// 容错方法，避免出现上层由于数据类型原因导致调用NSString的length方法而引起的crash，勿直接调用
- (NSInteger)length
{
    return [[NSString stringWithFormat:@"%@", self] length];
}

@end
