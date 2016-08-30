//
//  RealmManager.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/25.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "RealmManager.h"

@implementation RealmManager

#pragma mark - User
/***************已登录用户数据操作*****************/
+ (void)saveUser:(User *)_User{
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    RLMResults<User *> *users = [User allObjects];
    [realm beginWriteTransaction];
    if (users.count > 0) {
        [realm deleteObjects:users];
    }
    [realm addObject:_User];
    [realm commitWriteTransaction];
}

+ (void)clearUser{
    
    RLMResults<User *> *users = [User allObjects];
    if (users.count > 0) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        // Delete all objects from the realm
        [realm beginWriteTransaction];
        [realm deleteObjects:users];
        [realm commitWriteTransaction];
    }
    
}

+ (User*)queryUser{
    return [[User allObjects] firstObject];
}

#pragma mark - UserInfo

+ (void)saveUserInfo:(UserInfo *)_User{
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    RLMResults<UserInfo *> *users = [UserInfo allObjects];
    [realm beginWriteTransaction];
    if (users) {
         [realm deleteObjects:users];
    }
    [realm addObject:_User];
    [realm commitWriteTransaction];
}

+ (void)clearUserInfo{
    // Delete all objects from the realm
    RLMResults<UserInfo *> *users = [UserInfo allObjects];
   
    if (users) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:users];
        [realm commitWriteTransaction];
    }
    
}

+ (UserInfo*)queryUserInfo{
    return [[UserInfo allObjects] firstObject];
}

#pragma mark - UeInfo
+ (void)saveUeInfoList:(NSArray *)_UeInfoList{
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];

    [realm beginWriteTransaction];
    [realm addObjects:_UeInfoList];
    [realm commitWriteTransaction];
}


+(void)delUeInfo:(UeInfo *)_UeInfo{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:_UeInfo];
    [realm commitWriteTransaction];
}

+ (void)clearUeInfoList{
    // Delete all objects from the realm
    RLMResults<UeInfo *> *mUeInfoList = [UeInfo allObjects];
    
    if (mUeInfoList) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mUeInfoList];
        [realm commitWriteTransaction];
    }
}

#pragma mark - AuthCodeData
+ (void)saveAuthCodeData:(AuthCodeData *)mAuthCodeData{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:mAuthCodeData];
    [realm commitWriteTransaction];
}

+ (void)clearAuthCodeData{
    RLMResults<AuthCodeData *> *mAuthCodeData = [AuthCodeData allObjects];
    
    if (mAuthCodeData) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mAuthCodeData];
        [realm commitWriteTransaction];
    }
}

@end
