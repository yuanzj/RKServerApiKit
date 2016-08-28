//
//  UeService.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/26.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "UeService.h"
#import "RealmManager.h"


@implementation UeService

+(NSURLSessionDataTask *)getUEListWithPageNo:(int)pageNo pageCount:(int)pageCount block:(void (^)(UeListResponse *_ueListResponse, NSError *error)) block{
    return [UeApi getUEListWithPageNo:pageNo pageCount:pageCount block:^(UeListResponse *_ueListResponse, NSError *error){
        if (_ueListResponse) {
            if(_ueListResponse.state == 0){
                
                NSArray* data = _ueListResponse.data;
                if (data && data.count > 0) {
                    [RealmManager clearUeInfoList];
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
    return [UeApi getAuthorizeCodeWithUeSn:ueSn block:block];
}

@end
