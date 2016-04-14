//
//  ZHUserMonitorManager.m
//  ZHTraceDemo
//
//  Created by arron on 16/4/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "ZHUserMonitorManager.h"
#import "ZHMonitorRequest.h"
@implementation ZHUserMonitorManager
{
    /**
     *  保存需要监控的这些按钮id
     */
    NSMutableArray *_monitorIds;
}
static ZHUserMonitorManager * _singleton = nil;

+(instancetype)sharedManager
{
    if (!_singleton) {
        _singleton = [[ZHUserMonitorManager alloc]init];
        //初始化按钮清单
        [_singleton initMonitorData];
    }
    return _singleton;
}

- (void)initMonitorData
{
    //读取后台所需监控的eventId数据
    NSMutableArray *idsArray = [ZHMonitorRequest monitorEventIds];
    
    _monitorIds = idsArray;
}

- (void)eventTrace:(NSString *)eventId
{
    //先进行判定是否要进行监控
    
    //进行数据上传 监控
    [ZHMonitorRequest postEvent:eventId];
}
@end
