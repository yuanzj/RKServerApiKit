//
//  TokenResponse.h
//  Pods
//
//  Created by caoyy on 17/4/7.
//
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "BaseResponse.h"

@interface Token : RLMObject

@property (strong, nonatomic) NSString* access_token;
@property (strong, nonatomic) NSString* expires_in;
@property (strong, nonatomic) NSString* token_type;

+ (void)setToken:(Token *)_Token;

+ (Token *)getToken;

@end

@interface TokenResponse : BaseResponse

@property (strong, nonatomic) Token* data;

@end
