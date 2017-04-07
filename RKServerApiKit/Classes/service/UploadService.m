//
//  UploadService.m
//  Pods
//
//  Created by caoyy on 17/4/7.
//
//

#import "UploadService.h"

@implementation UploadService
/**
 车况数据上传
 @param token
 @param serviceId
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)dataUpload:(UploadParam*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [UploadApi dataUpload:_UploadParam block:block];
}
@end
