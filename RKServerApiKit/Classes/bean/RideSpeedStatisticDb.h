//
//  RideSpeedStatisticDb.h
//  Pods
//
//  Created by caoyy on 17/2/22.
//
//

#import <Realm/Realm.h>
#import "RideSpeedStatistic.h"

@interface RideSpeedStatisticDb : RLMObject

@property (strong, nonatomic) NSString* ueSn;
@property (strong, nonatomic) RLMArray<RideSpeedStatistic>* rideSpeedStatistics;

@end
