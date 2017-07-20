//
//  AFAppWxAPIClient.h
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFURLSessionManager.h>

#ifdef DEV_SERVER_MODEL
static NSString * const AFAppWxAPIBaseURLString = @"https://api.weixin.qq.com/";
#else
static NSString * const AFAppWxAPIBaseURLString = @"https://api.weixin.qq.com/";
#endif

@interface AFAppWxAPIClient : AFURLSessionManager

+ (instancetype)sharedClient;

- (NSURLSessionDataTask*)GET:(NSString *)URLString
                  parameters:(id)parameters
           completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

- (NSURLSessionDataTask*)POST:(NSString *)URLString
                   parameters:(id)parameters
            completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

- (NSURLSessionDataTask*)UPLOAD:(NSString *)URLString
                     parameters:(id)parameters
                          image:(UIImage*)image
              completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
