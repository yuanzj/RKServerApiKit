//
//  BatteryStatusInRedis.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "BatteryStatusInRedis.h"

@implementation BatteryStatusInRedis
-(NSString*)description{
    return [NSString stringWithFormat:@"batteryStatus: %@ remainCapacity: %@ electricPercent: %@ socSoh: %@ soc: %@ voltage: %@ current: %@ temperature: %@ modifyTime: %@",_batteryStatus,_remainCapacity, _electricPercent, _socSoh, _soc, _voltage, _current, _temperature, _modifyTime];
}
@end
