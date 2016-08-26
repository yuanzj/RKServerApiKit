//
//  UeService.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UeApi.h"
#import "RealmManager.h"

@interface UeService : NSObject

#pragma mark -
#pragma mark 获取设备列表
/**
 * 获取设备列表
 */
+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block;

#pragma mark -
#pragma mark 删除设备
/**
 * 删除设备
 */
+(NSURLSessionDataTask *)deleteUeWithUeSn:(NSString*)ueSn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block;

#pragma mark -
#pragma mark 绑定设备
/**
 * 绑定设备
 */
+(NSURLSessionDataTask *)bindUeWithUeSn:(NSString*)ueSn vehicleId:(NSString*)vehicleId bindUESn:(NSString*)bindUESn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block;

#pragma mark -
#pragma mark 获取设备详情
/**
 * 获取设备详情
 */

+(NSURLSessionDataTask *)queryUeDetailWithUeSn:(NSString*)ueSn block:(void (^)(UeDetailResponse *_ueDetailResponse, NSError *error)) block;

/**
 * 计算单日里程
 */
+(NSURLSessionDataTask *)calcMilesWithUeSn:(NSString*)ueSn block:(void (^)(OneDayMilesResponse *_oneDayMilesResponse, NSError *error)) block;

/**
 * 获取扩展参数信息
 * @param ueSn 设备序列号
 */
+(NSURLSessionDataTask *)getExtendCCWithUeSn:(NSString*)ueSn block:(void (^)(ExtendCCResponse *_extendCCResponse, NSError *error)) block;

/**
 * 获取固件版本
 * @param ueSn 设备序列号
 * @param currentVersion 当前中控软件版本
 * @param hardwareVersion 中控硬件版本
 * @return
 */
+(NSURLSessionDataTask *)getFirmwareversionWithUeSn:(NSString*)ueSn currentVersion:(NSString*)currentVersion hardwareVersion:(NSString*)hardwareVersion block:(void (^)(FirmwareVersionResponse *_firmwareVersionResponse, NSError *error)) block;

/**
 * 获取授权码
 * @param ueSn 设备序列号
 * @return
 */
+(NSURLSessionDataTask *)getAuthorizeCodeWithUeSn:(NSString*)ueSn block:(void (^)(AuthCodeResponse *_authCodeResponse, NSError *error)) block;

@end
