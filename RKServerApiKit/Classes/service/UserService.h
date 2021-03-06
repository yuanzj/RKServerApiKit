//
//  UserService.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/22.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserApi.h"
#import "RealmManager.h"
#import "Common.h"
#import "MsgResponse.h"
#import "FailServerResponse.h"
#import "GetAuthTokenResp.h"
#import "ErrorResp.h"
#import "EbikeStoreResp.h"
#import "EbikeStore.h"
#import "SimChargeOrderResp.h"

@interface UserService : NSObject
extern NSString * const USER;

#pragma mark -
#pragma mark 用户管理
/**
 * 获取验证码
 * @param mobile 手机号码
 * @param type  RA：注册 FA：找回密码 CM：变更手机号码
 */
+(NSURLSessionDataTask *)getVeriCodeWithMobile:(NSString*)mobile type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 找回密码
 * @param mobile
 * @param password 登录密码
 * @param lockPassword 手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask *)setPasswordWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;


/**
 * 用户注册
 * @param mobile 手机号码
 * @param password 注册密码
 * @param lockPassword 解锁手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask*)registerWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 登陆
 */
+(NSURLSessionDataTask *)loginWithMobile:(NSString*)mobile password:(NSString*)password block:(void (^)(UserResponse *_mUser, NSError *error)) block;

/**
 * 用户修改密码
 * @param oldpassword 原始密码
 * @param password 新修改密码
 * @param type 0:修改登录密码 1:修改解锁密码
 */
+(NSURLSessionDataTask*)changePwdWithOldPwd:(NSString*)oldpassword newPwd:(NSString*)password type:(NSString*)type block:(void (^)(BaseResponse *, NSError *))block;

/**
 * 更新用户性别
 * @param context
 * @param gender:0(男),1(女)
 * @return
 */
+(NSURLSessionDataTask *)updateGenderWithGender:(NSString*)gender block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 更新用户昵称
 * @param nickname 昵称
 * @return
 */
+(NSURLSessionDataTask *)updateNickNameWithNickname:(NSString*)nickname block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 更新头像
 * @param filePath 图片路径
 * @return
 */
+(NSURLSessionDataTask *)updateHeadImgWithImage:(UIImage*)image block:(void (^)(UpdateHeadResponse *_updateHeadResponse, NSError *error)) block;

/**
 * 获取用户信息
 * @param context
 * @return
 */
+(NSURLSessionDataTask *)getUserDetailWithBlock:(void (^)(UserInfo *_userInfo, NSError *error)) block;

/**
 * 获取用户推送消息
 * @param sessionId
 */
+(NSURLSessionDataTask *)getMessageWithBlock:(void (^)(MsgResponse *_msgResponse, NSError *error)) block;

/**
 * 获取用户推送消息
 * @param sessionId
 */
+(NSURLSessionDataTask *)getMessageWithPage:(NSInteger)page pageSize:(NSInteger)size block:(void (^)(MsgResponse *_msgResponse, NSError *error)) block;

/**
 * 删除用户推送消息
 * @param sessionId
 * @param ids 消息id的集合
 * @return
 */
+(NSURLSessionDataTask *)deleteMessageWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 批量删除用户推送消息
 * @param sessionId
 * @param ids 消息id的集合
 * @return
 */
+(NSURLSessionDataTask *)deleteBatchMessagesWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 用户实名
 */
+(NSURLSessionDataTask *)modifyUserInfo:(NSString*)phoneNumber smsVerifyCode:(NSString*)smsVerifyCode realName:(NSString*)realName idCard:(NSString*)idCard storeId:(NSString*) storeId block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 用户实名byToken
 */
+(NSURLSessionDataTask *)modifyUserInfoByToken:(NSString*)phoneNumber smsVerifyCode:(NSString*)smsVerifyCode realName:(NSString*)realName idCard:(NSString*)idCard storeId:(NSString*) storeId token:(NSString*)tokenString block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 修改用户密码
 */
+(NSURLSessionDataTask *)updateUserPsw:(NSString*)password block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

#pragma mark -
#pragma mark 以下接口废弃

/**
 * 检查验证码是否正确
 * @param mobile 用户手机号
 * @param veriCode 验证码
 * @param type  RA：注册 FA：找回密码
 */
