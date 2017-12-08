//
//  RealmManager.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/25.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "RealmManager.h"
#import "RideDayStatistic.h"
#import "RideDayStatisticDb.h"
#import "RideSpeedStatisticDb.h"
#import "RideMilesStatisticDb.h"
#import "PayGood.h"
#import "SimChargeOrder.h"

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
        [User setUser:nil];
    }
    
}

+ (User*)queryUser{
    return [[User allObjects] firstObject];
}

+ (Token*)queryToken{
    return [[Token allObjects] firstObject];
}

+ (void)saveToken:(Token *)_Token {
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    RLMResults<Token *> *tokens = [Token allObjects];
    [realm beginWriteTransaction];
    if (tokens.count > 0) {
        [realm deleteObjects:tokens];
    }
    [realm addObject:_Token];
    [realm commitWriteTransaction];
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
    if (mAuthCodeData.ueSn) {
        if( ![AuthCodeData objectForPrimaryKey:mAuthCodeData.ueSn]){
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm beginWriteTransaction];
            [realm addObject:mAuthCodeData];
            [realm commitWriteTransaction];
        }
    }
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

+ (void)saveMessageList:(NSArray *)_message{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_message];
    [realm commitWriteTransaction];
}

+ (void)clearMessageList{
    RLMResults<MsgBean *> *mMsgBean = [MsgBean allObjects];
    
    if (mMsgBean) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mMsgBean];
        [realm commitWriteTransaction];
    }
}

+ (void)saveSimOrderList:(NSArray *)_SimOrder{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_SimOrder];
    [realm commitWriteTransaction];
}

+ (void)clearSimOrderList{
    RLMResults<SimChargeOrder *> *mSimChargeOrder = [SimChargeOrder allObjects];
    
    if (mSimChargeOrder) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mSimChargeOrder];
        [realm commitWriteTransaction];
    }
}

+ (void)saveRideDayStatistic:(RideDayStatistic*)rideDayStatistic{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:rideDayStatistic];
    [realm commitWriteTransaction];
}

+ (void)clearRideDayStatistic{
    RLMResults<RideDayStatistic *> *mRideDayStatistics = [RideDayStatistic allObjects];
    
    if (mRideDayStatistics) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mRideDayStatistics];
        [realm commitWriteTransaction];
    }
}

#pragma mark - RideDayStatisticDb
+ (void)saveRideDayStatisticDb:(RideDayStatisticDb*)rideDayStatisticDb{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:rideDayStatisticDb];
    [realm commitWriteTransaction];
}

+ (void)clearRideDayStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideDayStatisticDb *> *mRideDayStatisticDb = [RideDayStatisticDb objectsWithPredicate:pred];
    if (mRideDayStatisticDb) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mRideDayStatisticDb];
        [realm commitWriteTransaction];
    }
}

+ (RideDayStatisticDb *)queryRideDayStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideDayStatisticDb *> *mRideDayStatisticDb = [RideDayStatisticDb objectsWithPredicate:pred];
    return [mRideDayStatisticDb firstObject];
}

#pragma mark - RideSpeedStatistic
+ (void)saveRideSpeedStatistic:(NSArray *)_RideSpeedStatistic{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_RideSpeedStatistic];
    [realm commitWriteTransaction];
}

+ (void)clearRideSpeedStatistic{
    RLMResults<RideSpeedStatistic *> *mMsgBean = [RideSpeedStatistic allObjects];
    
    if (mMsgBean) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mMsgBean];
        [realm commitWriteTransaction];
    }
}

#pragma mark - RideSpeedStatisticDb
+ (void)clearRideSpeedStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideSpeedStatisticDb *> *mRideSpeedStatisticDb = [RideSpeedStatisticDb objectsWithPredicate:pred];
    if (mRideSpeedStatisticDb) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mRideSpeedStatisticDb];
        [realm commitWriteTransaction];
    }
}

+ (void)saveRideSpeedStatisticDb:(RideSpeedStatisticDb*) rideSpeedStatisticDb{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:rideSpeedStatisticDb];
    [realm commitWriteTransaction];
}

+ (RideSpeedStatisticDb *)queryRideSpeedStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideSpeedStatisticDb *> *mRideSpeedStatisticDb = [RideSpeedStatisticDb objectsWithPredicate:pred];
    return [mRideSpeedStatisticDb firstObject];
}

#pragma mark - RideMilesStatistic
+ (void)saveRideMilesStatistic:(NSArray *)_RideMilesStatistic{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_RideMilesStatistic];
    [realm commitWriteTransaction];
}

