//
//  NSObject+AOP.m
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "NSObject+AOP.h"

@implementation NSObject (AOP)
+ (void)changeMethod:(SEL)oldMethod newMethod:(SEL)newMethod
{
    Method oldM = class_getInstanceMethod([self class], oldMethod);
    Method newM = class_getInstanceMethod([self class], newMethod);
    method_exchangeImplementations(oldM, newM);
}

@end
