//
//  ZHUserMonitorManager.h
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  导入此头文件 根据后台配置 默认开启监控
 */
@interface ZHUserMonitorManager : NSObject
/**
 (此功能无效 后期可改, 前期为自动匹配debug或者release)
 
 设置是否打印log信息, 默认NO(不打印log).
 @param value 设置为YES,umeng SDK 会输出log信息可供调试参考. 除非特殊需要，否则发布产品时需改回NO.
 @return void.
*/
@property (nonatomic,assign,getter=isLogEnable) BOOL logEnable;
/**
 *  后期加入
 */
@property (nonatomic,assign,getter=isMonitorEnable) BOOL monitorEnable;

+(instancetype)sharedManager;


///---------------------------------------------------------------------------------------
/// @name  事件统计
///---------------------------------------------------------------------------------------

/** 自定义事件点击,数量统计.
  @param  eventId 后台上注册的事件Id.传入 统一由管理判断是否需要监控 上传
  */
- (void)eventTrace:(NSString *)eventId; //等同于 event:eventId label:eventId;

///---------------------------------------------------------------------------------------
/// @name  页面计时
///---------------------------------------------------------------------------------------
/** 手动页面时长统计, 记录某个页面展示的时长.
 @param pageName 统计的页面名称.
 @param seconds 单位为秒，int型.
 @return void.
 */
//- (void)logPageView:(NSString *)pageName seconds:(int)seconds;

@end
