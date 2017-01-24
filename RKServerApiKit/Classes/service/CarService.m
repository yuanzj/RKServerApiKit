//
//  CarService.m
//  Pods
//
//  Created by Yuan ZhiJian on 2016/11/8.
//
//

#import "CarService.h"

@implementation CarService

/**
 1.1	App数据上传
 @param ueSn
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)dataUpload:(UploadParam*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [CarApi dataUpload:_UploadParam block:block];
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
    return [CarApi versionUpload:ueSn ccuType:ccuType ccuSoftVersion:ccuSoftVersion pcuType:pcuType pcuSoftVersion:pcuSoftVersion block:block];
}

/**
 获取设备版本信息
 @param ueSn
 @param block
 @return
 */
+(NSURLSessionDataTask *)getVersion:(NSString*)ueSn block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [CarApi getVersion:ueSn block:block];
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
    return [CarApi setServiceStatus:ueSn imei:imei serviceStatus:serviceStatus block:block];
}

/**
 1.1	获取服务开启状态
 
 @param ueSn
 @param block
 @return  GPSDetailResponse GPSDetail serviceStatus
 */
+(NSURLSessionDataTask *)getServiceStatus:(NSString*)ueSn block:(void (^)(GPSDetailResponse *_BaseResponse, NSError *error)) block{
    return [CarApi getServiceStatus:ueSn block:block];
}

/**
 * 获取可租赁车辆列表
 */
+(NSURLSessionDataTask *)getRentCarWithBlock:(void (^)(RentCarResponse *_ueListResponse, NSError *error)) block{
    return [CarApi getRentCarWithBlock:block];
}

/**
 * 1.1	预约租车
 */
+(NSURLSessionDataTask *)appointmentCar:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [CarApi appointmentCar:ueSn block:block];
}
/**
 * 1.1	取消预约
 */
+(NSURLSessionDataTask *)cancalAppointment:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [CarApi cancalAppointment:ueSn block:block];
}

/**
 * 1.1	确认租车
 */
+(NSURLSessionDataTask *)confirmRental:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [CarApi confirmRental:ueSn block:block];
}

/**
 * 1.1	确认还车
 */
+(NSURLSessionDataTask *)confirmReturn:(NSString*)ueSn  block:(void (^)(BaseResponse *_ueListResponse, NSError *error)) block{
    return [CarApi confirmReturn:ueSn block:block];
}

/**
 * 1.1	获取当前用户的预约信息
 */
+(NSURLSessionDataTask *)getAppointmentInfoWithBlock:(void (^)(RentCarItemResponse *_ueListResponse, NSError *error)) block{
    return [CarApi getAppointmentInfoWithBlock:block];
}

@end
