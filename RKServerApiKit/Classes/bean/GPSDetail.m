//
//  GPSDetail.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "GPSDetail.h"

@implementation GPSDetail
-(NSString*)description{
    return [@{@"IMEI":_IMEI,
              @"ICCID":_iccid,
              @"outElecStatus":_outElecStatus,
              @"activeTime":_activeTime,
              @"warrantyTime":_warrantyTime,
              @"gpsBattery":_gpsBattery,
              @"gpsSignal":_gpsSignal,
              @"gpsSatellite":_gpsSatellite,
              @"onlineStatus":_onlineStatus,
              @"lastReportTime":_lastReportTime,
              @"simPhone":_simPhone,
              @"imsi":_imsi,
              @"totalFlow":_totalFlow,
              @"usedFlow":_usedFlow,
              @"expireDate":_expireDate} description];
}
@end

@implementation GPSDetailResponse

-(NSString*)description{
    
    return [NSString stringWithFormat:@"%@ GPSDetail: %@",[super description], [_data description]];
    
}

@end
