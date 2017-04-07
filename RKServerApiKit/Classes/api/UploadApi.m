//
//  UploadApi.m
//  Pods
//
//  Created by caoyy on 17/4/6.
//
//

#import "UploadApi.h"
#import "AFAppUploadAPIClient.h"

@implementation UploadApi
/**
 车况数据上传
 @param token
 @param serviceId
 @param UploadParam
 @param block
 @return
 */
+(NSURLSessionDataTask *)dataUpload:(UploadParam*)_UploadParam block:(void (^)(BaseResponse *_BaseResponse, NSError *error)) block{
    return [[AFAppUploadAPIClient sharedClient] POST:@"upload/data_upload" parameters:@{@"dataParam":[_UploadParam mj_JSONString]} completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
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
@end
