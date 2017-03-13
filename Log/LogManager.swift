//
//  LogManager.swift
//  Log
//
//  Created by WG on 2016/12/12.
//  Copyright © 2016年 WG. All rights reserved.
//

/*
 日志接口说明：
 1.logEvent，仅限重要信息，包括通信，操作，错误，关键业务和功能，异常
 2.logInfo，信息类日志
 3.logDebug，开发自用
 
 
 日志过滤级别说明
 现在仅支持DDLogLevel中的3种Warning，DDLogLevelInfo，DDLogLevelDebug
 1.DDLogLevelWarning
 仅LogEvent有效
 2.DDLogLevelInfo
 仅LogEvent和LogInfo有效。
 3.DDLogLevelDebug
 LogEvent，LogEvent和LogInfo有效均有效
 */

let _rollingFrequency=3600*24*7
let _maximumFileSize=64*1024*1024
let _logDateFormat="MM-dd HH:mm:ss:SSS"

import Foundation

class LogManager:NSObject{
    
    override init(){
        super.init()
        
        defaultDebugLevel = ddLogLevel
        //        ddLogLevel = _logLevel
        
        let fmt=MyLogFormatter()
        fmt.dateFormat=_logDateFormat
        
        fileLogger=DDFileLogger.init(logFileManager: DDLogFileManagerDefault())
        fileLogger.rollingFrequency=TimeInterval(_rollingFrequency)
        fileLogger.maximumFileSize=UInt64(_maximumFileSize)
        fileLogger.logFormatter=fmt
        DDLog.add(fileLogger)
        
        DDLog.add(DDTTYLogger.sharedInstance)
        DDTTYLogger.sharedInstance.logFormatter=fmt
    }
    
    public class var shared:LogManager{
        get{
            return _shared
        }
    }
    
    public var filePaths:[String]?{
        get{
            return fileLogger.logFileManager.sortedLogFilePaths
        }
    }
    
    public class var dateFormat:String{
        get{
            return _logDateFormat
        }
    }
    
    private static var _shared=LogManager()
    
    var fileLogger:DDFileLogger!
}

class MyLogFormatter:NSObject,DDLogFormatter {
    
    lazy var fmt = DateFormatter()
    func time() -> String {
        return fmt.string(from: Date())
    }
    
    public var dateFormat:String{
        set{
            fmt.dateFormat=newValue
        }
        get{
            return fmt.dateFormat
        }
    }
    
    public func format(message logMessage: DDLogMessage) -> String? {
        var lvl:String=""
        switch logMessage.flag {
        case DDLogFlag.info:
            lvl="Info"
        case DDLogFlag.warning:
            lvl="Warn"
        case DDLogFlag.debug:
            lvl="Debug"
        case DDLogFlag.error:
            lvl="Error"
        default:
            lvl=""
        }
        return "\(time())|\(logMessage.threadID)|\(lvl)|\(logMessage.context)|\(logMessage.fileName):\(logMessage.line)|\(logMessage.message)"
    }
}
