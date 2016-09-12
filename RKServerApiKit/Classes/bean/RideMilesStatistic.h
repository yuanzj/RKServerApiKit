//
//  RideMilesStatistic.h
//  Pods
//
//  Created by apple on 16/9/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import <Realm/Realm.h>

@interface RideMilesStatistic : RLMObject
//time:统计的日期
//miles:里程
@property (copy, nonatomic) NSString * time;
@property (copy, nonatomic) NSString * miles;

@end

@interface RideMilesStatisticResponse : BaseResponse

@property (strong, nonatomic) NSArray* data4;

@end

RLM_ARRAY_TYPE(RideMilesStatistic)