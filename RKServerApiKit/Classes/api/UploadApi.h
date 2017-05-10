//
//  UploadApi.h
//  Pods
//
//  Created by caoyy on 17/4/6.
//
//
#import <Foundation/Foundation.h>
#import "UploadParam.h"
#import "BaseResponse.h"

@interface UploadApi : NSObject
/**
 车况数据上传
 @param token
 @param serviceId
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)dataUpload:(UploadParam*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block;
@end
