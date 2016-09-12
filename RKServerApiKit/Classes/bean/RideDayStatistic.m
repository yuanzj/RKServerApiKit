//
//  RideDayStatistic.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "RideDayStatistic.h"

@implementation RideDayStatistic

-(NSString*)description{
    return [NSString stringWithFormat:@"dayTotalMiles: %@,dayTotalTime: %@,dayAverageSpeed: %@",_dayTotalMiles,_dayTotalTime,_dayAverageSpeed];
}

@end

@implementation RideDayStatisticResponse

-(NSString*)description{
    
    return [NSString stringWithFormat:@"%@ RideDayStatistic: %@",[super description], [_data description]];
    
}

@end