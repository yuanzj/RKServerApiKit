//
//  UserService.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/22.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UserService.h"
#import "Validator.h"
#import "City.h"

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

+(NSURLSessionDataTask *)getUserDetailWithBlock:(void (^)(UserInfo *_userInfo, NSError *error)) block{
    return [UserApi getUserDetailWithBlock:^(UserInfo *_userInfo, NSError *error){
        
        if (_userInfo) {
            [RealmManager saveUserInfo:_userInfo];
            block(_userInfo, nil);
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

+(NSURLSessionDataTask *)deleteBatchMessagesWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block{
    return [UserApi deleteBatchMessagesWithMsgIds:msgIds block:block];
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

+(NSURLSessionDataTask *)modifyUserInfo:(NSString*)phoneNumber smsVerifyCode:(NSString*)smsVerifyCode realName:(NSString*)realName idCard:(NSString*)idCard storeId:(NSString*) storeId block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    return [UserApi modifyUserInfo:phoneNumber smsVerifyCode:smsVerifyCode realName:realName idCard:idCard storeId:storeId block:block];
}

+(NSURLSessionDataTask *)modifyUserInfoByToken:(NSString*)phoneNumber smsVerifyCode:(NSString*)smsVerifyCode realName:(NSString*)realName idCard:(NSString*)idCard storeId:(NSString*) storeId token:(NSString*)tokenString block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi modifyUserInfoByToken:phoneNumber smsVerifyCode:smsVerifyCode realName:realName idCard:idCard storeId:storeId token:(NSString*)tokenString block:block];
}

+(NSURLSessionDataTask *)updateUserPsw:(NSString*)password block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi updateUserPsw:password block:block];
}

+(NSURLSessionDataTask *)getTokenWithBlock:(void (^)(TokenResponse *_tokenResponse, NSError *error)) block{
    return [UserApi getTokenWithBlock:^(TokenResponse *_tokenResponse, NSError *error) {
        if (_tokenResponse) {
            if(_tokenResponse.state == RKSAPIResponseSuccess){
                Token* token = _tokenResponse.data;
                [RealmManager saveToken:token];
            }
            block(_tokenResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)loginWithOpenPlatform:(NSString*)openType openId:(NSString*)openId nickName:(NSString*)nickname headimgUrl:(NSString*)headimgUrl gender:(NSString*)gender province:(NSString*)province city:(NSString*)city country:(NSString*)country block:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block {
    return [UserApi loginWithOpenPlatform:openType openId:openId nickName:nickname headimgUrl:headimgUrl gender:gender province:province city:city country:country block:^(GetAuthTokenResp *_getAuthTokenResp, NSError *error) {
        
        if (_getAuthTokenResp && _getAuthTokenResp.status && [@"INACTIVE" isEqualToString:_getAuthTokenResp.status]) {
            NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
            [params setObject:@"INACTIVE" forKey:@"status"];
            [params setObject:_getAuthTokenResp.token forKey:@"tokenString"];
            block(nil, [NSError errorWithDomain:@"submitCommand:Failure" code:0 userInfo:params]);
        } else if (_getAuthTokenResp && _getAuthTokenResp.token) {
            LoginedUser *loginedUser = [[LoginedUser alloc] init];
            loginedUser.nickname = nickname;
            loginedUser.openType = openType;
            loginedUser.openId = openId;
            loginedUser.headimgUrl = headimgUrl;
            loginedUser.gender = gender;
            loginedUser.province = province;
            loginedUser.city = city;
            loginedUser.country = country;
            loginedUser.token = _getAuthTokenResp.token;
            loginedUser.sub = _getAuthTokenResp.userId;
            NSString* role = @"";
            if(_getAuthTokenResp.roles && _getAuthTokenResp.roles.count > 0) {
                for(UserRole* userRole in _getAuthTokenResp.roles) {
                    if (role && role.length > 0) {
                        role = [role stringByAppendingString:@","];
                    }
                    role = [role stringByAppendingString:userRole.name];
                }
            }
            loginedUser.roles = role;
            [RealmManager saveLoginedUser:loginedUser];
            block(_getAuthTokenResp, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)bindPhoneNum:(NSString*)phoneNumber password:(NSString*)password block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi bindPhoneNum:phoneNumber password:password block:block];
}

+(NSURLSessionDataTask *)getEbikeStores:(NSString*)leftBottomLat leftBottomLng:(NSString*)leftBottomLng rightTopLat:(NSString*)rightTopLat rightTopLng:(NSString*)rightTopLng type:(NSString*)type page:(NSString*)page limit:(NSString*)limit block:(void (^)(EbikeStoreResp *_EbikeStoreResp, NSError *error)) block {
    return [UserApi getEbikeStores:leftBottomLat leftBottomLng:leftBottomLng rightTopLat:rightTopLat rightTopLng:rightTopLng type:type page:page limit:limit block:block];
}

+(NSURLSessionDataTask *)getEbikeStoresByProvice:(NSString*)provice city:(NSString*)city type:(NSString*)type page:(NSString*)page limit:(NSString*)limit block:(void (^)(EbikeStoreResp *_EbikeStoreResp, NSError *error)) block {
    return [UserApi getEbikeStoresByProvice:provice city:city type:type page:page limit:limit block:block];
}

+(NSURLSessionDataTask *)getEbikeStoresByStoreId:(NSString*)storeId block:(void (^)(EbikeStore *_EbikeStore, NSError *error)) block {
    return [UserApi getEbikeStoresByStoreId:storeId block:block];
}

+(NSURLSessionDataTask *)loginGetToken:(NSString*)account password:(NSString*)password block:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block{
    return [UserApi loginGetToken:account password:password block:^(GetAuthTokenResp *_getAuthTokenResp, NSError *error) {
        if (_getAuthTokenResp && _getAuthTokenResp.token) {
            LoginedUser *loginedUser = [[LoginedUser alloc] init];
            loginedUser.token = _getAuthTokenResp.token;
            loginedUser.phoneNum = account;
            loginedUser.password = password;
            loginedUser.sub = _getAuthTokenResp.userId;
            NSString* role = @"";
            if(_getAuthTokenResp.roles && _getAuthTokenResp.roles.count > 0) {
                for(UserRole* userRole in _getAuthTokenResp.roles) {
                    if (role && role.length > 0) {
                        role = [role stringByAppendingString:@","];
                    }
                    role = [role stringByAppendingString:userRole.name];
                }
            }
            loginedUser.roles = role;
            [RealmManager saveLoginedUser:loginedUser];
            block(_getAuthTokenResp, error);
        } else {
            block(_getAuthTokenResp, error);
        }
    }];
}

+(NSURLSessionDataTask *)verifyCode:(NSString*)mobile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi verifyCode:mobile block:block];
}

+(NSURLSessionDataTask *)verifyCodeByToken:(NSString*)tokenString mobile:(NSString*)mobile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi verifyCodeByToken:tokenString mobile:mobile block:block];
}

+(NSURLSessionDataTask *)upgradeForEnterpriseByName:(NSString*)name type:(NSString*)type brands:(NSString*)brands contact:(NSString*)contact openStartTime:(NSString*)openStartTime openEndTime:(NSString*)openEndTime lat:(NSString*)lat lon:(NSString*)lon province:(NSString*)province city:(NSString*)city county:(NSString*)county address:(NSString*)address lonLatType:(NSString*)lonLatType logoFile:(UIImage*)logoFile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi upgradeForEnterpriseByName:name type:type brands:brands contact:contact openStartTime:openStartTime openEndTime:openEndTime lat:lat lon:lon province:province city:city county:county address:address lonLatType:lonLatType logoFile:logoFile block:block];
}

