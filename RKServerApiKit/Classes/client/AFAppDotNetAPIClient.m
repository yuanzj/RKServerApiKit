//
//  AFAppDotNetAPIClient.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithSessionConfiguration:configuration];
    });
    return _sharedClient;
}

- (NSURLSessionDataTask*)GET:(NSString *)URLString
                  parameters:(id)parameters
           completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppDotNetAPIClient *weakClient = self;
    
    //完整URL
    NSString* URL = [AFAppDotNetAPIBaseURLString stringByAppendingString:URLString];
    //parameters转换成NSMutableDictionary
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    //是否是需要sessionId的接口
    if (![[[ApiNotNeedSessionIdDic getApiDic] allKeys] containsObject:URL]) {
        //没有获取到sessionId则抛出error
        if ([[Validator getValidSessionId] isKindOfClass:[NSError class]]) {
            completionHandler(nil, nil, [Validator getValidSessionId]);
            return nil;
        }else{
            //有sessionId则增加sessionId参数
            [paramsDic setObject:[Validator getValidSessionId] forKey:@"sessionId"];
        }
    }
    
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URL parameters:paramsDic error:nil];
    NSURLSessionDataTask* dataTask =  [[AFAppDotNetAPIClient sharedClient] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:responseObject];
        if (mBaseResponse.state == SESSION_OUT) {
            User *_mUser = [User getUser];
            [UserService loginWithMobile:_mUser.username password:_mUser.password block:^(UserResponse *_mUserResp, NSError *_mUserError) {
                if(_mUserResp && _mUserResp.state == 0){
                    [weakClient GET:URLString parameters:parameters completionHandler:completionHandler];
                }else{
                    completionHandler(response, responseObject, error);
                }
            }];
        }else{
            completionHandler(response, responseObject, error);
        }
    }];
    [dataTask resume];
    return dataTask;
}

- (NSURLSessionDataTask*)POST:(NSString *)URLString
                   parameters:(id)parameters
            completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppDotNetAPIClient *weakClient = self;
    
    NSString* URL = [AFAppDotNetAPIBaseURLString stringByAppendingString:URLString];
    
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (![[[ApiNotNeedSessionIdDic getApiDic] allKeys] containsObject:URL]) {
        if ([[Validator getValidSessionId] isKindOfClass:[NSError class]]) {
            completionHandler(nil, nil, [Validator getValidSessionId]);
            return nil;
        }else{
            [paramsDic setObject:[Validator getValidSessionId] forKey:@"sessionId"];
        }
    }
    
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URL parameters:paramsDic error:nil];
    NSURLSessionDataTask* dataTask =  [[AFAppDotNetAPIClient sharedClient] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:responseObject];
        if (mBaseResponse.state == SESSION_OUT) {
            User *_mUser = [User getUser];
            [UserService loginWithMobile:_mUser.username password:_mUser.password block:^(UserResponse *_mUserResp, NSError *_mUserError) {
                if(_mUserResp && _mUserResp.state == 0){
                    [weakClient GET:URLString parameters:parameters completionHandler:completionHandler];
                }else{
                    completionHandler(response, responseObject, error);
                }
            }];
        }else{
            completionHandler(response, responseObject, error);
        }
    }];
    [dataTask resume];
    return dataTask;
}

- (NSURLSessionDataTask*)UPLOAD:(NSString *)URLString
                     parameters:(id)parameters
                          image:(UIImage*)image
              completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppDotNetAPIClient *weakClient = self;
    
    NSString* URL = [AFAppDotNetAPIBaseURLString stringByAppendingString:URLString];
    
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (![[[ApiNotNeedSessionIdDic getApiDic] allKeys] containsObject:URL]) {
        if ([[Validator getValidSessionId] isKindOfClass:[NSError class]]) {
            completionHandler(nil, nil, [Validator getValidSessionId]);
            return nil;
        }else{
            [paramsDic setObject:[Validator getValidSessionId] forKey:@"sessionId"];
        }
    }
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:URL parameters:paramsDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //        [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath] name:@"file" fileName:@"cropImage.jpg" mimeType:@"image/jpeg" error:nil];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      //                      dispatch_async(dispatch_get_main_queue(), ^{
                      //                          //Update the progress view
                      //                          [progressView setProgress:uploadProgress.fractionCompleted];
                      //                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      BaseResponse *mBaseResponse = [BaseResponse mj_objectWithKeyValues:responseObject];
                      if (mBaseResponse.state == SESSION_OUT) {
                          User *_mUser = [User getUser];
                          [UserService loginWithMobile:_mUser.username password:_mUser.password block:^(UserResponse *_mUserResp, NSError *_mUserError) {
                              if(_mUserResp && _mUserResp.state == 0){
                                  [weakClient GET:URLString parameters:parameters completionHandler:completionHandler];
                              }else{
                                  completionHandler(response, responseObject, error);
                              }
                          }];
                      }else{
                          completionHandler(response, responseObject, error);
                      }
                  }];
    
    [uploadTask resume];
    return uploadTask;
}

@end

