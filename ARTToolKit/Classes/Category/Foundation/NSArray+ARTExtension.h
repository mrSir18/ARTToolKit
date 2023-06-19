//
//  NSArray+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/19.
//

#import <Foundation/Foundation.h>

@interface NSArray (WXExtension)

/**
 * @brief 直接返回NSNumber值
 * @param index 数组中的元素下标
 * @param defaultValue 没有取到值时返回的默认值
 * @return NSNumber值
 */
- (NSNumber *)art_numberAtIndex:(NSInteger)index defaultValue:(NSNumber *)defaultValue;
- (NSNumber *)art_numberAtIndex:(NSInteger)index;


/**
 * @brief 直接返回NSString值
 * @param index 数组中的元素下标
 * @param defaultValue 没有取到值时返回的默认值
 * @return NSString值
 */
- (NSString *)art_stringAtIndex:(NSInteger)index defaultValue:(NSString *)defaultValue;
- (NSString *)art_stringAtIndex:(NSInteger)index;


/**
 * @brief 直接返回NSArray值
 * @param index 数组中的元素下标
 * @param defaultValue 没有取到值时返回的默认值
 * @return NSArray值
 */
- (NSArray *)art_arrayAtIndex:(NSInteger)index defaultValue:(NSArray *)defaultValue;
- (NSArray *)art_arrayAtIndex:(NSInteger)index;


/**
 * @brief 直接返回NSDictionary值
 * @param index 数组中的元素下标
 * @param defaultValue 没有取到值时返回的默认值
 * @return NSDictionary值
 */
- (NSDictionary *)art_dictionaryAtIndex:(NSInteger)index defaultValue:(NSDictionary *)defaultValue;
- (NSDictionary *)art_dictionaryAtIndex:(NSInteger)index;


/**
 * @brief 安全的objectAtIndex
 * @param index 数组中的元素下标
 * @return 取到的值
 */
- (id)art_objectAtIndex:(NSInteger)index;


@end

