//
//  RideDayStatisticDb.h
//  Pods
//
//  Created by caoyy on 17/2/22.
//
//

#import <Realm/Realm.h>
#import "RideDayStatistic.h"

@interface RideDayStatisticDb : RLMObject

@property (strong, nonatomic) NSString* ueSn;
@property (strong, nonatomic) RideDayStatistic* rideDayStatistic;

@end
