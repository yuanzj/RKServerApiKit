//
//  UeInfo.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/27.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BaseResponse.h"
#import "Firm.h"
#import "UeStatus.h"
#import "AccessoryUE.h"
#import <Realm/Realm.h>

@interface UeInfo : RLMObject

@property (strong, nonatomic) NSString    * balance;
@property (strong, nonatomic) NSString    * expirationDate;
@property (strong, nonatomic) NSString    * createTime;
@property (strong, nonatomic) Firm        * firm;
@property (strong, nonatomic) UeStatus    * ueStatus;
@property (strong, nonatomic) NSString    * iccid;
@property (strong, nonatomic) NSString    * imei;
@property (strong, nonatomic) NSString    * imsi;
@property (strong, nonatomic) NSString    * isOnLine;
@property (strong, nonatomic) NSString    * mac;
@property (strong, nonatomic) NSString    * mac2;
@property (strong, nonatomic) NSString    * openCardDate;
@property (strong, nonatomic) NSString    * polepairs;
@property (strong, nonatomic) NSString    * relation;
@property (strong, nonatomic) NSString    * simPhone;
@property (strong, nonatomic) NSString    * type;
@property (strong, nonatomic) NSString    * ueSn;
@property (strong, nonatomic) NSString    * wheelSize;
@property (strong, nonatomic) NSString    * authStatus;
@property (strong, nonatomic) NSString    * photoUrl;
@property (strong, nonatomic) NSString    * nickname;
@property (strong, nonatomic) NSString    * vehicleTypeId;
//中控设备拥有的附属设备
@property (strong, nonatomic) NSArray     * accessoryUEs;

@property (strong, nonatomic) RLMArray<AccessoryUE *><AccessoryUE> *storeAccessoryUEs;

@end

RLM_ARRAY_TYPE(UeInfo)
