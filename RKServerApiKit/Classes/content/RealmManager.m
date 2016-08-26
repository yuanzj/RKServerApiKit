//
//  RealmManager.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/25.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "RealmManager.h"

@implementation RealmManager

/***************已登录用户数据操作*****************/
+ (void)saveUser:(User *)_User{
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm addObject:_User];
    [realm commitWriteTransaction];
}

+ (void)clearUser{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Delete all objects from the realm
    [realm beginWriteTransaction];
    [realm deleteObject:[User alloc]];
    [realm commitWriteTransaction];
}

+ (User*)queryUser{
    RLMResults<User *> *users = [User allObjects];
    if(users && users.count > 0){
        return users[0];
    }
    return nil;
}

@end
