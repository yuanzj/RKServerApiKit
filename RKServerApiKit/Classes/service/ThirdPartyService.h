//
//  ThirdPartyService.h
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import <Foundation/Foundation.h>
#import "GetAccessTokenResp.h"
#import "WxUserInfo.h"

@interface ThirdPartyService : NSObject

/**
 * 获取微信AccessToken
 */
+(NSURLSessionDataTask *)getWxAccessTokenWithAppid:(NSString*)appid secret:(NSString*)secret code:(NSString*)code grantType:(NSString*)grantType block:(void (^)(GetAccessTokenResp *_getAccessTokenResp, NSError *error)) block;

/**
 * 获取微信用户基本信息
 */
+(NSURLSessionDataTask *)getWxUserInfoWithToken:(NSString*)access_token openid:(NSString*)openid block:(void (^)(WxUserInfo *_wxUserInfo, NSError *error)) block;

@end
