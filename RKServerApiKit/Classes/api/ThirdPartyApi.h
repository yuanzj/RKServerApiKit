//
//  ThirdPartyApi.h
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import <Foundation/Foundation.h>
#import "GetAccessTokenResp.h"
#import <MJExtension/MJExtension.h>
#import "AFAppWxAPIClient.h"
#import "WxUserInfo.h"

@interface ThirdPartyApi : NSObject

/**
 * 获取微信AccessToken
 */
+(NSURLSessionDataTask *)getWxAccessTokenWithAppid:(NSString*)appid secret:(NSString*)secret code:(NSString*)code grantType:(NSString*)grantType block:(void (^)(GetAccessTokenResp *_getAccessTokenResp, NSError *error)) block;

+(NSURLSessionDataTask *)getWxUserInfoWithToken:(NSString*)access_token openid:(NSString*)openid block:(void (^)(WxUserInfo *_wxUserInfo, NSError *error)) block;

@end
