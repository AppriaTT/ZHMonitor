//
//  UIView+ZH.m
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "UIView+ZHMonitor.h"
#import "ZHUserMonitorManager.h"
#import "NSObject+AOP.h"
@interface UIView ()
//增加一个成员变量,用来判断上一次点击的时间 过滤重复输出
@property (nonatomic,assign)NSTimeInterval lastClickTime;

@end

@implementation UIView (ZHMonitor)
+(void)load
{
    //交换两个方法
             [UIButton changeMethod:@selector(zhMonitor_hitTest:withEvent:) newMethod:@selector(hitTest:withEvent:)];
}

#pragma mark 增加的属性
//增加一个成员变量,用来判断上一次点击的时间 过滤重复输出
//增加属性 lastClickKey
const char lastClickKey;
- (void)setLastClickTime:(NSTimeInterval)lastClickTime
{
    objc_setAssociatedObject(self, &lastClickKey, @(lastClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)lastClickTime
{
    return [objc_getAssociatedObject(self, &lastClickKey) doubleValue];
}

//给UIVIew增加一个eventId这个成员变量
const char eventIdKey;
- (void)setEventId:(NSString *)eventId
{
    objc_setAssociatedObject(self, &eventIdKey, eventId, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)eventId
{
    return objc_getAssociatedObject(self, &eventIdKey);
}
#pragma mark 增加的方法
- (UIView *)zhMonitor_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIButton *btn = (id)[self zhMonitor_hitTest:point withEvent:event];
    if ([NSStringFromClass(btn.class) isEqualToString:@"UIButton"]||[NSStringFromClass(btn.class) isEqualToString:@"UITabBarButton"]) {
        //过滤重复点击
        if (event.timestamp - self.lastClickTime > 0.1) {
#warning add monitor code here & post INFO to server
            
            //只要存在eventId就进行监控, 后期进行更加智能的整改
            if (btn.eventId) {
                MHLog(@"%@%@被点击了%s %f",btn,btn.eventId,__FUNCTION__,event.timestamp);
                [[ZHUserMonitorManager sharedManager]eventTrace:btn.eventId];
            }
            //记录点击的时间用于过滤重复行为
            self.lastClickTime = event.timestamp;
           
        }
    }
    return btn;
}

@end
