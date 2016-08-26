//
//  BatteryStatusInRedis.h
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BatteryStatusInRedis : NSObject
/**
 * 电池状态
 */
@property (strong, nonatomic) NSString* batteryStatus;
/**
 * 电池剩余电量(hex字符串)
 */
@property (strong, nonatomic) NSString* remainCapacity;
/**
 * 电池剩余电量百分比,蓝牙同步进来(非web的json字段)
 */
@property (strong, nonatomic) NSString* electricPercent;
/**
 * 电池健康状况
 */
@property (strong, nonatomic) NSString* socSoh;
/**
 * 电池剩余电量百分比值(非web的json字段)
 */
@property (strong, nonatomic) NSString* soc;
/**
 * 电池电压
 */
@property (strong, nonatomic) NSString* voltage;
/**
 * 电池电流
 */
@property (strong, nonatomic) NSString* current;
/**
 * 电池温度
 */
@property (strong, nonatomic) NSString* temperature;
/**
 * 电池信息更新时间
 */
@property (strong, nonatomic) NSString* modifyTime;
@end