+(NSURLSessionDataTask*)checkVeriCodeWithMobile:(NSString*)mobile veriCode:(NSString*) veriCode type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 通过手机号码验证该手机账号的合法性
 */
+(NSURLSessionDataTask *)checkAccount:(NSString*)mobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 更换绑定手机
 * @param context
 * @param veriCode 验证码
 * @param newMobile 手机号
 * @return
 */
+(NSURLSessionDataTask *)changeBindedMobileWithVeriCode:(NSString*)veriCode newMobile:(NSString*) newMobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 获取fail server服务器地址
 * @param context
 * @return
 */
+(NSURLSessionDataTask *)getFailServerAddressWithBlock:(void (^)(FailServerResponse *_failServerResponse, NSError *error)) block;

/**
 * 绑定手机(push消息相关)
 * @param sessionId
 * @param deviceId jpush注册id
 * @return
 */
+(NSURLSessionDataTask *)bindDeviceWithDeviceId:(NSString*)deviceId deviceType:(NSString*)deviceType deviceName:(NSString*)deviceName lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

/**
 * 解除绑定(push消息相关)
 * @param deviceId jpush注册id
 * @return
 */
+(NSURLSessionDataTask *)unBindDeviceWithDeviceId:(NSString*)deviceId lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 获取token
/**
 * 获取上传数据用的token
 */
+(NSURLSessionDataTask *)getTokenWithBlock:(void (^)(TokenResponse *_tokenResponse, NSError *error)) block;

/**
 * 第三方平台登录
 * @param sessionId
 */
+(NSURLSessionDataTask *)loginWithOpenPlatform:(NSString*)openType openId:(NSString*)openId nickName:(NSString*)nickname headimgUrl:(NSString*)headimgUrl gender:(NSString*)gender province:(NSString*)province city:(NSString*)city country:(NSString*)country block:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block;

+(NSURLSessionDataTask *)bindPhoneNum:(NSString*)phoneNumber password:(NSString*)password block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)getEbikeStores:(NSString*)leftBottomLat leftBottomLng:(NSString*)leftBottomLng rightTopLat:(NSString*)rightTopLat rightTopLng:(NSString*)rightTopLng type:(NSString*)type page:(NSString*)page limit:(NSString*)limit block:(void (^)(EbikeStoreResp *_EbikeStoreResp, NSError *error)) block;

+(NSURLSessionDataTask *)getEbikeStoresWithPage:(NSString*)page limit:(NSString*)limit category:(NSString*)category block:(void (^)(EbikeStoreResp *_EbikeStoreResp, NSError *error)) block;

+(NSURLSessionDataTask *)getEbikeStoresByProvice:(NSString*)provice city:(NSString*)city type:(NSString*)type page:(NSString*)page limit:(NSString*)limit block:(void (^)(EbikeStoreResp *_EbikeStoreResp, NSError *error)) block;

+(NSURLSessionDataTask *)getEbikeStoresByStoreId:(NSString*)storeId block:(void (^)(EbikeStore *_EbikeStore, NSError *error)) block;

+(NSURLSessionDataTask *)loginGetToken:(NSString*)account password:(NSString*)password block:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block;

+(NSURLSessionDataTask *)verifyCode:(NSString*)mobile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)verifyCodeByToken:(NSString*)tokenString mobile:(NSString*)mobile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)upgradeForEnterpriseByName:(NSString*)name type:(NSString*)type brands:(NSString*)brands contact:(NSString*)contact openStartTime:(NSString*)openStartTime openEndTime:(NSString*)openEndTime lat:(NSString*)lat lon:(NSString*)lon province:(NSString*)province city:(NSString*)city county:(NSString*)county address:(NSString*)address lonLatType:(NSString*)lonLatType logoFile:(UIImage*)logoFile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)getSimChargeOrders:(NSString*)page limit:(NSString*)limit block:(void (^)(SimChargeOrderResp *_SimChargeOrderResp, NSError *error)) block;

+(NSURLSessionDataTask *)uploadIDCertification:(UIImage*)frontFile backFile:(UIImage*)backFile handFile:(UIImage*)handFile block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

+(NSURLSessionDataTask *)refreshToken:(void (^)(GetAuthTokenResp *_getAuthTokenResp, NSError *error)) block;

+(NSURLSessionDataTask *)getCities:(void (^)(NSArray *_cityArray, NSError *error)) block;

@end
