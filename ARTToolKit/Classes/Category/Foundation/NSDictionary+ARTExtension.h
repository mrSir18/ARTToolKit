//
//  NSDictionary+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ARTExtension)

/*!
 * @brief 获取字典中NSInteger类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的NSInteger值
 */
- (NSInteger)art_integerForKey:(id)aKey defaultValue:(NSInteger)defaultValue;
- (NSInteger)art_integerForKey:(id)aKey;


/*!
 * @brief 获取字典中double类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的double值
 */
- (double)art_doubleForKey:(id)aKey defaultValue:(double)defaultValue;
- (double)art_doubleForKey:(id)aKey;


/*!
 * @brief 获取字典中float类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的float值
 */
- (float)art_floatForKey:(id)aKey defaultValue:(float)defaultValue;
- (float)art_floatForKey:(id)aKey;


/*!
 * @brief 获取字典中long类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的long值
 */
- (long)art_longForKey:(id)aKey defaultValue:(long)defaultValue;
- (long)art_longForKey:(id)aKey;


/*!
 * @brief 获取字典中BOOL类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的BOOL值
 */
- (BOOL)art_boolForKey:(id)aKey defaultValue:(BOOL)defaultValue;
- (BOOL)art_boolForKey:(id)aKey;


/*!
 * @brief 获取字典中NSNumber类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的NSNumber对象
 */
- (NSNumber *)art_numberForKey:(id)aKey defaultValue:(NSNumber *)defaultValue;
- (NSNumber *)art_numberForKey:(id)aKey;


/*!
 * @brief 获取字典中NSString类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的NSString对象
 */
- (NSString *)art_stringForKey:(id)aKey defaultValue:(NSString *)defaultValue;
- (NSString *)art_stringForKey:(id)aKey;


/*!
 * @brief 获取字典中NSArray类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的NSArray对象
 */
- (NSArray *)art_arrayForKey:(id)aKey defaultValue:(NSArray *)defaultValue;
- (NSArray *)art_arrayForKey:(id)aKey;


/*!
 * @brief 获取字典中NSDictionary类型的Value
 * @param aKey 字典中的索引建
 * @param defaultValue 没有取到值时返回的默认值
 * @return 获取的NSDictionary对象
 */
- (NSDictionary *)art_dictionaryForKey:(id)aKey defaultValue:(NSDictionary *)defaultValue;
- (NSDictionary *)art_dictionaryForKey:(id)aKey;


/*!
 * @brief 获取字典中[非空]的Value
 * @param aKey 字典中的索引建
 * @return 获取的[非空]对象
 */
- (id)art_objectForKey:(id)aKey;


/*!
 * @brief 转化为“key=value key=value”形式
 * @return 获取的字符串
 */
-(NSString *)art_logStrDescription;

@end

