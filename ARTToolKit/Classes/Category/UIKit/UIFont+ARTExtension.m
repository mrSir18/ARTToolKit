//
//  UIFont+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "UIFont+ARTExtension.h"

@implementation UIFont (ARTExtension)

+ (UIFont *)art_fontPingFangSCWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (UIFont *)art_fontPingFangSCMediumWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}

+ (UIFont *)art_fontPingFangSCSemiboldWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
}

@end
