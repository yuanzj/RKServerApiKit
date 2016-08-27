//
//  ExtendCCBean.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import "RKSByteConvert.h"
#import "BatteryStatusInRedis.h"

@interface ExtendCCBean : NSObject

/**
 * 车辆故障信息
 * 7个字节的hex字符串
 */
@property (strong, nonatomic) NSString* carFault;
/**
 * 车辆状态
 * 0：设防 1：撤防
 */
@property (strong, nonatomic) NSString* carStatus;
/**
 * 行驶里程(hex字符串)
 */
@property (strong, nonatomic) NSString* travelMiles;
/**
 * 行驶里程值
 */
@property (assign, nonatomic) int travelMilesValue;
/**
 * 对应610设备的SN
 */
@property (strong, nonatomic) NSString* gpsSN;
/**
 * 最后上报数据时间
 */
@property (strong, nonatomic) NSString* lastReportTime;
/**
 * 经度
 */
@property (assign, nonatomic) double lon;
/**
 * 纬度
 */
@property (assign, nonatomic) double lat;
/**
 * acc
 */
@property (strong, nonatomic) NSString* acc;
/**
 * 速度
 */
@property (assign, nonatomic) double ve;
/**
 * 最后定位时间
 */
@property (strong, nonatomic) NSString* lastLocationTime;
/**
 * gps gsm bat
 */
@property (strong, nonatomic) NSString* gpsGsmBat;
/**
 * 经纬度标示
 */
@property (strong, nonatomic) NSString* lonLatFlag;
/**
 * 方位角
 */
@property (strong, nonatomic) NSString* azimuth;

@property (strong, nonatomic  ) BatteryStatusInRedis * batteryStatusInRedis;

@end
