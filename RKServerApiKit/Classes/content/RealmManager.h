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
#import "AuthCodeData.h"
#import "MsgBean.h"
#import "RideSpeedStatistic.h"
#import "RideMilesStatistic.h"
#import "RideRecord.h"
#import "GeolocationRepository.h"

#define MAX_STORE_LOCATION_INFO 1000

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
+ (void)saveUeInfoList:(NSArray *)_UeInfo;

+ (void)delUeInfo:(UeInfo *)_UeInfo;

+ (void)clearUeInfoList;

#pragma mark - AuthCodeData
+ (void)saveAuthCodeData:(AuthCodeData *)_User;

+ (void)clearAuthCodeData;


#pragma mark - MsgBean
+ (void)saveMessageList:(NSArray *)_message;

+ (void)clearMessageList;

#pragma mark - RideSpeedStatistic
+ (void)saveRideSpeedStatistic:(NSArray *)_RideSpeedStatistic;

+ (void)clearRideSpeedStatistic;

#pragma mark - RideMilesStatistic
+ (void)saveRideMilesStatistic:(NSArray *)_RideMilesStatistic;

+ (void)clearRideMilesStatistic;

#pragma mark - RideRecordList
+ (void)saveRideRecordList:(NSArray *)_RideRecord;

+ (void)clearRideRecordList;

#pragma mark - GeolocationRepository
+ (void)saveGeolocationRepository:(GeolocationRepository *)_GeolocationRepository;

+ (GeolocationRepository*)queryGeolocationRepositoryWithLat:(NSString*)lat log:(NSString*)log;

+ (void)clearGeolocationRepository;



@end
