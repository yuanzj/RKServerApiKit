//
//  RideRecord.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "RideRecord.h"

@implementation RideRecord

//day:日期
//startTime:开始时间
//endTime:结束时间
//distance:距离
//totalTime:总用时，单位分钟
//startLon:开始经度
//startLat:开始纬度
//endLon:结束经度
//endLat:结束纬度
//highestSpeed:最高速度
//averageSpeed:平均速度

-(NSString*)description{
    return [@{@"day":_day,
              @"startTime":_startTime,
              @"endTime":_endTime,
              @"distance":@(_distance),
              @"totalTime":_totalTime,
              @"startLon":_startLon,
              @"startLat":_startLat,
              @"endLon":_endLon,
              @"endLat":_endLat,
              @"highestSpeed":@(_highestSpeed),
              @"averageSpeed":@(_averageSpeed)} description];
}

@end

@implementation RideRecordResponse

-(NSString*)description{
    return [NSString stringWithFormat:@"%@ RideRecordList: %@",[super description], [_data5 description]];
}

@end