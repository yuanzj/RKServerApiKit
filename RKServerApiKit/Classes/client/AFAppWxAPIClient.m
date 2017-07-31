//
//  AFAppWxAPIClient.m
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import "AFAppWxAPIClient.h"
#import "AFURLResponseSerialization.h"

@implementation AFAppWxAPIClient

+ (instancetype)sharedClient {
    static AFAppWxAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.timeoutIntervalForRequest = 5;
        configuration.timeoutIntervalForResource = 5;
        _sharedClient = [[AFAppWxAPIClient alloc] initWithSessionConfiguration:configuration];
    });
    return _sharedClient;
}

- (NSURLSessionDataTask*)GET:(NSString *)URLString
                  parameters:(id)parameters
           completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppWxAPIClient *weakClient = self;
    
    //完整URL
    NSString* URL = [AFAppWxAPIBaseURLString stringByAppendingString:URLString];
    //parameters转换成NSMutableDictionary
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URL parameters:paramsDic error:nil];
    NSURLSessionDataTask* dataTask =  [[AFAppWxAPIClient sharedClient] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response, responseObject, error);
    }];
    [dataTask resume];
    return dataTask;
}

- (NSURLSessionDataTask*)POST:(NSString *)URLString
                   parameters:(id)parameters
            completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppWxAPIClient *weakClient = self;
    
    NSString* URL = [AFAppWxAPIBaseURLString stringByAppendingString:URLString];
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URL parameters:paramsDic error:nil];

    NSURLSessionDataTask* dataTask =  [[AFAppWxAPIClient sharedClient] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response, responseObject, error);
    }];
    [dataTask resume];
    return dataTask;
}

- (NSURLSessionDataTask*)UPLOAD:(NSString *)URLString
                     parameters:(id)parameters
                          image:(UIImage*)image
              completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler{
    
    __weak AFAppWxAPIClient *weakClient = self;
    
    NSString* URL = [AFAppWxAPIBaseURLString stringByAppendingString:URLString];
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
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
                        completionHandler(response, responseObject, error);
                  }];
    
    [uploadTask resume];
    return uploadTask;
}

@end
