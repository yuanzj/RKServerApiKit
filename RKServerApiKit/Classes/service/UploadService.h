//
//  UploadService.h
//  Pods
//
//  Created by caoyy on 17/4/7.
//
//

#import <Foundation/Foundation.h>
#import "UploadApi.h"

@interface UploadService : NSObject
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
