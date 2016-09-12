//
//  RideRecordDetail.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "RideRecordDetail.h"

@implementation RideRecordDetail

-(NSString*)description{
    
    return [@{@"time":_time,
              @"lon":_lon,
              @"lat":_lat,
              @"speed":_speed} description];
    
}

@end

@implementation RideRecordDetailResponse

-(NSString*)description{
    return [NSString stringWithFormat:@"%@ RideRecordDetail: %@",[super description], [_data5 description]];
}

@end
