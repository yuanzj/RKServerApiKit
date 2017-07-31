//
//  UserInfo.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"
#import <Realm/Realm.h>

@interface UserInfo : RLMObject

@property (copy, nonatomic) NSString* id;
@property (copy, nonatomic) NSString* phoneNumber;
@property (copy, nonatomic) NSString* username;
@property (copy, nonatomic) NSString* nickname;
@property (copy, nonatomic) NSString* createTime;
@property (copy, nonatomic) NSString* status;
@property (copy, nonatomic) NSString* identityNumber;
@property (copy, nonatomic) NSString* realname;
@property (copy, nonatomic) NSString* address;
@property (copy, nonatomic) NSString* headimgUrl;
@property (copy, nonatomic) NSString* gender;
@property (assign, nonatomic) double lat;
@property (assign, nonatomic) double lon;
@property (copy, nonatomic) NSString* locationTime;
@property (copy, nonatomic) NSString* modifyTime;
@property (copy, nonatomic) NSString* roles;

+ (void)setUserInfo:(UserInfo *)_UserInfo;

+ (UserInfo *)getUserInfo;

@end
