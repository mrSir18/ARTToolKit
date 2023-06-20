//
//  NSFileManager+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSFileManager+ARTExtension.h"
#import <UIKit/UIKit.h>

@implementation NSFileManager (ARTExtension)

+ (NSString *)art_documentFilePath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


+ (NSString *)art_remainCapacityString
{
    CGFloat remainSize =[self art_remainCapacityNumber] / 1024.0 / 1024.0 / 1024.0;
    if (remainSize < 1)
    {
        return [NSString stringWithFormat:@"%0.1fM",remainSize * 1024];
    }
    return [NSString stringWithFormat:@"%0.1fG",remainSize];
}


+ (long long)art_remainCapacityNumber
{
    NSString *documentFilePath =[self art_documentFilePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:documentFilePath error:nil];
    NSNumber *remainCapacity = [fileSysAttributes objectForKey:NSFileSystemFreeSize];
    return [remainCapacity longLongValue];
}

@end
