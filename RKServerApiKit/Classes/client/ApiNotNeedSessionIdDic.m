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
        apiDic = [NSMutableDictionary dictionaryWithObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/getVeriCode"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/getVeriCode"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/findPwd"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/findPwd"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/register"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/register"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/login"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"user/login"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"auth/open_platform"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"auth/open_platform"]];
        [apiDic setObject:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"auth/token"] forKey:[AFAppDotNetAPIBaseURLString stringByAppendingString:@"auth/token"]];
    }
    return apiDic;
}

@end
