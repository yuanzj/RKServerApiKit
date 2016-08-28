//
//  RealmManager.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/25.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserInfo.h"
#import "UeInfo.h"

@interface RealmManager : NSObject

#pragma mark - User
+ (void)saveUser:(User *)_User;

+ (void)clearUser;

+ (User*)queryUser;

#pragma mark - UserInfo
+ (void)saveUserInfo:(UserInfo *)_User;

+ (void)clearUserInfo;

+ (UserInfo*)queryUserInfo;

#pragma mark - UeInfo
+ (void)saveUeInfoList:(UeInfo *)_UeInfo;

+(void)delUeInfo:(UeInfo *)_UeInfo;

+ (void)clearUeInfoList;

@end
