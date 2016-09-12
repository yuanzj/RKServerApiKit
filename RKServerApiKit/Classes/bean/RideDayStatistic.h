//
//  RideDayStatistic.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface RideDayStatistic : NSObject

@property (copy, nonatomic) NSString* dayTotalMiles;
@property (copy, nonatomic) NSString* dayTotalTime;
@property (copy, nonatomic) NSString* dayAverageSpeed;

@end

@interface RideDayStatisticResponse : BaseResponse

@property (strong, nonatomic) RideDayStatistic* data;

@end
