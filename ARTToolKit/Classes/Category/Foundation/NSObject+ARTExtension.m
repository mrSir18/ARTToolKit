//
//  NSObject+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSObject+ARTExtension.h"
#import <objc/runtime.h>

@implementation NSObject (ARTExtension)

@end

@implementation NSObject (ARTThread)

- (void)art_runBlockInMainThreadFastestLoop:(void (^)(void))block
{
    if ([NSThread isMainThread] == YES) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

@end

@implementation ARTDelayProxy
- (instancetype)initWithTarget:(id)target
{
    if (self = [super init]) {
        
        self.target = target;
    }
    return self;
}

#pragma mark - 消息转发
-(id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    anInvocation.selector = @selector(unuseSelector);
    [anInvocation invokeWithTarget:self];
}

- (void)unuseSelector
{
    
}

@end

@implementation NSObject (ARTDelayedCategory)


/** 使用方式同performSelector ,自动打破循环引用 */
-(void)art_performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay
{
    if (!self.art_delayProxy)
    {
        self.art_delayProxy = [[ARTDelayProxy alloc]initWithTarget:self];
    }
    [self.art_delayProxy performSelector:aSelector withObject:anArgument afterDelay:delay];
}

-(void)art_cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(nullable id)anArgument
{
    if (self.art_delayProxy)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self.art_delayProxy selector:aSelector object:anArgument];
    }
}

- (void)art_cancelDelay
{
    if (self.art_delayProxy)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self.art_delayProxy];
    }
}

- (void)setArt_delayProxy:(ARTDelayProxy *)art_delayProxy
{
    objc_setAssociatedObject(self, @selector(art_delayProxy), art_delayProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ARTDelayProxy *)art_delayProxy
{
    ARTDelayProxy *art_delayProxy = objc_getAssociatedObject(self,  @selector(art_delayProxy));
    return art_delayProxy;
}

@end
