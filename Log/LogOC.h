//
//  LogMacro.h
//  Log
//
//  Created by WG on 2016/12/12.
//  Copyright © 2016年 WG. All rights reserved.
//

#ifndef LogMacro_h
#define LogMacro_h

#import "CocoaLumberjack.h"

/*
 日志接口说明：
 1.LogEvent，仅限重要信息，包括通信，操作，错误，关键业务和功能，异常
 2.LogInfo，信息类日志
 3.LogDebug，开发自用
 */

#if DEBUG
static DDLogLevel ddLogLevel=DDLogLevelDebug;
#else
static DDLogLevel ddLogLevel=DDLogLevelInfo;
#endif

#define logEvent(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define logInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define logDebug(frmt, ...)   LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#endif /* LogMacro_h */
