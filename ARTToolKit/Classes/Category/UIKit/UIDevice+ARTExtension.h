//
//  UIDevice+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <UIKit/UIKit.h>

@interface UIDevice (ARTExtension)

/*!
 * @brief 当前设备的总计磁盘空间
 */
- (NSNumber *)art_totalDiskSpace;

/*!
 * @brief 当前设备的可用磁盘空间
 */
- (NSNumber *)art_freeDiskSpace;

/*!
 * @brief 当前设备的mac地址
 */
- (NSString *)art_macaddress;

/*!
 * @brief 当前设备的平台类型
 */
- (NSString *)art_platform;

/*!
 * @brief 当前设备的设备类型
 */
- (NSString *)art_hwmodel;

/*!
 * @brief 当前设备的CPU数量
 */
- (unsigned int)art_countofCores;

/*!
 * @brief 当前设备的CPU使用量
 */
- (float)art_cpuUsage;

/*!
 * @brief 当前设备的运行内存
 */
- (long long)art_totalMemorySize;

/*!
 * @brief 当前设备的用户使用内存
 */
- (int64_t)art_usedMemory;

@end
