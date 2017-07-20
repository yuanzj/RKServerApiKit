//
//  GetAccessTokenResp.h
//  Pods
//
//  Created by caoyy on 17/7/19.
//
//  微信AccessToken
//
//

#import <Foundation/Foundation.h>

@interface GetAccessTokenResp : NSObject

@property (strong, nonatomic) NSString* access_token;
@property (assign, nonatomic) int expires_in;
@property (strong, nonatomic) NSString* refresh_token;
@property (strong, nonatomic) NSString* openid;
@property (strong, nonatomic) NSString* scope;
@property (strong, nonatomic) NSString* unionid;

@end
