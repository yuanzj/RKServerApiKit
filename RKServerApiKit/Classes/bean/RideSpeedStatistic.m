//
//  RideSpeedStatistic.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "RideSpeedStatistic.h"

@implementation RideSpeedStatistic
-(NSString*)description{
    return [@{@"time":_time,@"speed":_speed} description];
}
@end

@implementation RideSpeedStatisticResponse

-(NSString*)description{
    return [NSString stringWithFormat:@"%@ RideSpeedStatisticList: %@",[super description], [_data4 description]];
}

@end