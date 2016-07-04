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
- (void)crashTrace{
    //注册崩溃方法
    NSSetUncaughtExceptionHandler(&ZHCatchCrashUncaughtExceptionHandler);
}
- (void)uploadCrashLog{
#warning upload code waiting
    [ZHCatchCrash getErrorFilePath];
}

@end




@implementation ZHCatchCrash

void ZHCatchCrashUncaughtExceptionHandler(NSException *exception)

{
    
    // 异常的堆栈信息
    
    NSArray *stackArray = [exception callStackSymbols];
    
    // 出现异常的原因
    
    NSString *reason = [exception reason];
    
    // 异常名称
    
    NSString *name = [exception name];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    
    MHLog(@"%@", exceptionInfo);
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    
    [tmpArr insertObject:reason atIndex:0];
    
    //保存到本地  --  当然你可以在下次启动的时候，上传这个log
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),ZHAnalysisErrorFileName];
    [exceptionInfo writeToFile:filePath  atomically:YES encoding:NSUTF8StringEncoding error:nil];
    MHLog(@"logPath:%@",filePath);
}

+(NSString *)getErrorFilePath{
    return [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),ZHAnalysisErrorFileName];
}
@end  
