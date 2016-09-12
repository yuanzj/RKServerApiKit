//
//  RideMilesStatistic.m
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import "RideMilesStatistic.h"

@implementation RideMilesStatistic
-(NSString*)description{
    return [@{@"time":_time,@"miles":_miles} description];
}
@end

@implementation RideMilesStatisticResponse
-(NSString*)description{
    return [NSString stringWithFormat:@"%@ RideMilesStatisticList: %@",[super description], [_data4 description]];
}
@end