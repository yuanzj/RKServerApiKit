//
//  GetAuthTokenResp.h
//  Pods
//
//  Created by caoyy on 17/7/20.
//
//

#import <Foundation/Foundation.h>

@interface GetAuthTokenError : NSObject

@property (strong, nonatomic) NSString* msg;
@property (strong, nonatomic) NSString* path;
@property (assign, nonatomic) int code;

@end

@interface GetAuthTokenResp : NSObject

@property (copy, nonatomic) NSString* status;
@property (copy, nonatomic) NSString* token;
@property(strong, nonatomic) GetAuthTokenError* error;

@end
