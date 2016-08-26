//
//  User.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/21.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "BaseResponse.h"

@interface User : RLMObject

@property (strong, nonatomic) NSString* username;
@property (strong, nonatomic) NSString* password;
@property (strong, nonatomic) NSString* sessionId;
@property (strong, nonatomic) NSString* userId;

+ (void)setUser:(User *)_User;

+ (User *)getUser;

@end

@interface LoginUser : NSObject

//{"sessionId":"806dd3cf-a651-4475-8363-7b8532bd6283","userKey":"1022910","role":"0","lockpass":"00010204060708","locktype":"0"}
@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) NSString* sessionId;
@property (strong, nonatomic) NSString* role;
@property (strong, nonatomic) NSString* lockpass;
@property (strong, nonatomic) NSString* locktype;

@end

@interface UserResponse : BaseResponse

@property (strong, nonatomic) LoginUser* data;

@end
