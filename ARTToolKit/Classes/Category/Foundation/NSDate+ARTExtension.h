//
//  NSDate+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSDate (ARTExtension)

#pragma mark - API Formatter Utils
/*!
 * @brief  获取Date的字符串表示值(yyyy-MM-dd HH:mm:ss)
 * @param  dateFormat 格式化Date的字符串格式
 * @return 返回Date的字符串表示值
 */
- (NSString *)art_stringWithDateFormat:(NSString *)dateFormat;


/*!
 * @brief  获取Date的字符串表示值(yyyy-MM-dd HH:mm:ss)
 * @return 返回Date的字符串表示值
 */
- (NSString *)art_dateString;


#pragma mark - API Calendar Utils
/*!
 * @brief  获取当前Date所处月份的第一天
 * @return Date所处月份的第一天
 */
- (NSDate *)art_firstDayOfCurrentMonth;


/*!
 * @brief  获取当前Date所处月份的总天数
 * @return Date所处月份的总天数
 */
- (NSUInteger)art_daysOfCurrentMonth;


#pragma mark - API Basic Utils
/*!
 * @brief  获取Date的当前年份
 * @return Date的当前年份
 */
- (NSInteger)art_getYear;


/*!
 * @brief  获取Date的当前月份
 * @return Date的当前月份
 */
- (NSInteger)art_getMonth;


/*!
 * @brief  获取Date的当前日期
 * @return Date的当前日期
 */
- (NSInteger)art_getDay;


/*!
 * @brief  确定某天是一周的第几天，注意第一天为周日
 * @return 确定某天是一周的第几天，注意第一天为周日
 */
- (NSUInteger)art_getWeekly;


/*!
 * @brief  获取Date的当前时钟数
 * @return Date的当前时钟数
 */
- (NSInteger)art_getHour;


/*!
 * @brief  获取Date的当前分钟数
 * @return Date的当前分钟数
 */
- (NSInteger)art_getMinute;


/*!
 * @brief  获取Date的当前秒钟数
 * @return Date的当前秒钟数
 */
- (NSInteger)art_getSecond;


#pragma mark - API Class Utils
/*!
 * @brief  获取当前时间戳的[毫秒级]字符串值
 * @return 当前时间戳的[毫秒级]字符串值
 */
+ (NSString *)art_getMsecTimeslotString;


/*!
 * @brief  获取当前时间戳的[秒级]字符串值
 * @return 当前时间戳的[秒级]字符串值
 */
+ (NSString *)art_getTimeslotString;


@end
