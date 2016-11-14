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

@end
