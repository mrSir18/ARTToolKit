//
//  CALayer+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/19.
//

#import "CALayer+ARTExtension.h"

@implementation CALayer (WXExtension)

- (void)setArt_borderColor:(UIColor *)borderUIColor
{
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *)art_borderColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
