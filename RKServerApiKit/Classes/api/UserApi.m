//
//  UserApi.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UserApi.h"

@implementation UserApi

+(NSURLSessionDataTask *)getVeriCodeWithMobile:(NSString*)mobile type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block
{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/getVeriCode" parameters:@{@"mobile":mobile, @"type":type} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)checkAccount:(NSString *)mobile block:(void (^)(BaseResponse *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"UserManager/checkAccount" parameters:@{@"mobile":mobile} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)setPasswordWithMobile:(NSString *)mobile password:(NSString *)password locPassword:(NSString *)locPassword veriCode:(NSString *)veriCode block:(void (^)(BaseResponse *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/findPwd" parameters:@{@"mobile":mobile, @"password":password, @"veriCode":veriCode} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)checkVeriCodeWithMobile:(NSString *)mobile veriCode:(NSString *)veriCode type:(NSString *)type block:(void (^)(BaseResponse *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"UserManager/validVeriCode" parameters:@{@"mobile":mobile, @"veriCode":veriCode, @"type":type} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)registerWithMobile:(NSString *)mobile password:(NSString *)password locPassword:(NSString *)locPassword veriCode:(NSString *)veriCode block:(void (^)(BaseResponse *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/register" parameters:@{@"mobile":mobile, @"password":   password, @"veriCode":veriCode} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask*)changePwdWithOldPwd:(NSString*)oldpassword newPwd:(NSString*)password type:(NSString*)type block:(void (^)(BaseResponse *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/changePwd" parameters:@{@"oldpassword":oldpassword,@"password":password} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)loginWithMobile:(NSString*)mobile password:(NSString*)password ctype:(NSString*)ctype
                                deviceId:(NSString*)deviceId appVersion:(NSString*)appVersion block:(void (^)(UserResponse *_mUser, NSError *error)) block
{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/login" parameters:@{@"mobile":mobile, @"password":password, @"deviceId":deviceId, @"appVersion":appVersion} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                UserResponse *mUserResponse = [UserResponse mj_objectWithKeyValues:JSON];
                if(mUserResponse){
                    block(mUserResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)changeBindedMobileWithVeriCode:(NSString*)veriCode newMobile:(NSString*) newMobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/change_mobile" parameters:@{@"veriCode":veriCode, @"newMobile":newMobile} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)updateGenderWithGender:(NSString*)gender block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/update_user_gender" parameters:@{@"gender":gender} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)updateNickNameWithNickname:(NSString*)nickname block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/update_user_nickname" parameters:@{@"nickname":nickname} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)updateHeadImgWithImage:(UIImage*)image block:(void (^)(UpdateHeadResponse *_updateHeadResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] UPLOAD:@"user/update_user_headimg" parameters:nil image:image completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                UpdateHeadResponse *mUpdateHeadResponse = [UpdateHeadResponse mj_objectWithKeyValues:JSON];
                if(mUpdateHeadResponse){
                    block(mUpdateHeadResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getUserDetailWithBlock:(void (^)(UserInfoResponse *_userInfoResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/get_user_detail" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                UserInfoResponse *mUserInfoResponse = [UserInfoResponse mj_objectWithKeyValues:JSON];
                if(mUserInfoResponse){
                    block(mUserInfoResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getMessageWithBlock:(void (^)(MsgResponse *_msgResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/get_user_msg" parameters:@{@"pageSize":@"50",
                                                                                   @"page":@"0" } completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                [MsgResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data5" : [MsgBean class]
                             };
                }];
                MsgResponse *mMsgResponse = [MsgResponse mj_objectWithKeyValues:JSON];
                if(mMsgResponse){
                    block(mMsgResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

/**
 * 获取用户推送消息
 * @param sessionId
 */
+(NSURLSessionDataTask *)getMessageWithPage:(NSInteger)page pageSize:(NSInteger)size block:(void (^)(MsgResponse *_msgResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/get_user_msg" parameters:@{@"pageSize":@(size),
                                                                                      @"page":@(page) } completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
                                                                                          if(block){
                                                                                              if(JSON){
                                                                                                  [MsgResponse mj_setupObjectClassInArray:^NSDictionary *{
                                                                                                      return @{
                                                                                                               @"data5" : [MsgBean class]
                                                                                                               };
                                                                                                  }];
                                                                                                  MsgResponse *mMsgResponse = [MsgResponse mj_objectWithKeyValues:JSON];
                                                                                                  if(mMsgResponse){
                                                                                                      block(mMsgResponse, nil);
                                                                                                  }else{
                                                                                                      block(nil, error);
                                                                                                  }
                                                                                              }else{
                                                                                                  block(nil, error);
                                                                                              }
                                                                                          }
                                                                                      }];
}

+(NSURLSessionDataTask *)deleteMessageWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
//    NSString* ids = @"[";
//    for(int i = 0; i < msgIds.count; i++){
//        ids = [ids stringByAppendingString:[msgIds objectAtIndex:i]];
//        if((i + 1) != msgIds.count){
//            ids = [ids stringByAppendingString:@","];
//        }
//    }
//    ids = [ids stringByAppendingString:@"]"];
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/delete_user_msg" parameters:@{@"msgId":msgIds[0]}  completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getFailServerAddressWithBlock:(void (^)(FailServerResponse *_failServerResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ha/get_failserver_address" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                [FailServerResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data" : [FailServerAddress class]
                             };
                }];
                FailServerResponse *mFailServerResponse = [FailServerResponse mj_objectWithKeyValues:JSON];
                if(mFailServerResponse){
                    block(mFailServerResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)bindDeviceWithDeviceId:(NSString*)deviceId deviceType:(NSString*)deviceType deviceName:(NSString*)deviceName bindTime:(NSString*)bindTime lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"bind_device" parameters:@{@"deviceId":deviceId, @"deviceType":deviceType, @"deviceName":deviceName, @"bindTime":bindTime} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)unBindDeviceWithDeviceId:(NSString*)deviceId block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"unbind_device" parameters:@{@"deviceId":deviceId} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
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
