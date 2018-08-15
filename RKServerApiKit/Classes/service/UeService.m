//
//  UeService.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeService.h"
#import "RealmManager.h"
#import "RideDayStatisticDb.h"

@implementation UeService

+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block{
    return [UeApi getUEListWithPageNo:pageNo pageCount:pageCount block:^(UeListResponse *_ueListResponse, NSError *error){
        if (_ueListResponse) {
            if(_ueListResponse.state == RKSAPIResponseSuccess){
                
                NSArray* data = _ueListResponse.data5;
                [RealmManager clearUeInfoList];
                if (data && data.count > 0) {
                    [RealmManager saveUeInfoList:data];
                }
                
            }
            
            block(_ueListResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

+(NSURLSessionDataTask *)deleteUeWithUeSn:(NSString*)ueSn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block{
    return [UeApi deleteUeWithUeSn:ueSn block:block];
}

+(NSURLSessionDataTask *)bindUeWithUeSn:(NSString*)ueSn vehicleId:(NSString*)vehicleId bindUESn:(NSString*)bindUESn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block{
    return [UeApi bindUeWithUeSn:ueSn vehicleId:vehicleId bindUESn:bindUESn block:block];
}

/**
 * 获取中控设备详情
 */
+(NSURLSessionDataTask *)getCCUDetail:(NSString*)ueSn block:(void (^)(CCUDetailResponse *_GPSDetailResponse, NSError *error)) block{
    return [UeApi getCCUDetail:ueSn block:block];
}

/**
 * 获取设备上报实时信息
 */
+(NSURLSessionDataTask *)getBetteryDetail:(NSString*)ueSn block:(void (^)(BetteryDetailResp *_betteryDetailResponse, NSError *error)) block {
    return [UeApi getBetteryDetail:ueSn block:block];
}

/**
 * 获取指定日期骑行统计
 */
+(NSURLSessionDataTask *)rideDayStatistic:(NSString*)ueSn time:(NSString*)time block:(void (^)(RideDayStatisticResponse *_RideDayStatisticResponse, NSError *error)) block{
    return [UeApi rideDayStatistic:ueSn time:time block:^(RideDayStatisticResponse *_RideDayStatisticResponse, NSError *error) {
        if (_RideDayStatisticResponse) {
            if(_RideDayStatisticResponse.state == RKSAPIResponseSuccess){
                
                RideDayStatistic* mRideDayStatistic = _RideDayStatisticResponse.data;
                if (mRideDayStatistic) {
                    [RealmManager clearRideDayStatisticDbBySn:ueSn];
                    RideDayStatisticDb * mRideDayStatisticDb = [[RideDayStatisticDb alloc] init];
                    [mRideDayStatisticDb setUeSn:ueSn];
                    [mRideDayStatisticDb setRideDayStatistic:mRideDayStatistic];
                    [RealmManager saveRideDayStatisticDb:mRideDayStatisticDb];
                }
                
            }
            
            block(_RideDayStatisticResponse, nil);
        } else {
            block(nil, error);
        }
    }];

}


/**
 * 最近7天速度统计
 */
+(NSURLSessionDataTask *)rideSpeedStatistic:(NSString*)ueSn block:(void (^)(RideSpeedStatisticResponse *_RideSpeedStatistic, NSError *error)) block{
    return [UeApi rideSpeedStatistic:ueSn block:^(RideSpeedStatisticResponse *__RideSpeedStatistic, NSError *error){
        if (__RideSpeedStatistic) {
            if(__RideSpeedStatistic.state == RKSAPIResponseSuccess){
                
                NSArray* data = __RideSpeedStatistic.data4;
                if (data && data.count > 0) {
                    [RealmManager clearRideSpeedStatisticDbBySn:ueSn];
                    RideSpeedStatisticDb* rideSpeedStatisticDb = [[RideSpeedStatisticDb alloc] init];
                    [rideSpeedStatisticDb setUeSn:ueSn];
                    [rideSpeedStatisticDb setRideSpeedStatistics:data];
                    [RealmManager saveRideSpeedStatisticDb:rideSpeedStatisticDb];
                }
                
            }
            
            block(__RideSpeedStatistic, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 最近7天里程统计
 */
+(NSURLSessionDataTask *)rideMilesStatistic:(NSString*)ueSn block:(void (^)(RideMilesStatisticResponse *_RideSpeedStatistic, NSError *error)) block{
    return [UeApi rideMilesStatistic:ueSn block:^(RideMilesStatisticResponse *_RideSpeedStatistic, NSError *error){
        if (_RideSpeedStatistic) {
            if(_RideSpeedStatistic.state == RKSAPIResponseSuccess){
                
                NSArray* data = _RideSpeedStatistic.data4;
                if (data && data.count > 0) {
                    [RealmManager clearRideMilesStatisticDbBySn:ueSn];
                    RideMilesStatisticDb* rideMilesStatisticDb = [[RideMilesStatisticDb alloc] init];
                    [rideMilesStatisticDb setUeSn:ueSn];
                    [rideMilesStatisticDb setRideMilesStatistics:data];
                    [RealmManager saveRideMilesStatisticDb:rideMilesStatisticDb];
                }
                
            }
            
            block(_RideSpeedStatistic, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 最近7天耗电量统计
 */
+(NSURLSessionDataTask *)ridePowerStatistic:(NSString*)ueSn block:(void (^)(NSArray *_RidePowerStatisticArray, NSError *error)) block {
    return [UeApi ridePowerStatistic:ueSn block:^(NSArray *_RidePowerStatisticArray, NSError *error) {
        if (_RidePowerStatisticArray) {
            block(_RidePowerStatisticArray, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 最近7天使用时间统计
 */
+(NSURLSessionDataTask *)rideUsedTimeStatistic:(void (^)(NSArray *_RideUsedTimeStatisticArray, NSError *error)) block {
    return [UeApi rideUsedTimeStatistic:^(NSArray *_RideUsedTimeStatisticArray, NSError *error) {
        if (_RideUsedTimeStatisticArray) {
            block(_RideUsedTimeStatisticArray, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 行车记录概要统计
 */
+(NSURLSessionDataTask *)getRideRecord:(NSString*)startTime page:(NSString*)page limit:(NSString*)limit sort:(NSString*)sort ueSn:(NSString*)ueSn block:(void (^)(RideRecordResponse *_RideSpeedStatistic, NSError *error)) block{
    return [UeApi getRideRecord:startTime page:page limit:limit sort:sort ueSn:ueSn block:^(RideRecordResponse *_RideRecordResponse, NSError *error) {
        if (_RideRecordResponse) {
            if(_RideRecordResponse.state == RKSAPIResponseSuccess){
                
                NSArray* data = _RideRecordResponse.list;
                if (data && data.count > 0) {
                    [RealmManager clearRideRecordList];
                    [RealmManager saveRideRecordList:data];
                }
                
            }
            
            block(_RideRecordResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

/**
 * 获取单词骑行详细信息
 */
+(NSURLSessionDataTask *)getRideRecordDetail:(NSString*)ueSn startTime:(NSString*)startTime endTime:(NSString*)endTime block:(void (^)(RideRecordDetailResponse *_RideSpeedStatistic, NSError *error)) block{
    return [UeApi getRideRecordDetail:ueSn startTime:startTime endTime:endTime block:block];
}


+(NSURLSessionDataTask *)queryUeDetailWithUeSn:(NSString*)ueSn block:(void (^)(UeDetailResponse *_ueDetailResponse, NSError *error)) block{
    return [UeApi queryUeDetailWithUeSn:ueSn block:block];
}

+(NSURLSessionDataTask *)calcMilesWithUeSn:(NSString*)ueSn block:(void (^)(OneDayMilesResponse *_oneDayMilesResponse, NSError *error)) block{
    return [UeApi calcMilesWithUeSn:ueSn block:block];
}

+(NSURLSessionDataTask *)getExtendCCWithUeSn:(NSString*)ueSn block:(void (^)(ExtendCCResponse *_extendCCResponse, NSError *error)) block{
    return [UeApi getExtendCCWithUeSn:ueSn block:block];
}

+(NSURLSessionDataTask *)getFirmwareversionWithUeSn:(NSString*)ueSn currentVersion:(NSString*)currentVersion hardwareVersion:(NSString*)hardwareVersion block:(void (^)(FirmwareVersionResponse *_firmwareVersionResponse, NSError *error)) block{
    return [UeApi getFirmwareversionWithUeSn:ueSn currentVersion:currentVersion hardwareVersion:hardwareVersion block:block];
}

+(NSURLSessionDataTask *)getAuthorizeCodeWithUeSn:(NSString*)ueSn block:(void (^)(AuthCodeResponse *_authCodeResponse, NSError *error)) block{
    return [UeApi getAuthorizeCodeWithUeSn:ueSn block:^(AuthCodeResponse *_AuthCodeResponse, NSError *error){
        if (_AuthCodeResponse) {
            if(_AuthCodeResponse.state == RKSAPIResponseSuccess){
                AuthCodeData *data = _AuthCodeResponse.data;
                if (data) {
                    data.ueSn = ueSn;
                    [RealmManager saveAuthCodeData:data];
                }
            }
            
            block(_AuthCodeResponse, nil);
        } else {
            block(nil, error);
        }
    }];
}

//新增重构接口
/**
 * 车辆固件版本上传
 */
+(NSURLSessionDataTask *)carVersionUpload:(NSString*)ueSn upLoadParam:(CarVersionParams*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [UeApi carVersionUpload:ueSn upLoadParam:_UploadParam block:block];
}

/**
 * 获取车辆故障
 */
+(NSURLSessionDataTask *)getCarFault:(NSString*)ueSn block:(void (^)(CarFaultResponse *_BaseResponse, NSError *error)) block{
    return [UeApi getCarFault:ueSn block:block];
}

/**
 * 获取当前车况
 */
+(NSURLSessionDataTask *)getCurrentCarStatus:(NSString*)ueSn block:(void (^)(CarStatusResponse *_CarStatusResponse, NSError *error)) block{
    return [UeApi getCurrentCarStatus:ueSn block:block];
}

/**
 * 获取车辆固件版本信息
 */
+(NSURLSessionDataTask *)getCarVersionInfo:(NSString*)ueSn block:(void (^)(CarVersionInfoResponse *_BaseResponse, NSError *error)) block{
    return [UeApi getCarVersionInfo:ueSn block:block];
}

/**
 * 获取车辆数据信息
 */
+(NSURLSessionDataTask *)getGPSDetail:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_GPSDetailResponse, NSError *error)) block{
    return [UeApi getGPSDetail:ueSn block:block];
}
//新增重构接口

+(NSURLSessionDataTask *)addEbikeWithUeSn:(NSString*)ueSn addModel:(NSString*)addModel block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    return [UeApi addEbikeWithUeSn:ueSn addModel:addModel block:block];
}

+(NSURLSessionDataTask *)addUserEbikeWithUeSn:(NSString*)ueSn addModel:(NSString*)addModel block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    return [UeApi addUserEbikeWithUeSn:ueSn addModel:addModel block:block];
}

/**
 * 获取订单
 */
+(NSURLSessionDataTask *)getOrder:(NSString*)orderId block:(void (^)(Order *mOrder, NSError *error)) block{
    return [UeApi getOrder:orderId block:block];
}

/**
 * 上电
 */
+(NSURLSessionDataTask *)poweron:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi poweron:ueSn block:block];
}

/**
 * 断电
 */
+(NSURLSessionDataTask *)poweroff:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi poweroff:ueSn block:block];
}

/**
 * 寻车
 */
+(NSURLSessionDataTask *)search:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi search:ueSn block:block];
}

/**
 * 开启坐桶
 */
+(NSURLSessionDataTask *)openbox:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi openbox:ueSn block:block];
}

+(NSURLSessionDataTask *)restartUe:(NSString*)ueSn block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi restartUe:ueSn block:block];
}

/**
 * 换车
 */
+(NSURLSessionDataTask *)replaceEbike:(NSString*)ueSn orderId:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi replaceEbike:ueSn orderId:orderId safeCode:safeCode block:block];
}

/**
 * 还车
 */
+(NSURLSessionDataTask *)endEbike:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    return [UeApi endEbike:orderId safeCode:safeCode block:block];
}

/**
 * 获取ebike等的信息
 */
+(NSURLSessionDataTask *)getEproductInfo:(NSString*)ueSn block:(void (^)(Eproduct *mEproduct, NSError *error)) block {
    return [UeApi getEproductInfo:ueSn block:block];
}

@end
