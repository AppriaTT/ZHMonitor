//
//  ZHMonitorRequest.h
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  监测所需的网络请求都由此类发出
 */
@interface ZHMonitorRequest : NSObject
/**
 *  请求所需监控的eventIds
 *
 *  @return 返回数据
 */
+(NSMutableArray *)monitorEventIds;

/**
 *  告诉后台 监控事件 被触发了
 */
+ (void)postEvent:(NSString *)eventId;
@end
