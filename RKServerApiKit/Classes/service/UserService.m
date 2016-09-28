//
//  UserService.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/22.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UserService.h"
#import "Validator.h"

@implementation UserService
NSString * const USER = @"USER";
/**
 * 获取验证码
 * @param mobile 手机号码
 * @param type  RA：注册 FA：找回密码 CM：变更手机号码
 */
+(NSURLSessionDataTask *)getVeriCodeWithMobile:(NSString*)mobile type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi getVeriCodeWithMobile:mobile type:type block:block];
}
/**
 * 通过手机号码验证该手机账号的合法性
 */
+(NSURLSessionDataTask *)checkAccount:(NSString*)mobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi checkAccount:mobile block:block];
}
/**
 * 找回密码
 * @param mobile
 * @param password 登录密码
 * @param lockPassword 手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask *)setPasswordWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi setPasswordWithMobile:mobile password:password locPassword:locPassword veriCode:veriCode block:block];
}

/**
 * 检查验证码是否正确
 * @param mobile 用户手机号
 * @param veriCode 验证码
 * @param type  RA：注册 FA：找回密码
 */
+(NSURLSessionDataTask*)checkVeriCodeWithMobile:(NSString*)mobile veriCode:(NSString*) veriCode type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi checkVeriCodeWithMobile:mobile veriCode:veriCode type:type block:block];
}

/**
 * 用户注册
 * @param mobile 手机号码
 * @param password 注册密码
 * @param lockPassword 解锁手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask*)registerWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi registerWithMobile:mobile password:password locPassword:locPassword veriCode:veriCode block:block];
}

/**
 * 登陆
 */
+(NSURLSessionDataTask *)loginWithMobile:(NSString*)mobile password:(NSString*)password block:(void (^)(UserResponse *_mUser, NSError *error)) block{
    NSString *ctype = [[UIDevice currentDevice] model];
    NSString *deviceId = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return [UserApi loginWithMobile:mobile password:password ctype:ctype deviceId:deviceId appVersion:appVersion block:^(UserResponse *_mUserResponse, NSError *error){
        if (_mUserResponse) {
           
            if(_mUserResponse.state == RKSAPIResponseSuccess){
                LoginUser *loginUser = _mUserResponse.data;
                User *mUser = [[User alloc] init];
                mUser.username = mobile;
                mUser.password = password;
                mUser.sessionId = loginUser.sessionId;
                mUser.userId = loginUser.userId;
                //保存用户信息
                [User setUser:mUser];
                [RealmManager saveUser:mUser];
            }
            
            block(_mUserResponse, nil);
            
        }else{
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask*)changePwdWithOldPwd:(NSString*)oldpassword newPwd:(NSString*)password type:(NSString*)type block:(void (^)(BaseResponse *, NSError *))block{
    return [UserApi changePwdWithOldPwd:oldpassword newPwd:password type:type block:block];
}

+(NSURLSessionDataTask *)changeBindedMobileWithVeriCode:(NSString*)veriCode newMobile:(NSString*) newMobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi changeBindedMobileWithVeriCode:veriCode newMobile:newMobile block:block];
}

+(NSURLSessionDataTask *)updateGenderWithGender:(NSString*)gender block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi updateGenderWithGender:gender block:block];
}

+(NSURLSessionDataTask *)updateNickNameWithNickname:(NSString*)nickname block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi updateNickNameWithNickname:nickname block:block];
}

+(NSURLSessionDataTask *)updateHeadImgWithImage:(UIImage*)image block:(void (^)(UpdateHeadResponse *_updateHeadResponse, NSError *error)) block{
    return [UserApi updateHeadImgWithImage:image block:block];
}

+(NSURLSessionDataTask *)getUserDetailWithBlock:(void (^)(UserInfoResponse *_userInfoResponse, NSError *error)) block{
    return [UserApi getUserDetailWithBlock:^(UserInfoResponse *_userInfoResponse, NSError *error){
        
        if (_userInfoResponse) {
            if(_userInfoResponse.state == RKSAPIResponseSuccess){
                UserInfo *mUserInfo = _userInfoResponse.data;
                [UserInfo setUserInfo:mUserInfo];
                [RealmManager saveUserInfo:mUserInfo];
            }
            
            block(_userInfoResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)getMessageWithBlock:(void (^)(MsgResponse *_msgResponse, NSError *error)) block{
    return [UserApi getMessageWithBlock:^(MsgResponse *msgListResponse, NSError *error){
        
        if (msgListResponse) {
            if(msgListResponse.state == RKSAPIResponseSuccess){
                NSArray *list = msgListResponse.data5;
                [RealmManager clearMessageList];
                [RealmManager saveMessageList:list];
            }
            
            block(msgListResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 获取用户推送消息
 * @param sessionId
 */
+(NSURLSessionDataTask *)getMessageWithPage:(NSInteger)page pageSize:(NSInteger)size block:(void (^)(MsgResponse *_msgResponse, NSError *error)) block{
    return [UserApi getMessageWithPage:page pageSize:size block:block];
}

+(NSURLSessionDataTask *)deleteMessageWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi deleteMessageWithMsgIds:msgIds block:block];
}

+(NSURLSessionDataTask *)getFailServerAddressWithBlock:(void (^)(FailServerResponse *_failServerResponse, NSError *error)) block{
    return [UserApi getFailServerAddressWithBlock:block];
}

+(NSURLSessionDataTask *)bindDeviceWithDeviceId:(NSString*)deviceId deviceType:(NSString*)deviceType deviceName:(NSString*)deviceName lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    NSString* bindTime = [Common getCurDate];
    return [UserApi bindDeviceWithDeviceId:deviceId deviceType:deviceType deviceName:deviceName bindTime:bindTime lock:block];
}

+(NSURLSessionDataTask *)unBindDeviceWithDeviceId:(NSString*)deviceId lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi unBindDeviceWithDeviceId:deviceId block:block];
}
@end
