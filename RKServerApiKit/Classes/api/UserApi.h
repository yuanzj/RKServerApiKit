//
//  UserApi.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "BaseResponse.h"
#import "UpdateHeadResponse.h"
#import "UserInfoResponse.h"
#import "AFAppDotNetAPIClient.h"
#import <MJExtension/MJExtension.h>
#import "Constant.h"
#import "MsgResponse.h"
#import "FailServerResponse.h"
#import "FailServerAddress.h"

@interface UserApi : NSObject

#pragma mark -
#pragma mark 不需要sessionId

#pragma mark -
#pragma mark 获取验证码
/**
 * 获取验证码
 * @param mobile 手机号码
 * @param type  RA：注册 FA：找回密码 CM：变更手机号码
 */
+(NSURLSessionDataTask *)getVeriCodeWithMobile:(NSString*)mobile type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 通过手机号码验证该手机账号的合法性
/**
 * 通过手机号码验证该手机账号的合法性
 */
+(NSURLSessionDataTask *)checkAccount:(NSString*)mobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 找回密码
/**
 * 找回密码
 * @param mobile
 * @param password 登录密码
 * @param lockPassword 手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask *)setPasswordWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 检查验证码是否正确
/**
 * 检查验证码是否正确
 * @param mobile 用户手机号
 * @param veriCode 验证码
 * @param type  RA：注册 FA：找回密码
 */
+(NSURLSessionDataTask*)checkVeriCodeWithMobile:(NSString*)mobile veriCode:(NSString*) veriCode type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 用户注册
/**
 * 用户注册
 * @param mobile 手机号码
 * @param password 注册密码
 * @param lockPassword 解锁手势密码
 * @param veriCode 短信验证码
 */
+(NSURLSessionDataTask*)registerWithMobile:(NSString*)mobile password:(NSString*)password locPassword:(NSString*)locPassword veriCode:(NSString*)veriCode block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 登陆
/**
 * 登陆
 */
+(NSURLSessionDataTask *)loginWithMobile:(NSString*)mobile password:(NSString*)password ctype:(NSString*)ctype
                                deviceId:(NSString*)deviceId appVersion:(NSString*)appVersion block:(void (^)(UserResponse *_mUser, NSError *error)) block;

#pragma mark -
#pragma mark 需要sessionId

#pragma mark -
#pragma mark 用户修改密码
/**
 * 用户修改密码
 * @param oldpassword 原始密码
 * @param password 新修改密码
 * @param type 0:修改登录密码 1:修改解锁密码
 * @return
 */
+(NSURLSessionDataTask*)changePwdWithOldPwd:(NSString*)oldpassword newPwd:(NSString*)password type:(NSString*)type block:(void (^)(BaseResponse *_baseResp, NSError *))block;

#pragma mark -
#pragma mark 更换绑定手机
/**
 * 更换绑定手机
 * @param sessionId
 * @param veriCode 验证码
 * @param newMobile 手机号
 * @return
 */
+(NSURLSessionDataTask *)changeBindedMobileWithVeriCode:(NSString*)veriCode newMobile:(NSString*) newMobile block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 更新用户性别
/**
 * must
 * 更新用户性别
 * @param sessionId
 * @param gender:0(男),1(女)
 * @return
 */
+(NSURLSessionDataTask *)updateGenderWithGender:(NSString*)gender block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 更新用户昵称
/**
 * 更新用户昵称
 * @param sessionId
 * @param nickname 昵称
 * @return
 */
+(NSURLSessionDataTask *)updateNickNameWithNickname:(NSString*)nickname block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 更新头像
/**
 * 更新头像
 * @param sessionId
 * @param filePath 图片路径
 */
+(NSURLSessionDataTask *)updateHeadImgWithImage:(UIImage*)image block:(void (^)(UpdateHeadResponse *_updateHeadResponse, NSError *error)) block;

#pragma mark -
#pragma mark 获取用户信息
/**
 * 获取用户信息
 * @param sessionId
 * @return
 */
+(NSURLSessionDataTask *)getUserDetailWithBlock:(void (^)(UserInfoResponse *_userInfoResponse, NSError *error)) block;

#pragma mark -
#pragma mark 获取用户推送消息
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

#pragma mark -
#pragma mark 删除用户推送消息
/**
 * 删除用户推送消息
 * @param sessionId
 * @param ids 消息id的集合
 * @return
 */
+(NSURLSessionDataTask *)deleteMessageWithMsgIds:(NSArray*)msgIds block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 获取fail server服务器地址
/**
 * 获取fail server服务器地址
 * @param context
 * @return
 */
+(NSURLSessionDataTask *)getFailServerAddressWithBlock:(void (^)(FailServerResponse *_failServerResponse, NSError *error)) block;

#pragma mark -
#pragma mark 绑定手机(push消息相关)
/**
 * 绑定手机(push消息相关)
 * @param sessionId
 * @param deviceId jpush注册id
 * @return
 */
+(NSURLSessionDataTask *)bindDeviceWithDeviceId:(NSString*)deviceId deviceType:(NSString*)deviceType deviceName:(NSString*)deviceName bindTime:(NSString*)bindTime lock:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

#pragma mark -
#pragma mark 解除绑定(push消息相关)
/**
 * 解除绑定(push消息相关)
 * @param sessionId
 * @param deviceId jpush注册id
 * @return
 */
+(NSURLSessionDataTask *)unBindDeviceWithDeviceId:(NSString*)deviceId block:(void (^)(BaseResponse *_baseResp, NSError *error)) block;

@end
