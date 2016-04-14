//
//  UIView+ZH.h
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  用于检测button的点击
 */
@interface UIView (ZHMonitor)
/**
 *  事件的Id, 方便后台记录按钮
 */
@property (nonatomic,copy)NSString *eventId;
/**
 *
 *  给UIVIew设置一个eventId
 *  @param eventId 事件的ID
 */
- (void)setEventId:(NSString *)eventId;
@end
