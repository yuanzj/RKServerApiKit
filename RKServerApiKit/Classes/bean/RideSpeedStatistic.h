//
//  RideSpeedStatistic.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import <Realm/Realm.h>

@interface RideSpeedStatistic : RLMObject

//time: 统计的日期
//speed: 速度
@property (copy, nonatomic) NSString * time;
@property (copy, nonatomic) NSString * speed;


@end

@interface RideSpeedStatisticResponse : BaseResponse

@property (strong, nonatomic) NSArray* data4;

@end

RLM_ARRAY_TYPE(RideSpeedStatistic)
