//
//  UIView+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

static char kARTActionHandlerTapBlockKey;
static char kARTActionHandlerTapGestureKey;

#import "UIView+ARTExtension.h"
#import <objc/runtime.h>

@implementation UIView (ARTExtension)

- (void)setArt_top:(CGFloat)art_top
{
    CGRect frame = self.frame;
    frame.origin.y = art_top;
    self.frame = frame;
}

- (CGFloat)art_top
{
    return self.frame.origin.y;
}

- (void)setArt_left:(CGFloat)art_left
{
    CGRect frame = self.frame;
    frame.origin.x = art_left;
    self.frame = frame;
}

- (CGFloat)art_left
{
    return self.frame.origin.x;
}

- (void)setArt_right:(CGFloat)art_right
{
    CGRect frame = self.frame;
    frame.origin.x = art_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)art_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setArt_bottom:(CGFloat)art_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = art_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)art_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setArt_centerX:(CGFloat)art_centerX
{
    self.center = CGPointMake(art_centerX, self.center.y);
}

- (CGFloat)art_centerX
{
    return self.center.x;
}

- (void)setArt_centerY:(CGFloat)art_centerY
{
    self.center = CGPointMake(self.center.x, art_centerY);
}

- (CGFloat)art_centerY
{
    return self.center.y;
}

- (void)setArt_width:(CGFloat)art_width
{
    CGRect frame = self.frame;
    frame.size.width = art_width;
    self.frame = frame;
}

- (CGFloat)art_width
{
    return self.frame.size.width;
}

- (void)setArt_height:(CGFloat)art_height
{
    CGRect frame = self.frame;
    frame.size.height = art_height;
    self.frame = frame;
}

- (CGFloat)art_height
{
    return self.frame.size.height;
}

- (void)setArt_origin:(CGPoint)art_origin
{
    CGRect frame = self.frame;
    frame.origin = art_origin;
    self.frame = frame;
}

- (CGPoint)art_origin
{
    return self.frame.origin;
}

- (void)setArt_size:(CGSize)art_size
{
    CGRect frame = self.frame;
    frame.size = art_size;
    self.frame = frame;
}

- (CGSize)art_size
{
    return self.frame.size;
}

- (UIViewController *)art_viewController
{
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)art_removeAllSubviews
{
    while (self.subviews.count) {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

+ (id)art_loadFromNib
{
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
}

- (void)art_setTapActionWithBlock:(void (^)(void))block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kARTActionHandlerTapGestureKey);
    
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__ARThandleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kARTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kARTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__ARThandleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kARTActionHandlerTapBlockKey);
        
        if (action)
        {
            action();
        }
    }
}


#pragma mark - UIView Animation
- (void)art_transformScaleAnimation
{
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@(0.01),@(1.2),@(0.9),@(1.0)];
    scaleAnimation.duration = 0.4f;
    scaleAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                       ];
    [self.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

#pragma mark - Gradient Tool
/*!
 * @brief 设置默认的渐变色 红->橙
 *
 */
- (void)art_setDefaultGradientColor {
    
    [self art_setGradientColorWithStartColor:[UIColor art_colorWithHEXValue:0xf13232] endColor:[UIColor art_colorWithHEXValue:0xf0773c] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
}

- (void)art_setGradientColorWithStartColor:(UIColor *)startColor
                              endColor:(UIColor *)endColor
                            startPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint {
   
    ARTGradientView * gradientView = nil;
    if(self.art_gradientView){
        
        gradientView = (ARTGradientView *)self.art_gradientView;
   
    }else{
       
        gradientView = [[ARTGradientView alloc]init];
        gradientView.frame = self.bounds;
        gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:gradientView];
        [self sendSubviewToBack:gradientView];
        gradientView.userInteractionEnabled = NO;
    }
    
    CAGradientLayer * layer = (CAGradientLayer *)gradientView.layer;
    layer.colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    layer.locations = @[@0.0,@1.0];
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    layer.cornerRadius = self.layer.cornerRadius;
    self.art_gradientView = gradientView;
    
}

- (void)art_removeGradientColor {

    [self.art_gradientView removeFromSuperview];
    self.art_gradientView = nil;
}

- (void)setArt_gradientView:(UIView * _Nullable)art_gradientView {

    objc_setAssociatedObject(self, @selector(art_gradientView), art_gradientView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UIView *)art_gradientView {
 
  return  objc_getAssociatedObject(self, @selector(art_gradientView));
}

@end

@implementation ARTGradientView

+ (Class)layerClass {
   
    return [CAGradientLayer class];
}

@end
