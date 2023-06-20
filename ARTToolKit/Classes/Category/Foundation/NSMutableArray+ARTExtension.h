//
//  NSMutableArray+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ARTExtension)

/*!
 * @brief 将某元素插入到数组指定的下标位置
 * @param object 要插入的对象
 * @param index  指定的下标
 */
- (void)art_insertObject:(id)object atIndex:(NSInteger)index;


/*!
 * @brief 向数组中添加object(内部做了容错处理)
 * @param object 要添加的对象
 */
- (void)art_addObject:(id)object;


@end
