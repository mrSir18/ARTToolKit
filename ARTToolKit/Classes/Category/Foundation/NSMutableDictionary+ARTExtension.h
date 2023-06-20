//
//  NSMutableDictionary+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (ARTExtension)

/*!
 * @brief 安全设置字典键值对
 * @param object 字典值
 * @param key    字典建
 */
- (void)art_setObject:(id)object forKey:(id<NSCopying>)key;

@end

NS_ASSUME_NONNULL_END
