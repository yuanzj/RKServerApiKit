//
//  UeApi.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeApi.h"
#import "RidePowerStatistic.h"
#import "RideUsedTimeStatistic.h"

@implementation UeApi

+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/ue/ue_list" parameters:@{@"pageNo":@(pageNo), @"pageCount":@(pageCount)} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [UeListResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                              @"data5" : [UeInfo class]
                             };
                }];
                [UeInfo mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"accessoryUEs" : [AccessoryUE class]
                             };
                }];
                UeListResponse *mUeListResponse = [UeListResponse mj_objectWithKeyValues:JSON];
                if(mUeListResponse){
                    block(mUeListResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)deleteUeWithUeSn:(NSString*)ueSn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/ue/delete_device" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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

+(NSURLSessionDataTask *)bindUeWithUeSn:(NSString*)ueSn vehicleId:(NSString*)vehicleId bindUESn:(NSString*)bindUESn block:(void (^)(BaseResponse *_baseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/ue/add_device" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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

/**
 * 获取中控设备详情
 */
+(NSURLSessionDataTask *)getCCUDetail:(NSString*)ueSn block:(void (^)(CCUDetailResponse *_GPSDetailResponse, NSError *error)) block{

    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/get_cc_activetime" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                CCUDetailResponse *mBaseResponse = [CCUDetailResponse mj_objectWithKeyValues:JSON];
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


/**
 * 获取设备上报实时信息
 */
+(NSURLSessionDataTask *)getBetteryDetail:(NSString*)ueSn block:(void (^)(BetteryDetailResp *_betteryDetailResponse, NSError *error)) block {
    
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"/api-ebike/v3.1/ues/%@/rt-info",ueSn] parameters:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if(block){
            if (responseObject) {
                BetteryDetailResp *mBetteryDetailResp = [BetteryDetailResp mj_objectWithKeyValues:responseObject];
                if(mBetteryDetailResp){
                    block(mBetteryDetailResp, nil);
                }else{
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

#pragma mark -
#pragma mark 数据统计

/**
 * 获取指定日期骑行统计
 */
+(NSURLSessionDataTask *)rideDayStatistic:(NSString*)ueSn time:(NSString*)time block:(void (^)(RideDayStatisticResponse *_RideDayStatisticResponse, NSError *error)) block{

    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/ride_day_statistic" parameters:@{@"ueSn":(ueSn ? ueSn : @""), @"time":time} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                RideDayStatisticResponse *mRideDayStatisticResponse = [RideDayStatisticResponse mj_objectWithKeyValues:JSON];
                if(mRideDayStatisticResponse){
                    block(mRideDayStatisticResponse, nil);
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
 * 最近7天速度统计
 */
+(NSURLSessionDataTask *)rideSpeedStatistic:(NSString*)ueSn block:(void (^)(RideSpeedStatisticResponse *_RideSpeedStatistic, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/ride_speed_statistic" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RideSpeedStatisticResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data4" : [RideSpeedStatistic class]
                             };
                }];
               
                RideSpeedStatisticResponse *mUeListResponse = [RideSpeedStatisticResponse mj_objectWithKeyValues:JSON];
                if(mUeListResponse){
                    block(mUeListResponse, nil);
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
 * 最近7天里程统计
 */
+(NSURLSessionDataTask *)rideMilesStatistic:(NSString*)ueSn block:(void (^)(RideMilesStatisticResponse *_RideSpeedStatistic, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-analyze/v3.1/statistics/day/mileage" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
//                [RideMilesStatisticResponse mj_setupObjectClassInArray:^NSDictionary *{
//                    return @{
//                             @"data4" : [RideMilesStatistic class]
//                             };
//                }];
//                 RideMilesStatisticResponse *mUeListResponse = [RideMilesStatisticResponse mj_objectWithKeyValues:JSON];
                RideMilesStatisticResponse* mRideMilesStatisticResponse = [[RideMilesStatisticResponse alloc] init];
                NSArray *rideMilesStatisticArray = [RideMilesStatistic mj_objectArrayWithKeyValuesArray:JSON];
                mRideMilesStatisticResponse.data4 = rideMilesStatisticArray;
                if(rideMilesStatisticArray){
                    block(mRideMilesStatisticResponse, nil);
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
 * 最近7天耗电量统计
 */
+(NSURLSessionDataTask *)ridePowerStatistic:(NSString*)ueSn block:(void (^)(NSArray *_RidePowerStatisticArray, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"api-analyze/v3.1/statistics/day/power/%@",ueSn] parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                NSArray *ridePowerStatisticArray = [RidePowerStatistic mj_objectArrayWithKeyValuesArray:JSON];
                if(ridePowerStatisticArray){
                    block(ridePowerStatisticArray, nil);
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
 * 最近7天使用时间统计
 */
+(NSURLSessionDataTask *)rideUsedTimeStatistic:(void (^)(NSArray *_RideUsedTimeStatisticArray, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-analyze/v3.1/statistics/day/total_time" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                NSArray *rideUsedTimeStatisticArray = [RideUsedTimeStatistic mj_objectArrayWithKeyValuesArray:JSON];
                if(rideUsedTimeStatisticArray){
                    block(rideUsedTimeStatisticArray, nil);
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
 * 行车记录概要统计
 */
+(NSURLSessionDataTask *)getRideRecord:(NSString*)startTime page:(NSString*)page limit:(NSString*)limit sort:(NSString*)sort ueSn:(NSString*)ueSn block:(void (^)(RideRecordResponse *_RideSpeedStatistic, NSError *error)) block{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    if (startTime) {
        [params setObject:startTime forKey:@"startTime"];
    }
    if (page) {
        [params setObject:page forKey:@"page"];
    }
    if (limit) {
        [params setObject:limit forKey:@"limit"];
    }
    if (sort) {
        [params setObject:sort forKey:@"sort"];
    }
    
    if (ueSn) {
        [params setObject:ueSn forKey:@"ccuSn"];
    }
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"/api-analyze/v3.1/riderecords" parameters:params completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RideRecordResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"list" : [RideRecord class]
                             };
                }];
                
                RideRecordResponse *mUeListResponse = [RideRecordResponse mj_objectWithKeyValues:JSON];
                if(mUeListResponse){
                    block(mUeListResponse, nil);
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
 * 获取单词骑行详细信息
 */
+(NSURLSessionDataTask *)getRideRecordDetail:(NSString*)ueSn startTime:(NSString*)startTime endTime:(NSString*)endTime block:(void (^)(RideRecordDetailResponse *_RideSpeedStatistic, NSError *error)) block{

    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/ue/ride_record_detail" parameters:@{@"ueSn":(ueSn ? ueSn : @""),@"startTime":startTime,@"endTime":endTime} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RideRecordDetailResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data5" : [RideRecordDetail class]
                             };
                }];
                
                RideRecordDetailResponse *mUeListResponse = [RideRecordDetailResponse mj_objectWithKeyValues:JSON];
                if(mUeListResponse){
                    block(mUeListResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];

}
//////////////////////////////////////////////////////////////////////
////////////////////////////////废弃API////////////////////////////////
//////////////////////////////////////////////////////////////////////


+(NSURLSessionDataTask *)queryUeDetailWithUeSn:(NSString*)ueSn block:(void (^)(UeDetailResponse *_ueDetailResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/get_cc_activetime" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                UeDetailResponse *mUeDetailResponse = [UeDetailResponse mj_objectWithKeyValues:JSON];
                if(mUeDetailResponse){
                    block(mUeDetailResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)calcMilesWithUeSn:(NSString*)ueSn block:(void (^)(OneDayMilesResponse *_oneDayMilesResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"rk600/calc_miles" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                OneDayMilesResponse *mOneDayMilesResponse = [OneDayMilesResponse mj_objectWithKeyValues:JSON];
                if(mOneDayMilesResponse){
                    block(mOneDayMilesResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getExtendCCWithUeSn:(NSString*)ueSn block:(void (^)(ExtendCCResponse *_extendCCResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"rk600/get_cc_extend" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                ExtendCCResponse *mExtendCCResponse = [ExtendCCResponse mj_objectWithKeyValues:JSON];
                if(mExtendCCResponse){
                    block(mExtendCCResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getFirmwareversionWithUeSn:(NSString*)ueSn currentVersion:(NSString*)currentVersion hardwareVersion:(NSString*)hardwareVersion block:(void (^)(FirmwareVersionResponse *_firmwareVersionResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"get_firmwareversion" parameters:@{@"ueSn":(ueSn ? ueSn : @""), @"currentVersion":currentVersion, @"hardwareVersion":hardwareVersion} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                FirmwareVersionResponse *_firmwareVersionResponse = [FirmwareVersionResponse mj_objectWithKeyValues:JSON];
                if(_firmwareVersionResponse){
                    block(_firmwareVersionResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getAuthorizeCodeWithUeSn:(NSString*)ueSn block:(void (^)(AuthCodeResponse *_authCodeResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/ue/get_auth_code" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                AuthCodeResponse *_authCodeResponse = [AuthCodeResponse mj_objectWithKeyValues:JSON];
                if(_authCodeResponse){
                    block(_authCodeResponse, nil);
                }else{
                    block(nil, error);
                }
            }else{
                block(nil, error);
            }
        }
    }];
}

//新增重构接口
/**
 车辆固件版本上传
 @param ueSn
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)carVersionUpload:(NSString*)ueSn upLoadParam:(CarVersionParams*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"api-ebike/v3.0/app/car_version_upload" parameters:@{@"ueSn":(ueSn ? ueSn : @""), @"versionInfo":[_UploadParam mj_JSONString]} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
    
}

/**
 获取车辆故障
 @param ueSn
 @param block
 @return CarFaultResponse
 */
+(NSURLSessionDataTask *)getCarFault:(NSString*)ueSn block:(void (^)(CarFaultResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/app/get_car_fault" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                CarFaultResponse *mBaseResponse = [CarFaultResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

/**
 * 获取当前车况
 */
+(NSURLSessionDataTask *)getCurrentCarStatus:(NSString*)ueSn block:(void (^)(CarStatusResponse *_CarStatusResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/app/get_car_info" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                CarStatusResponse *mBaseResponse = [CarStatusResponse mj_objectWithKeyValues:JSON];
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

/**
 获取车辆固件版本信息
 @param ueSn
 @param block
 @return CarFaultResponse
 */
+(NSURLSessionDataTask *)getCarVersionInfo:(NSString*)ueSn block:(void (^)(CarVersionInfoResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/app/get_car_version_info" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                CarVersionInfoResponse *mBaseResponse = [CarVersionInfoResponse mj_objectWithKeyValues:JSON];
                if(mBaseResponse){
                    block(mBaseResponse, nil);
                } else {
                    block(nil, error);
                }
            } else {
                block(nil, error);
            }
        }
    }];
}

/**
 * 获取中控名下GPS设备详情
 */
+(NSURLSessionDataTask *)getGPSDetail:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_GPSDetailResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"api-ebike/v3.0/app/get_data_unit_info" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                GPSDetailResponse *mBaseResponse = [GPSDetailResponse mj_objectWithKeyValues:JSON];
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
//新增重构接口

+(NSURLSessionDataTask *)addEbikeWithUeSn:(NSString*)ueSn addModel:(NSString*)addModel block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] POST:@"api-ebike/v3.1/relations/rent-add" parameters:@{@"ueSn":(ueSn ? ueSn : @""), @"addModel":(addModel ? addModel : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)addUserEbikeWithUeSn:(NSString*)ueSn addModel:(NSString*)addModel block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] POST:@"api-ebike/v3.1/relations/add" parameters:@{@"ueSn":(ueSn ? ueSn : @""), @"addModel":(addModel ? addModel : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 获取订单
 */
+(NSURLSessionDataTask *)getOrder:(NSString*)orderId block:(void (^)(Order *mOrder, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:[@"api-order/v3.1/orders/" stringByAppendingString:orderId] parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                Order *mOrder = [Order mj_objectWithKeyValues:JSON];
                if(mOrder){
                    block(mOrder, nil);
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
 * 上电
 */
+(NSURLSessionDataTask *)poweron:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    NSString* url = [NSString stringWithFormat:@"/api-ebike/v3.1/ebikes/%@/power-on", ueSn];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 断电
 */
+(NSURLSessionDataTask *)poweroff:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    NSString* url = [NSString stringWithFormat:@"/api-ebike/v3.1/ebikes/%@/power-off", ueSn];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 寻车
 */
+(NSURLSessionDataTask *)search:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    NSString* url = [NSString stringWithFormat:@"/api-ebike/v3.1/ebikes/%@/search", ueSn];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 开启坐桶
 */
+(NSURLSessionDataTask *)openbox:(NSString*)ueSn  block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block{
    NSString* url = [NSString stringWithFormat:@"/api-ebike/v3.1/ebikes/%@/open-box", ueSn];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)restartUe:(NSString*)ueSn block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    NSString* url = [NSString stringWithFormat:@"/api-ebike/v3.1/ebikes/%@/restart", ueSn];
    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 换车
 */
+(NSURLSessionDataTask *)replaceEbike:(NSString*)ueSn orderId:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    NSString* url = [NSString stringWithFormat:@"api-order/v3.1/orders/%@/replace/%@", orderId, ueSn];
    return [[AFAppDotNetAPIClient sharedClient] PUT:url parameters:@{@"safeCode":(safeCode ? safeCode : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

/**
 * 还车
 */
+(NSURLSessionDataTask *)endEbike:(NSString*)orderId safeCode:(NSString*)safeCode block:(void (^)(NSURLResponse *response, ErrorResp *errorResp, NSError *error)) block {
    NSString* url = [NSString stringWithFormat:@"api-order/v3.1/orders/%@/end", orderId];
    return [[AFAppDotNetAPIClient sharedClient] PUT:url parameters:@{@"safeCode":(safeCode ? safeCode : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if (JSON) {
                ErrorResp *mErrorResp = [ErrorResp mj_objectWithKeyValues:JSON];
                block(response, mErrorResp, error);
            } else {
                block(response, nil, error);
            }
        }
    }];
}

+(NSURLSessionDataTask *)getEproductInfo:(NSString*)ueSn block:(void (^)(Eproduct *mEproduct, NSError *error)) block {
    return [[AFAppDotNetAPIClient sharedClient] GET:[@"/api-order/v3.1/products/detail?ccuSn=" stringByAppendingString:ueSn] parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                Eproduct *mEproduct = [Eproduct mj_objectWithKeyValues:JSON];
                if(mEproduct){
                    block(mEproduct, nil);
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
