//
//  UINavigationController+ZHMonitor.m
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "UINavigationController+ZHMonitor.h"
#import "NSObject+AOP.h"
@implementation UINavigationController (ZHMonitor)

+(void)load
{
    [UINavigationController changeMethod:@selector(zhMonitor_pushViewController:animated:) newMethod:@selector(pushViewController:animated:)];
    
    [UINavigationController changeMethod:@selector(zhMonitor_popViewControllerAnimated:) newMethod:@selector(popViewControllerAnimated:)];
}


-(void)zhMonitor_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"进入%@ 页面",viewController);
    [self zhMonitor_pushViewController:viewController animated:animated];
}

- (UIViewController *)zhMonitor_popViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewC = [self zhMonitor_popViewControllerAnimated:animated];
    NSLog(@"离开%@",viewC);
    return viewC;
}
@end
