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

@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) NSString* nickname;
@property (strong, nonatomic) NSString* headImgUrl;
@property (strong, nonatomic) NSString* mobile;

+ (void)setUserInfo:(UserInfo *)_UserInfo;

+ (UserInfo *)getUserInfo;

@end
