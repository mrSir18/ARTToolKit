//
//  NSObject+ARTExtension.h
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import <Foundation/Foundation.h>

@interface NSObject (ARTExtension)

@end


@interface NSObject (ARTThread)

/*!
 * @brief 切主线程执行（本身主线程直接执行）
 */
- (void)art_runBlockInMainThreadFastestLoop:(void (^)(void))block;

@end

@class ARTDelayProxy;
@interface NSObject (ARTDelayedCategory)
@property (nonatomic, strong) ARTDelayProxy *art_delayProxy;

/*!
 * @brief 使用方式同performSelector ,自动打破循环引用
 */
-(void)art_performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;

-(void)art_cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(nullable id)anArgument;

- (void)art_cancelDelay;

@end

@interface ARTDelayProxy : NSObject

@property (nonatomic, weak) id target;

- (instancetype)initWithTarget:(id)target;

@end
