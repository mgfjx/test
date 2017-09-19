//
//  UISlider+Logo.m
//  Unity
//
//  Created by mgfjx on 2017/9/19.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "UISlider+Logo.h"

@interface UISlider ()

@property (nonatomic, strong) UILabel *logoView;

@end

@implementation UISlider (Logo)

- (void)properties {
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Ivar var = ivars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//        id objc = object_getIvar(self, var);
//        NSLog(@"key: %@, objc: %@", key, objc);
        if ([key isEqualToString:@"_innerThumbView"]) {
            
//            id thumbView = object_getIvar(self, var);
//            NSLog(@"%@",thumbView);
            
        }
    }
    free(ivars);
    
    unsigned int methodCount ;
    Method *methods = class_copyMethodList([self class], &methodCount);
    NSLog(@"共有%u方法", methodCount);
    
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        
        SEL name = method_getName(method);
//        NSLog(@"%@", NSStringFromSelector(name));
        NSString *nameStr = NSStringFromSelector(name);
        if ([nameStr isEqualToString:@"_thumbView"]) {
            NSLog(@"%@", NSStringFromSelector(name));
            
            
            
        }
        
    }
    
}

/* ----------------------------------------------------------- */

+ (void)load{
    
    Method begin1 = class_getInstanceMethod([self class], @selector(beginTrackingWithTouch:withEvent:));
    Method begin2 = class_getInstanceMethod([self class], @selector(XCbeginTrackingWithTouch:withEvent:));
    method_exchangeImplementations(begin1, begin2);
    
    Method continue1 = class_getInstanceMethod([self class], @selector(continueTrackingWithTouch:withEvent:));
    Method continue2 = class_getInstanceMethod([self class], @selector(XCcontinueTrackingWithTouch:withEvent:));
    method_exchangeImplementations(continue1, continue2);
    
    Method end1 = class_getInstanceMethod([self class], @selector(endTrackingWithTouch:withEvent:));
    Method end2 = class_getInstanceMethod([self class], @selector(XCendTrackingWithTouch:withEvent:));
    method_exchangeImplementations(end1, end2);
    
    Method cancel1 = class_getInstanceMethod([self class], @selector(cancelTrackingWithEvent:));
    Method cancel2 = class_getInstanceMethod([self class], @selector(XCcancelTrackingWithEvent:));
    method_exchangeImplementations(cancel1, cancel2);
}

- (BOOL)XCbeginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    NSLog(@"%@", NSStringFromSelector(_cmd));
    
//    unsigned int outCount;
//    Ivar *ivars = class_copyIvarList([self class], &outCount);
//    for (int i = 0; i < outCount; i++) {
//        Ivar var = ivars[i];
//        const char *name = ivar_getName(var);
//        NSString *key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//        const char *type = ivar_getTypeEncoding(var);
//        NSLog(@"key: %s, type: %s", name, type);
//        
//        if ([key isEqualToString:@"_thumbViewNeue"]) {
//            id value = object_getIvar(self, var);
//            NSLog(@"%@", value);
//        }
//        
//    }
//    free(ivars);
    
    self.logoView.hidden = NO;
    
    Ivar ivar = class_getInstanceVariable([self class], "_thumbViewNeue");
    UIView *thumbView = object_getIvar(self, ivar);
    NSLog(@"%@",[thumbView class]);
    
    CGRect frame = self.logoView.frame;
    CGFloat thumbSize = thumbView.size.width;
    
    self.logoView.frame = CGRectMake(thumbView.frame.origin.x + thumbSize/2 - frame.size.width/2, thumbView.frame.origin.y - frame.size.height , frame.size.width, frame.size.height);
    
    return [self XCbeginTrackingWithTouch:touch withEvent:event];
}

- (BOOL)XCcontinueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.logoView.text = [@(self.value) stringValue];
    
    Ivar ivar = class_getInstanceVariable([self class], "_thumbViewNeue");
    UIView *thumbView = object_getIvar(self, ivar);
    thumbView.backgroundColor = [UIColor randomColorWithAlpha:0.5];
    NSLog(@"%@",NSStringFromCGRect(thumbView.frame));
    
    CGRect frame = self.logoView.frame;
    CGFloat thumbSize = thumbView.size.width;
    
    [UIView animateWithDuration:0.15 animations:^{
        self.logoView.frame = CGRectMake(thumbView.frame.origin.x + thumbSize/2 - frame.size.width/2, thumbView.frame.origin.y - frame.size.height , frame.size.width, frame.size.height);
    }];
    
    return [self XCcontinueTrackingWithTouch:touch withEvent:event];
}

- (void)XCendTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    self.logoView.hidden = YES;
    
    Ivar ivar = class_getInstanceVariable([self class], "_thumbViewNeue");
    UIView *thumbView = object_getIvar(self, ivar);
    thumbView.backgroundColor = [UIColor randomColorWithAlpha:0.5];
    NSLog(@"%@",NSStringFromCGRect(thumbView.frame));
    
    CGRect frame = self.logoView.frame;
    CGFloat thumbSize = thumbView.size.width;
    
    self.logoView.frame = CGRectMake(thumbView.frame.origin.x + thumbSize/2 - frame.size.width/2, thumbView.frame.origin.y - frame.size.height , frame.size.width, frame.size.height);
    
    [self XCendTrackingWithTouch:touch withEvent:event];
}

- (void)XCcancelTrackingWithEvent:(UIEvent *)event{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    self.logoView.hidden = YES;
    
    [self XCcancelTrackingWithEvent:event];
}

- (void)changeLocation:(UITouch *)touch {
    
    
    
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    if (self.superview) {
        NSLog(@"%@", self.logoView);
    }
    
}

// 添加logoView 属性
static char *logoViewKey = "logoViewKey";
static char *showLogoViewKey = "showLogoViewKey";

- (void)setLogoView:(UIView *)logoView {
    objc_setAssociatedObject(self, logoViewKey, logoView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIView *)logoView {
    return objc_getAssociatedObject(self, logoViewKey);
}

- (void)setShowLogoView:(BOOL)showLogoView {
    objc_setAssociatedObject(self, showLogoViewKey, @(showLogoView), OBJC_ASSOCIATION_ASSIGN);
    
    if (!showLogoView) return;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 60, 30);
    label.backgroundColor = [UIColor randomColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.hidden = YES;
    [self addSubview:label];
    
    self.logoView = label;
}

- (BOOL)showLogoView{
    return [objc_getAssociatedObject(self, showLogoViewKey) boolValue];
}

@end
