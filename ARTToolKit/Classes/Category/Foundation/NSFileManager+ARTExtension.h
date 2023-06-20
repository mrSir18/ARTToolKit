//
//  NSFileManager+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ARTExtension)

/*!
 * @brief document文件夹路径
 */
+ (NSString *)art_documentFilePath;


/*!
 * @brief 系统剩余空间(返回字符串)
 */
+ (NSString *)art_remainCapacityString;


/*!
 * @brief 系统剩余空间(返回基本数据类型)
 */
+ (long long)art_remainCapacityNumber;


@end
