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
#pragma mark 设备管理
/**
 * 获取设备列表
 */
+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block;

/**
 * 删除设备
 */
+(NSURLSessionDataTask *)deleteUeWithUeSn:(NSString*)ueSn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block;

/**
 * 绑定设备
 */
+(NSURLSessionDataTask *)bindUeWithUeSn:(NSString*)ueSn vehicleId:(NSString*)vehicleId bindUESn:(NSString*)bindUESn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block;

/**
 * 获取中控设备详情
 */
+(NSURLSessionDataTask *)getCCUDetail:(NSString*)ueSn block:(void (^)(CCUDetailResponse *_GPSDetailResponse, NSError *error)) block;


#pragma mark -
#pragma mark 数据统计

/**
 * 获取指定日期骑行统计
 */
+(NSURLSessionDataTask *)rideDayStatistic:(NSString*)ueSn time:(NSString*)time block:(void (^)(RideDayStatisticResponse *_RideDayStatisticResponse, NSError *error)) block;


/**
 * 最近7天速度统计
 */
+(NSURLSessionDataTask *)rideSpeedStatistic:(NSString*)ueSn block:(void (^)(RideSpeedStatisticResponse *_RideSpeedStatistic, NSError *error)) block;

/**
 * 最近7天里程统计
 */
+(NSURLSessionDataTask *)rideMilesStatistic:(NSString*)ueSn block:(void (^)(RideMilesStatisticResponse *_RideSpeedStatistic, NSError *error)) block;

/**
 * 行车记录概要统计
 */
+(NSURLSessionDataTask *)getRideRecord:(NSString*)ueSn block:(void (^)(RideRecordResponse *_RideSpeedStatistic, NSError *error)) block;

/**
 * 获取单词骑行详细信息
 */
+(NSURLSessionDataTask *)getRideRecordDetail:(NSString*)ueSn startTime:(NSString*)startTime endTime:(NSString*)endTime block:(void (^)(RideRecordDetailResponse *_RideSpeedStatistic, NSError *error)) block;


#pragma mark -
#pragma mark 以下接口废弃

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

//新增重构接口
/**
 * 车辆固件版本上传
 */
+(NSURLSessionDataTask *)carVersionUpload:(NSString*)ueSn upLoadParam:(CarVersionParams*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block;

/**
 * 获取车辆故障
 */
+(NSURLSessionDataTask *)getCarFault:(NSString*)ueSn block:(void (^)(CarFaultResponse *_BaseResponse, NSError *error)) block;

/**
 * 获取当前车况
 */
+(NSURLSessionDataTask *)getCurrentCarStatus:(NSString*)ueSn block:(void (^)(CarStatusResponse *_CarStatusResponse, NSError *error)) block;

/**
 * 获取车辆固件版本信息
 */
+(NSURLSessionDataTask *)getCarVersionInfo:(NSString*)ueSn block:(void (^)(CarVersionInfoResponse *_BaseResponse, NSError *error)) block;

/**
 * 获取车辆数据信息
 */
+(NSURLSessionDataTask *)getGPSDetail:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_GPSDetailResponse, NSError *error)) block;
//新增重构接口

/**
 * 添加车辆
 */
+(NSURLSessionDataTask *)addEbikeWithUeSn:(NSString*)ueSn addModel:(NSString*)addModel block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 获取订单
 */
+(NSURLSessionDataTask *)getOrder:(NSString*)orderId block:(void (^)(Order *mOrder, NSError *error)) block;

/**
 * 上电
 */
+(NSURLSessionDataTask *)poweron:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 断电
 */
+(NSURLSessionDataTask *)poweroff:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 寻车
 */
+(NSURLSessionDataTask *)search:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 开启坐桶
 */
+(NSURLSessionDataTask *)openbox:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 换车
 */
+(NSURLSessionDataTask *)replaceEbike:(NSString*)ueSn orderId:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

/**
 * 还车
 */
+(NSURLSessionDataTask *)endEbike:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block;

@end
