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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"ue_list" parameters:@{@"pageNo":@(pageNo), @"pageCount":@(pageCount)} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        if(block){
            if(JSON){
                // Tell MJExtension what type model will be contained in data and accessoryUEs.
                [UeListResponse mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                              @"data" : [UeInfo class]
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"delete_device" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    [paramsDict setValue:ueSn forKey:@"ueSn"];
    [paramsDict setValue:vehicleId forKey:@"vehicleId"];
    [paramsDict setValue:bindUESn forKey:@"bindUESn"];
    //@{@"sessionId":sessionId, @"ueSn":ueSn, @"vehicleId":vehicleId, @"bindUESn":bindUESn}
    return [[AFAppDotNetAPIClient sharedClient] GET:@"add_device" parameters:paramsDict completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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

+(NSURLSessionDataTask *)queryUeDetailWithUeSn:(NSString*)ueSn block:(void (^)(UeDetailResponse *_ueDetailResponse, NSError *error)) block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"get_uedetail" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"rk600/calc_miles" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"rk600/get_cc_extend" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"get_firmwareversion" parameters:@{@"ueSn":ueSn, @"currentVersion":currentVersion, @"hardwareVersion":hardwareVersion} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
    return [[AFAppDotNetAPIClient sharedClient] GET:@"authorize_code" parameters:@{@"ueSn":ueSn} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
