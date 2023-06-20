//
//  NSURL+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSURL+ARTExtension.h"

@implementation NSURL (ARTExtension)

+ (instancetype)art_urlWithString:(NSString *)urlString {
    NSURL *url = [self URLWithString:urlString];
    if (url == nil && urlString.length > 0) {// urlString可能存在中文字符
        urlString = [urlString art_stringURLDecode];// 先解码(确保不会进行两次编码导致链接无法播放)
        urlString = [urlString art_stringURLEncode];// 再重新编码(确保链接中不会包含中文)
        url = [NSURL URLWithString:urlString];
    }
    return url;
}

@end
