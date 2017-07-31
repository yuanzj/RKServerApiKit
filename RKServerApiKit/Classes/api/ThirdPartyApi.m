//
//  ThirdPartyApi.m
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import "ThirdPartyApi.h"

@implementation ThirdPartyApi

+(NSURLSessionDataTask *)getWxAccessTokenWithAppid:(NSString*)appid secret:(NSString*)secret code:(NSString*)code grantType:(NSString*)grantType block:(void (^)(GetAccessTokenResp *_getAccessTokenResp, NSError *error)) block {
    return [[AFAppWxAPIClient sharedClient] GET:@"sns/oauth2/access_token" parameters:@{@"appid":appid, @"secret":secret, @"code":code, @"grant_type":grantType} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                GetAccessTokenResp *mGetAccessTokenResp = [GetAccessTokenResp mj_objectWithKeyValues:JSON];
                if(mGetAccessTokenResp){
                    block(mGetAccessTokenResp, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getWxUserInfoWithToken:(NSString*)access_token openid:(NSString*)openid block:(void (^)(WxUserInfo *_wxUserInfo, NSError *error)) block {
    return [[AFAppWxAPIClient sharedClient] GET:@"sns/userinfo" parameters:@{@"access_token":access_token, @"openid":openid} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                WxUserInfo *mWxUserInfo = [WxUserInfo mj_objectWithKeyValues:JSON];
                if(mWxUserInfo){
                    block(mWxUserInfo, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

@end
