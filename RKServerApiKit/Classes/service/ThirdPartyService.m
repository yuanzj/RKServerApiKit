//
//  ThirdPartyService.m
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import "ThirdPartyService.h"
#import "ThirdPartyApi.h"

@implementation ThirdPartyService

+(NSURLSessionDataTask *)getWxAccessTokenWithAppid:(NSString*)appid secret:(NSString*)secret code:(NSString*)code grantType:(NSString*)grantType block:(void (^)(GetAccessTokenResp *_getAccessTokenResp, NSError *error)) block {
    return [ThirdPartyApi getWxAccessTokenWithAppid:appid secret:secret code:code grantType:grantType block:block];
}

+(NSURLSessionDataTask *)getWxUserInfoWithToken:(NSString*)access_token openid:(NSString*)openid block:(void (^)(WxUserInfo *_wxUserInfo, NSError *error)) block {
    return [ThirdPartyApi getWxUserInfoWithToken:access_token openid:openid block:block];
}

@end
