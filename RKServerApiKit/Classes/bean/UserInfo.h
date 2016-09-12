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

@property (copy, nonatomic) NSString* userId;
@property (copy, nonatomic) NSString* gender;
@property (copy, nonatomic) NSString* nickname;
@property (copy, nonatomic) NSString* headImgUrl;
@property (copy, nonatomic) NSString* mobile;

+ (void)setUserInfo:(UserInfo *)_UserInfo;

+ (UserInfo *)getUserInfo;

@end
