//
//  AFAppUploadAPIClient.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//
/**
 * 1.iOS9 HTTP 访问安全设置
 *    info.plist中App Transport Security Settings
 *    Allow Arbitrary Loads Yes
 * 2.AFNetworking acceptableContentTypes类型增加text/plain
 */
#import <Foundation/Foundation.h>
#import <AFNetworking/AFURLSessionManager.h>
#import "ApiNotNeedSessionIdDic.h"
#import "Constant.h"
#import "Validator.h"
#import "BaseResponse.h"
#import <MJExtension/MJExtension.h>
#import "UserService.h"
#import "User.h"
#import <CocoaSecurity/CocoaSecurity.h>

#ifdef DEV_SERVER_MODEL
static NSString * const AFAppUploadAPIBaseURLString = @"http://httpupload.rokyinfo.net/SpiritServiceApp/";
#else
static NSString * const AFAppUploadAPIBaseURLString = @"http://httpupload.rokyinfo.net/SpiritServiceApp/";
#endif

#define SERVICE_ID @"serviceId"
#define TOKEN @"token"

@interface AFAppUploadAPIClient : AFURLSessionManager

@property (nonatomic, copy             ) NSString *serviceId;

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
