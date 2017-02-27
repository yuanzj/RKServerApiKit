//
//  CarApi.m
//  Pods
//
//  Created by Yuan ZhiJian on 2016/11/8.
//
//

#import "CarApi.h"

@implementation CarApi

/**
 1.1	App数据上传
 @param ueSn
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)dataUpload:(UploadParam*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{

    return [[AFAppDotNetAPIClient sharedClient] POST:@"car/data_upload" parameters:@{@"dataParam":[_UploadParam mj_JSONString]} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 上报设备版本信息
 @param ueSn
 @param ccuType
 @param ccuSoftVersion
 @param pcuType
 @param pcuSoftVersion
 @param block
 @return
 */
+(NSURLSessionDataTask *)versionUpload:(NSString*)ueSn ccuType :(NSString*)ccuType  ccuSoftVersion :(NSString*)ccuSoftVersion pcuType :(NSString*)pcuType pcuSoftVersion :(NSString*)pcuSoftVersion block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] POST:@"car/version_upload" parameters:@{@"ueSn":(ueSn ? ueSn : @""),@"ccuType":ccuType,@"ccuSoftVersion":ccuSoftVersion,@"pcuType":pcuType,@"pcuSoftVersion":pcuSoftVersion} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 获取设备版本信息
 @param ueSn
 @param block
 @return
 */
+(NSURLSessionDataTask *)getVersion:(NSString*)ueSn block:(void (^)(GetUeVersionResponse *getUeVersionResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] POST:@"car/get_version" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                GetUeVersionResponse *getUeVersionResponse = [GetUeVersionResponse mj_objectWithKeyValues:JSON];
                if(getUeVersionResponse){
                    block(getUeVersionResponse, nil);
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
 设置服务开启状态
 @param ueSn
 @param imei
 @param serviceStatus  0:开启 1：未开启
 @param block
 @return
 */
+(NSURLSessionDataTask *)setServiceStatus:(NSString*)ueSn imei :(NSString*)imei  serviceStatus :(NSString*)serviceStatus  block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] POST:@"car/set_service_status" parameters:@{@"ueSn":(ueSn ? ueSn : @""),@"imei":imei,@"serviceStatus":serviceStatus} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 1.1	获取服务开启状态
 
 @param ueSn
 @param block
 @return GPSDetailResponse
 */
+(NSURLSessionDataTask *)getServiceStatus:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car/get_service_status" parameters:@{@"ueSn":(ueSn ? ueSn : @"")} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                GPSDetailResponse *mBaseResponse = [GPSDetailResponse mj_objectWithKeyValues:JSON];
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
 * 获取可租赁车辆列表
 */
+(NSURLSessionDataTask *)getRentCarWithBlock:(void (^)(RentCarResponse *_ueListResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/get_all_rental_cars" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [RentCarResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"data4" : [RentCar class]
                             };
                }];
                RentCarResponse *mUeListResponse = [RentCarResponse mj_objectWithKeyValues:JSON];
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
 * 1.1	预约租车
 */
+(NSURLSessionDataTask *)appointmentCar:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/appointment_car" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 * 1.1	取消预约
 */
+(NSURLSessionDataTask *)cancalAppointment:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/cancel_appointment" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 * 1.1	确认租车
 */
+(NSURLSessionDataTask *)confirmRental:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/confirm_rental" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 * 1.1	确认还车
 */
+(NSURLSessionDataTask *)confirmReturn:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/confirm_return" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
 * 1.1	获取当前用户的预约信息
 */
+(NSURLSessionDataTask *)getAppointmentInfoWithBlock:(void (^)(RentCarItemResponse *_ueListResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"car_rental/get_appointment_info" parameters:nil completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                RentCarItemResponse *mUeListResponse = [RentCarItemResponse mj_objectWithKeyValues:JSON];
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

@end
