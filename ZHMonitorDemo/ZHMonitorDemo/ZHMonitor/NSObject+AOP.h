//
//  NSObject+AOP.h
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (AOP)

/**
 *  交换两个方法
 */
+ (void)changeMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
@end
