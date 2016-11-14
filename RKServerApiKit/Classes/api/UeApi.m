//
//  UeApi.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeApi.h"

@implementation UeApi

+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"user/ue_list" parameters:@{@"pageNo":@(pageNo), @"pageCount":@(pageCount)} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/delete_device" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/add_device" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 * 获取中控名下GPS设备详情
 */
+(NSURLSessionDataTask *)getGPSDetail:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_GPSDetailResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/get_gps_detail" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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

#pragma mark -
#pragma mark 数据统计
/**
 * 获取当前车况
 */
+(NSURLSessionDataTask *)getCurrentCarStatus:(NSString*)ueSn block:(void (^)(CarStatusResponse *_CarStatusResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car/get_current_car_status" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/ride_miles_statistic" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RideMilesStatisticResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data4" : [RideMilesStatistic class]
                             };
                }];
                
                RideMilesStatisticResponse *mUeListResponse = [RideMilesStatisticResponse mj_objectWithKeyValues:JSON];
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
 * 行车记录概要统计
 */
+(NSURLSessionDataTask *)getRideRecord:(NSString*)ueSn block:(void (^)(RideRecordResponse *_RideSpeedStatistic, NSError *error)) block{

    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/ride_record_statistic" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RideRecordResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data5" : [RideRecord class]
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

    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/ride_record_detail" parameters:@{@"ueSn":(ueSn ? ueSn : @""),@"startTime":startTime,@"endTime":endTime} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue/get_auth_code" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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

@end