+ (void)clearRideMilesStatistic{
    RLMResults<RideMilesStatistic *> *mMsgBean = [RideMilesStatistic allObjects];
    
    if (mMsgBean) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mMsgBean];
        [realm commitWriteTransaction];
    }
}

#pragma mark - RideMilesStatisticDb
+ (void)clearRideMilesStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideMilesStatisticDb *> *mRideMilesStatisticDb = [RideMilesStatisticDb objectsWithPredicate:pred];
    if (mRideMilesStatisticDb) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mRideMilesStatisticDb];
        [realm commitWriteTransaction];
    }
}

+ (void)saveRideMilesStatisticDb:(RideMilesStatisticDb*) rideMilesStatisticDb{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:rideMilesStatisticDb];
    [realm commitWriteTransaction];
}

+ (RideMilesStatisticDb *)queryRideMilesStatisticDbBySn:(NSString*)ueSn{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"ueSn = %@", ueSn];
    RLMResults<RideMilesStatisticDb *> *mRideMilesStatisticDb = [RideMilesStatisticDb objectsWithPredicate:pred];
    return [mRideMilesStatisticDb firstObject];
}

#pragma mark - RideMilesStatistic
+ (void)saveRideRecordList:(NSArray *)_RideRecord{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_RideRecord];
    [realm commitWriteTransaction];
}

+ (void)clearRideRecordList{
    RLMResults<RideRecord *> *mMsgBean = [RideRecord allObjects];
    
    if (mMsgBean) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mMsgBean];
        [realm commitWriteTransaction];
    }
}

+ (void)saveGeolocationRepository:(GeolocationRepository *)_GeolocationRepository{
    
    _GeolocationRepository.insterDate = [NSDate date];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:_GeolocationRepository];
    [realm commitWriteTransaction];
    
    //最大缓存上限为 MAX_STORE_LOCATION_INFO 个地理位置
    RLMResults<GeolocationRepository *> *mGeolocationRepository = [[GeolocationRepository allObjects] sortedResultsUsingKeyPath:@"insterDate" ascending:YES];
    
    if (mGeolocationRepository && mGeolocationRepository.count > MAX_STORE_LOCATION_INFO) {
        
        NSMutableArray *delObjs = [[NSMutableArray alloc] init];
        for (int i = 0;i < (mGeolocationRepository.count - MAX_STORE_LOCATION_INFO); i++) {
            [delObjs addObject:[mGeolocationRepository objectAtIndex:i]];
        }
        
        [realm beginWriteTransaction];
        [realm deleteObjects:delObjs];
        [realm commitWriteTransaction];
        
    }
}

+ (GeolocationRepository*)queryGeolocationRepositoryWithLat:(NSString*)lat log:(NSString*)lon{
    
    RLMResults<GeolocationRepository *> *mGeolocationRepository =  [GeolocationRepository objectsWhere:[NSString stringWithFormat:@"lat = '%@' AND lon = '%@'",lat,lon ]];
    
    return [mGeolocationRepository firstObject];
    
}

+ (void)clearGeolocationRepository{
    RLMResults<GeolocationRepository *> *mGeolocationRepository = [GeolocationRepository allObjects];
    
    if (mGeolocationRepository) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mGeolocationRepository];
        [realm commitWriteTransaction];
    }
}

+ (void)saveLoginedUser:(LoginedUser *)_LoginedUser {
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    RLMResults<LoginedUser *> *loginedUsers = [LoginedUser allObjects];
    [realm beginWriteTransaction];
    if (loginedUsers.count > 0) {
        [realm deleteObjects:loginedUsers];
    }
    [realm addObject:_LoginedUser];
    [realm commitWriteTransaction];
}

+ (LoginedUser*)queryLoginedUser{
    return [[LoginedUser allObjects] firstObject];
}

+ (void)updateLoginedUser:(NSString*)roles {
    RLMResults<LoginedUser *> *mLoginedUser = [LoginedUser allObjects];
    [[RLMRealm defaultRealm] transactionWithBlock:^{
        [[mLoginedUser firstObject] setValue:roles forKeyPath:@"roles"];
    }];
}

+ (void)clearLoginedUser{
    // Delete all objects from the realm
    RLMResults<LoginedUser *> *loginedUsers = [LoginedUser allObjects];
    
    if (loginedUsers) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:loginedUsers];
        [realm commitWriteTransaction];
    }
    
}

+ (void)clearPaygoodList{
//    // Delete all objects from the realm
    RLMResults<PayGood *> *mPayGoodList = [PayGood allObjects];
    
    if (mPayGoodList) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:mPayGoodList];
        [realm commitWriteTransaction];
    }
}

+ (void)savePaygoodList:(NSArray *)_PayGoodList{
//    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObjects:_PayGoodList];
    [realm commitWriteTransaction];
}

@end
