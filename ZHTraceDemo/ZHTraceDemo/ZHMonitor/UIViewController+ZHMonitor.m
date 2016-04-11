//
//  UIViewController+ZHMonitor.m
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "UIViewController+ZHMonitor.h"
#import "ZHUserMonitorManager.h"
#import "NSObject+AOP.h"
@implementation UIViewController (ZHMonitor)
+(void)load
{
    //交换两个方法
    [UIViewController changeMethod:@selector(zhMonitor_presentViewController:animated:completion:) newMethod:@selector(presentViewController:animated:completion:)];
    
    [UIViewController changeMethod:@selector(zhMonitor_dismissViewControllerAnimated:completion:) newMethod:@selector(dismissViewControllerAnimated:completion:)];
}

-(void)zhMonitor_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    NSLog(@"推出了%@",viewControllerToPresent);
    [self zhMonitor_presentViewController:viewControllerToPresent animated:flag completion:(void (^)(void))completion];
    
}
- (void)zhMonitor_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    NSLog(@"离开页面 停留时间...待功能完善");
    [self zhMonitor_dismissViewControllerAnimated:flag completion:(void (^)(void))completion];
}
@end
