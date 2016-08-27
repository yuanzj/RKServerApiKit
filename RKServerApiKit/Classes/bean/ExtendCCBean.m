//
//  ExtendCCBean.m
//  RKServerApi-iOS
//
//  Created by caoyy on 16/7/28.
//  Copyright © 2016年 roky. All rights reserved.
//

#import "ExtendCCBean.h"

@implementation ExtendCCBean
-(NSString*)description{
    return [NSString stringWithFormat:@"carFault: %@ carStatus: %@ travelMiles: %@ travelMilesValue: %@ gpsSN: %@ lastReportTime: %@ lon: %@ lat: %@ acc: %@ ve: %@ lastLocationTime: %@ gpsGsmBat: %@ lonLatFlag: %@ azimuth: %@ batteryStatusInRedis %@",_carFault,_carStatus, _travelMiles, @(_travelMilesValue), _gpsSN, _lastReportTime, @(_lon), @(_lat), _acc, @(_ve), _lastReportTime, _gpsGsmBat, _lonLatFlag, _azimuth, [_batteryStatusInRedis description]];
}

-(int)travelMilesValue{
    if (self.travelMiles) {
        Byte temp[4];
        [[[[CocoaSecurityDecoder alloc] init] hex:self.travelMiles] getBytes:temp length:4];
        return [RKSByteConvert bytesToUint:temp];
    } else {
        return 0;
    }
}
@end
