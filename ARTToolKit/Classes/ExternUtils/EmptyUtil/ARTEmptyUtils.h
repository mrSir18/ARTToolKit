//
//  ARTEmptyUtils.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARTEmptyUtils : NSObject

/*!
 * @brief  判断目标值是否为空值,包含:nil/NULL/[NSNull null]
 * @return 传入对象是否是空对象
 */
+ (BOOL)isEmptyTarget:(id)target;


/*!
 * @brief 判断对象是否为空Number对象
 * @return:flag 校对后的结果
 */
+ (BOOL)isEmptyNumber:(id)object;


/*!
 * @brief 判断对象是否为空String对象
 * @return:flag 校对后的结果
 */
+ (BOOL)isEmptyString:(id)object;


/*!
 * @brief 判断对象是否为空白String对象
 * 包含：[NSNull null]、NULL、nil
 *      @""、@" "、@"  "等等
 * @return:flag 校对后的结果
 */
+ (BOOL)isBlankString:(id)object;


/*!
 * @brief 判断对象是否为空Data对象
 * @return:flag 校对后的结果
 */
+ (BOOL)isEmptyData:(id)object;


/*!
 * @brief 判断对象是否为空Dictionary对象
 * @return:flag 校对后的结果
 */
+ (BOOL)isEmptyDictionary:(id)object;


/*!
 * @brief 判断对象是否为空Array对象
 * @return:flag 校对后的结果
 */
+ (BOOL)isEmptyArray:(id)object;

@end

NS_ASSUME_NONNULL_END
