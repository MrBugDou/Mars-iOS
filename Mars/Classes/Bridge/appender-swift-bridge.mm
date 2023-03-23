
// Tencent is pleased to support the open source community by making Mars available.
// Copyright (C) 207 THL A29 Limited, a Tencent company. All rights reserved.
// Licensed under the MIT License (the "License"); you may not use this file except in 
// compliance with the License. You may obtain a copy of the License at
// http://opensource.org/licenses/MIT
// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
/*
 * appender-swift-bridge.mm
 *
 *  Created on: 2017-1-3
 *      Author: Jinkey
 */

#import "appender-swift-bridge.h"
#import <mars/xlog/appender.h>
#import <mars/xlog/xlogger.h>
#import <sys/xattr.h>

using namespace mars::xlog;

@implementation JinkeyMarsBridge

// 封装了初始化 Xlogger 方法
// initialize Xlogger
-(void)initXlogger: (XloggerType)debugLevel releaseLevel: (XloggerType)releaseLevel path: (NSString*)path prefix: (const char*)prefix{
    
    NSString* logPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/log"];
    
    // set do not backup for logpath
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    setxattr([logPath UTF8String], attrName, &attrValue, sizeof(attrValue), 0, 0);
    
    // init xlog
#if DEBUG
    xlogger_SetLevel(kLevelDebug);
    appender_set_console_log(true);
#else
    xlogger_SetLevel(kLevelInfo);
    appender_set_console_log(false);
#endif
    //        save private key
    //        6333d4aa8be799bd4697f42e26ed0c63be8196f4bced576d6f5c76a6b86b9aad
    //
    //        appender_open's parameter:
    //        e8163215499a4c6d91b0691177127691e884ed409c49f2496102b626734f93f412de01d5df53772a7c7bd0c57f08062078b37d3f8b8ab995b9b3ec623b5bd2ff
    
    XLogConfig config;
    config.mode_ = kAppenderAsync;
    config.logdir_ = [logPath UTF8String];
    config.nameprefix_ = "Test";
    config.pub_key_ = "";
    config.compress_mode_ = kZlib;
    config.compress_level_ = 0;
    config.cachedir_ = "";
    config.cache_days_ = 0;
    appender_open(config);    
}

// 封装了关闭 Xlogger 方法
// deinitialize Xlogger
-(void)deinitXlogger {
    appender_close();
}


// 利用微信提供的 LogUtil.h 封装了打印日志的方法
// print log using LogUtil.h provided by Wechat
-(void) log: (XloggerType) level tag: (const char*)tag content: (NSString*)content{
    
    NSString* levelDescription = @"";
    
    switch (level) {
        case debug:
            LOG_DEBUG(tag, content);
            levelDescription = @"Debug";
            break;
        case info:
            LOG_INFO(tag, content);
            levelDescription = @"Info";
            break;
        case warning:
            LOG_WARNING(tag, content);
            levelDescription = @"Warn";
            break;
        case error:
            LOG_ERROR(tag, content);
            levelDescription = @"Error";
            break;
        default:
            break;
    }
    
}

@end