+(NSURLSessionDataTask *)getSimChargeOrders:(NSString*)page limit:(NSString*)limit block:(void (^)(SimChargeOrderResp *_SimChargeOrderResp, NSError *error)) block {
    return [UserApi getSimChargeOrders:page limit:limit block:^(SimChargeOrderResp *_SimChargeOrderResp, NSError *error) {
        if (_SimChargeOrderResp) {
            [RealmManager clearMessageList];
            if(_SimChargeOrderResp && _SimChargeOrderResp.list && _SimChargeOrderResp.list.count > 0){
                NSArray *list = _SimChargeOrderResp.list;
                [RealmManager saveMessageList:list];
            }
            block(_SimChargeOrderResp, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)uploadIDCertification:(UIImage*)frontFile backFile:(UIImage*)backFile handFile:(UIImage*)handFile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UserApi uploadIDCertification:frontFile backFile:backFile handFile:handFile block:block];
}

+(NSURLSessionDataTask *)refreshToken:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block {
    LoginedUser *_LoginedUser = [RealmManager queryLoginedUser];
    if (_LoginedUser.phoneNum && _LoginedUser.password) {
        return [UserService loginGetToken:_LoginedUser.phoneNum password:_LoginedUser.password block:block];
    } else {
        return [UserService loginWithOpenPlatform:_LoginedUser.openType openId:_LoginedUser.openId nickName:_LoginedUser.nickname headimgUrl:_LoginedUser.headimgUrl gender:_LoginedUser.gender province:_LoginedUser.province city:_LoginedUser.city country:_LoginedUser.country block:block];
    }
}

+(NSURLSessionDataTask *)getCities:(void (^)(NSArray *_cityArray, NSError *error)) block {
    return [UserApi getCities:block];
}

@end
