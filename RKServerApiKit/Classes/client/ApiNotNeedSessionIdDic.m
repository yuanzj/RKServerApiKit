//
//  ApiNotNeedSessionIdDic.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/29.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "ApiNotNeedSessionIdDic.h"
#import "AFAppDotNetAPIClient.h"

static NSMutableDictionary* apiDic = nil;

@implementation ApiNotNeedSessionIdDic

+ (NSMutableDictionary *)getApiDic{
    if (apiDic == nil) {
        apiDic = [NSMutableDictionary dictionaryWithObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/getVeriCode"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/getVeriCode"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/checkAccount"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/checkAccount"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/setPwd"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/setPwd"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/validVeriCode"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/validVeriCode"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/register"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"UserManager/register"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"app_login"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"app_login"]];
    }
    return apiDic;
}

@end
